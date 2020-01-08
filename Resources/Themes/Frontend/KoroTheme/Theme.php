<?php

namespace Shopware\Themes\KoroTheme;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Korodrogerie Theme
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
8mylez
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;


    protected $css = array(
        'src/css/cookieconsent.min.css'
    );

    protected $javascript = [
        'src/js/custom.js',
        'src/js/jquery.art-lightbox.js',
        'src/js/jquery.imagelightbox.js',
        'src/js/jquery.emotion-image-loader.js',
        'src/js/jquery.wishlist-helper.js'
    ];

    public function createConfig(Form\Container\TabContainer $container)
    {
    }
}
