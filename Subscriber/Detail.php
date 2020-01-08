<?php

namespace EmzKoroTheme\Subscriber;

use Enlight\Event\SubscriberInterface;
use Doctrine\DBAL\Connection;
use Shopware\Components\Plugin\CachedConfigReader;
use Shopware\Bundle\StoreFrontBundle\Service\Core\MediaService;
use Shopware\Bundle\StoreFrontBundle\Service\Core\ContextService;

class Detail implements SubscriberInterface
{
    /**
     * @var Connection
     */
    private $connection;

    /**
     * @var CachedConfigReader
     */
    private $cachedConfigReader;

    /**
     * @var MediaService
     */
    private $mediaService;

    /**
     * @var ContextService
     */
    private $contextService;

    /**
     * @param Connection         $connection
     * @param CachedConfigReader $cachedConfigReader
     * @param MediaService       $mediaService
     * @param ContextService     $contextService
     */
    public function __construct(
        Connection $connection,
        CachedConfigReader $cachedConfigReader,
        MediaService $mediaService,
        ContextService $contextService
    ) {
        $this->connection = $connection;
        $this->cachedConfigReader = $cachedConfigReader;
        $this->mediaService = $mediaService;
        $this->contextService = $contextService;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PostDispatchSecure_Frontend_Detail' => 'onDetailDispatch',
        ];
    }

    /**
     * Listener-method for Detail-Dispatch.
     *
     * @param Enlight_Event_EventArgs $args
     */
    public function onDetailDispatch(\Enlight_Event_EventArgs $args)
    {
        /** @var Enlight_View_Default $view * */
        $view = $args->getSubject()->View();
        $config = $this->cachedConfigReader->getByPluginName('EmzKoroTheme');
        $result = [];

        $article = $view->getAssign('sArticle');
        $articleDetailsID = $article['articleDetailsID'];

        if (!$articleDetailsID) {
            return;
        }

        $configImages = [
            'emz_description_banner_media' => $this->getMediaName($articleDetailsID),
            'emz_pricehistory_banner_media' => $config['defaultPriceHistoryBanner'],
            'emz_compare_banner_media' => $config['defaultCompareBanner'],
            'emz_masonry_banner_media' => $config['defaultMasonryBanner'],
            'emz_blog_banner_media' => $config['defaultBlogBanner'],
            'emz_faq_banner_media' => $config['defaultFaqBanner'],
            'emz_vote_banner_media' => $config['defaultVoteBanner'],
        ];

        $configImages = array_filter($configImages);
        $configImagesFlipped = array_flip($configImages);

        foreach ($configImages as $image) {
            $imageNames[] = $image;
        }

        /** @var ShopContext $context */
        $context = $this->contextService->getShopContext();

        if ($imageNames) {
            $mediaData = $this->connection->createQueryBuilder()
                ->select('m.id', 'm.name')
                ->from('s_media', 'm')
                ->where('m.name IN(:imageNames)')
                ->setParameter('imageNames', $imageNames, Connection::PARAM_STR_ARRAY)
                ->execute()
                ->fetchAll();

            foreach ($mediaData as $mediaDatum) {
                if (!$mediaDatum['id'] || !$mediaDatum['name']) {
                    continue;
                }

                $mediaIds[] = $mediaDatum['id'];
                $relations[$mediaDatum['name']] = $mediaDatum['id'];
            }

            $mediaList = $this->mediaService->getList($mediaIds, $context);

            foreach ($configImagesFlipped as $imageName => $varName) {
                $result[$varName] = $mediaList[$relations[$imageName]];
            }
        }

        $view->assign($result);

        $productVideoID = $view->getAssign('sArticle')['emz_product_video'];

        if (!$productVideoID) {
            return;
        }

        $media = $this->mediaService->get($productVideoID, $context);

        if (!$media) {
            return;
        }

        $url = $media->getFile();

        $article['images'][] = [
            'thumbnails' => [[
                'sourceSet' => $url,
                'emzProductVideo' => 1,
            ]],
        ];

        $view->assign('sArticle', $article);
    }

    /**
     * Returns name of media-element for description.
     *
     * @param int $articleDetailsID
     *
     * @return string $mediaName
     */
    private function getMediaName($articleDetailsID)
    {
        $descriptionBannerName = $this->connection->createQueryBuilder()
            ->select('aa.emz_description_banner')
            ->from('s_articles_attributes', 'aa')
            ->where('aa.articledetailsID = :articleDetailsID')
            ->setParameter('articleDetailsID', $articleDetailsID)
            ->execute()
            ->fetch(\PDO::FETCH_COLUMN);

        if ($descriptionBannerName) {
            return $descriptionBannerName;
        }

        $config = $this->cachedConfigReader->getByPluginName('EmzKoroTheme');

        return $config['defaultDescriptionBanner'] ? $config['defaultDescriptionBanner'] : null;
    }
}
