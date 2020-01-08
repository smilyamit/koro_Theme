<?php

namespace EmzKoroTheme\Subscriber;

use Enlight\Event\SubscriberInterface;
use Doctrine\DBAL\Connection;
use Shopware\Bundle\EmotionBundle\ComponentHandler\BlogComponentHandler;
use Shopware\Bundle\StoreFrontBundle\Service\BlogServiceInterface;
use Shopware\Bundle\StoreFrontBundle\Service\ContextServiceInterface;
use Shopware\Components\Compatibility\LegacyStructConverter;

class Emotion implements SubscriberInterface
{
    const OFFSET_COUNTER = 10;

    /**
     * @var Connection
     */
    private $connection;

    /**
     * @var BlogServiceInterface $blogService
     */
    private $blogService;

    /**
     * @var ContextServiceInterface $contextService
     */
    private $contextService;

    /**
     * @var LegacyStructConverter $converter
     */
    private $converter;

    /**
     * @param Connection $connection
     * @param BlogServiceInterface $blogService
     * @param ContextServiceInterface $contextService
     * @param LegacyStructConverter $converter
     */
    public function __construct(
        Connection $connection,
        BlogServiceInterface $blogService,
        ContextServiceInterface $contextService,
        LegacyStructConverter $converter
    ) {
        $this->connection = $connection;
        $this->blogService = $blogService;
        $this->contextService = $contextService;
        $this->converter = $converter;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PostDispatchSecure_Widgets_Emotion' => 'onEmotionDispatch'
        ];
    }

    /**
     * Listener-method for Detail-Dispatch
     *
     * @param Enlight_Event_EventArgs $args
     *
     * @return void
     */
    public function onEmotionDispatch(\Enlight_Event_EventArgs $args)
    {
        $controller = $args->getSubject();
        $view = $controller->View();

        $sEmotions = $view->getAssign('sEmotions');

        foreach ($sEmotions as &$emotion) {
            foreach ($emotion['elements'] as &$element) {

                //if sw-blog-component
                if ($element['component']['type'] == BlogComponentHandler::COMPONENT_NAME) {

                    //fill 'empty' entries
                    $entries = $this->populateEntries(
                        $element['data']['entries'],
                        $element['config']['entry_amount'],
                        $element['config']['blog_entry_selection'],
                        $element['config']['entry_amount']
                    );

                    //reassign populated entries
                    $element['data']['entries'] = $entries;
                }
            }
        }

        $view->assign('sEmotions', $sEmotions);
    }

    /**
     * Helper method to fill the entries-array with active blogarticles (important for translations)
     * 
     * @param array $entries
     * @param int   $numberOfEntries
     * @param int   $categoryId
     * @param int   $offset
     * 
     * @return array $entries
     */
    private function populateEntries(array $entries, $numberOfEntries, $categoryId, $offset)
    {
        $activeEntries = [];

        foreach ($entries as $entry) {
            if ($entry['active']) {
                $activeEntries[] = $entry;
            }

            if (count($activeEntries) >= $numberOfEntries) {
                return $activeEntries;
            }
        }

        $blogIds = $this->connection->createQueryBuilder()
            ->select('blog.id')
            ->from('s_blog', 'blog')
            ->leftJoin('blog', 's_categories', 'category', 'blog.category_id = category.id')
            //also get not-active-blogposts in case there are active translations
            ->andWhere('blog.display_date <= :displayDate')
            ->andWhere('(category.path LIKE :path OR category.id = :categoryId)')
            ->orderBy('blog.display_date', 'DESC')
            ->setFirstResult($offset)
            ->setMaxResults(self::OFFSET_COUNTER)
            ->setParameter('displayDate', date('Y-m-d H:i:s'))
            ->setParameter('categoryId', $categoryId)
            ->setParameter('path', '%|' . $categoryId . '|%')
            ->execute()
            ->fetchAll(\PDO::FETCH_COLUMN);

        if (!$blogIds) {
            return $entries;
        }

        $context = $this->contextService->getShopContext();
        
        $usedBlogIds = [];
        $blogEntries = $this->blogService->getList($blogIds, $context);

        foreach ($entries as $entry) {
            if (!in_array($entry['id'], $usedBlogIds)) {
                $usedBlogIds[] = $entry['id'];
            }
        }

        // prevent double blog-entries
        foreach ($blogEntries as $blog) {
            if (!in_array($blog->getId(), $usedBlogIds)) {
                $usedBlogIds[] = $blog->getId();
                $entries[] = $this->converter->convertBlogStruct($blog);
            }
        }

        $entries = $this->populateEntries(
            $entries,
            $numberOfEntries,
            $categoryId,
            $offset + self::OFFSET_COUNTER
        );

        return $entries;
    }
}
