<?php

namespace EmzKoroTheme;

use Shopware\Components\Plugin;
use Shopware\Components\Plugin\Context\InstallContext;
use Shopware\Components\Plugin\Context\UninstallContext;
use Shopware\Components\Plugin\Context\UpdateContext;
use Shopware\Components\Plugin\Context\ActivateContext;
use Shopware\Bundle\AttributeBundle\Service\CrudService;
use Shopware\Components\Models\ModelManager;
use Shopware\Bundle\AttributeBundle\Service\TypeMapping;

class EmzKoroTheme extends Plugin
{
    /**
     * Install-method.
     *
     * @param InstallContext $context
     */
    public function install(InstallContext $context)
    {
        $this->addAttributes();

        $context->scheduleClearCache(InstallContext::CACHE_LIST_ALL);
    }

    /**
     * Uninstall-method.
     *
     * @param UninstallContext $context
     */
    public function uninstall(UninstallContext $context)
    {
        $this->removeAttributes();

        $context->scheduleClearCache(UninstallContext::CACHE_LIST_ALL);
    }

    /**
     * Update-method.
     *
     * @param UpdateContext $context
     */
    public function update(UpdateContext $context)
    {
        $this->addAttributes();

        $context->scheduleClearCache(UpdateContext::CACHE_LIST_ALL);
    }

    /**
     * Activate-method.
     *
     * @param ActivateContext $context
     */
    public function activate(ActivateContext $context)
    {
        $context->scheduleClearCache(ActivateContext::CACHE_LIST_ALL);
    }

    /**
     * Add attributes used in theme.
     */
    private function addAttributes()
    {
        /** @var CrudService $crudService * */
        $crudService = $this->container->get('shopware_attribute.crud_service');

        /** @var ModelManager $modelManager * */
        $modelManager = $this->container->get('models');

        $crudService->update(
            's_articles_attributes',
            'emz_description_banner',
            TypeMapping::TYPE_STRING,
            [
                'label' => 'Individueller Beschreibungs-Banner',
                'translatable' => false,
                'displayInBackend' => true,
                'position' => 163,
                'custom' => false,
            ]
        );

        $crudService->update(
            's_core_countries_attributes',
            'emz_hide_country',
            TypeMapping::TYPE_BOOLEAN,
            [
                'label' => 'Land im Shop verstecken',
                'translatable' => true,
                'displayInBackend' => true,
                'position' => 1,
                'custom' => false,
            ]
        );

        $crudService->update(
            's_articles_attributes',
            'emz_product_video',
            TypeMapping::TYPE_SINGLE_SELECTION,
            [
                'label' => 'Loop-Video in den Artikelbildern',
                'supportText' => 'Video in den Produktbildern',
                'translatable' => false,
                'displayInBackend' => true,
                'entity' => 'Shopware\Models\Media\Media',
                'custom' => false,
            ]
        );

        $this->rebuildModels($modelManager);
    }

    /**
     * Helper-method to rebuild attribute models.
     *
     * @param ModelManager $modelManager
     */
    private function rebuildModels($modelManager)
    {
        $modelManager = $this->container->get('models');

        $modelManager->getConfiguration()->getMetadataCacheImpl()->deleteAll();
        $modelManager->generateAttributeModels([
            's_articles_attributes',
            's_core_countries_attributes',
        ]);
    }

    /**
     * Removes attributes used in theme.
     */
    private function removeAttributes()
    {
        /** @var CrudService $crudService * */
        $crudService = $this->container->get('shopware_attribute.crud_service');

        /** @var ModelManager $modelManager * */
        $modelManager = $this->container->get('models');

        $crudService->delete('s_articles_attributes', 'emz_description_banner');
        $crudService->delete('s_core_countries_attributes', 'emz_hide_country');
        $crudService->delete('s_articles_attributes', 'emz_product_video');

        $this->rebuildModels($modelManager);
    }
}
