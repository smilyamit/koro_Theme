<?php

namespace EmzKoroTheme\Subscriber;

use Enlight\Event\SubscriberInterface;
use Shopware\Bundle\StoreFrontBundle\Service\Core\ContextService;
use Shopware\Bundle\StoreFrontBundle\Service\Core\LocationService;
use Shopware\Components\Compatibility\LegacyStructConverter;

class Address implements SubscriberInterface
{
    /**
     * @var ContextService
     */
    private $contextService;

    /**
     * @var LocationService
     */
    private $locationService;

    /**
     * @var LegacyStructConverter
     */
    private $legacyStructConverter;

    /**
     * Constructor.
     *
     * @param ContextService            $contextService
     * @param LocationService           $locationService
     * @param LegacyStructConverter     $legacyStructConverter
     */
    public function __construct(
        ContextService $contextService,
        LocationService $locationService,
        LegacyStructConverter $legacyStructConverter
    ) {
        $this->contextService           = $contextService;
        $this->locationService          = $locationService;
        $this->legacyStructConverter    = $legacyStructConverter;
    }

    /**
     * @return array
     */
    public static function getSubscribedEvents()
    {
        return [
            'Enlight_Controller_Action_PostDispatchSecure_Frontend_Address' => 'onPostDisptachSecureAddress'
        ];
    }

    /**
     * Listener-method for Address-DispatchSecure
     *
     * @param Enlight_Event_EventArgs $args
     * @return void
     */
    public function onPostDisptachSecureAddress(\Enlight_Event_EventArgs $args)
    {
        /** @var Enlight_View_Default $view **/
        $view = $args->getSubject()->View();
        
        /**
         * Only replace it, if this variable exists
         */
        if ($view->getAssign('countryList')){
            $view->assign('countryList', $this->getCountries());
        }
    }

    /**
     * @return array
     */
    private function getCountries()
    {
        $context    = $this->contextService->getShopContext();
        $countries  = $this->locationService->getCountries($context);
        
        return $this->legacyStructConverter->convertCountryStructList($countries);
    }
}
