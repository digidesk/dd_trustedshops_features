<?php
/**
 *
 *     |o     o    |          |
 * ,---|.,---..,---|,---.,---.|__/
 * |   |||   |||   ||---'`---.|  \
 * `---'``---|``---'`---'`---'`   `
 *       `---'    [media solutions]
 *
 * @copyright   (c) digidesk - media solutions
 * @link            http://www.digidesk.de
 * @author          digidesk - media solutions
 * @license         https://raw.githubusercontent.com/digidesk/dd_trustedshops_features/master/20210812_TS-licence_Oxid_EN_v1.1.txt
 */

/**
 * Metadata version
 */
$sMetadataVersion = '2.1';

/**
 * Module information
 */
$aModule = [
    'id'          => 'dd_trustedshops_features',
    'title'       => 'Trusted Shops Reviews Toolkit',
    'description' => [
        'de' => 'Dieses Modul erm&ouml;glicht die Integration der Trusted Shops Features.',
        'en' => 'This module brings the Trusted Shops Features integration.',
        'fr' => '',
    ],
    'thumbnail'   => 'module.png',
    'version'     => '3.0.0',
    'author'      => 'digidesk - media solutions',
    'url'         => 'https://www.digidesk.de/',
    'email'       => 'support@digidesk.de',
    'extend'      => [
        \OxidEsales\Eshop\Application\Controller\ArticleDetailsController::class => \DigideskMediaSolutions\TrustedShops\Controller\ArticleDetailsController::class,
        \OxidEsales\Eshop\Application\Controller\ThankYouController::class       => \DigideskMediaSolutions\TrustedShops\Controller\ThankYouController::class,
        \OxidEsales\Eshop\Core\ViewConfig::class                                 => \DigideskMediaSolutions\TrustedShops\Core\ViewConfig::class,
        \OxidEsales\Eshop\Application\Component\Widget\ArticleDetails::class     => \DigideskMediaSolutions\TrustedShops\Component\Widget\ArticleDetails::class,
    ],
    'controllers' => [
        'dd_trustedshops_features' => DigideskMediaSolutions\TrustedShops\Controller\Admin\TrustedShopsFeatures::class,
    ],
    'templates'   => [

        '@dd_trustedshops_features/admin/dd_trustedshops_features.tpl' => 'views/smarty/admin/dd_trustedshops_features.tpl',

        'dd_ts_admin_ui.tpl'                                       => 'views/smarty/admin/dd_ts_admin_ui.tpl',
        'inc/dd_trustedshops_features_expert.tpl'                  => 'views/smarty/admin/inc/dd_trustedshops_features_expert.tpl',
        'inc/dd_trustedshops_features_standard.tpl'                => 'views/smarty/admin/inc/dd_trustedshops_features_standard.tpl',
        'inc/dd_trustedshops_features_id_switcher.tpl'             => 'views/smarty/admin/inc/dd_trustedshops_features_id_switcher.tpl',
        'inc/dd_trustedshops_features_form_footer.tpl'             => 'views/smarty/admin/inc/dd_trustedshops_features_form_footer.tpl',
        'inc/dd_trustedshops_features_customer_reviews.tpl'        => 'views/smarty/admin/inc/dd_trustedshops_features_customer_reviews.tpl',
        'inc/dd_trustedshops_features_product_reviews.tpl'         => 'views/smarty/admin/inc/dd_trustedshops_features_product_reviews.tpl',
        'forms/dd_trustedshops_features_tsid_modal.tpl'            => 'views/smarty/admin/forms/dd_trustedshops_features_tsid_modal.tpl',
        'widget/dd_trustedshops_features_widget.tpl'               => 'views/smarty/tpl/widget/dd_trustedshops_features_widget.tpl',
    ],
    'blocks'      => [
        [ 'template' => 'layout/base.tpl', 'block' => 'base_style', 'file' => '/views/smarty/blocks/base_style.tpl' ],
        [ 'template' => 'layout/footer.tpl', 'block' => 'footer_main', 'file' => '/views/smarty/blocks/layout/footer.tpl' ],
        [ 'template' => 'layout/sidebar.tpl', 'block' => 'sidebar', 'file' => '/views/smarty/blocks/layout/sidebar.tpl' ],
        [ 'template' => 'page/details/inc/tabs.tpl', 'block' => 'details_tabs_main', 'file' => '/views/smarty/blocks/page/details/inc/tabs.tpl' ],
        [ 'template' => 'page/details/inc/productmain.tpl', 'block' => 'details_productmain_ratings', 'file' => '/views/smarty/blocks/page/details/inc/productmain.tpl' ],
        [ 'template' => 'page/checkout/thankyou.tpl', 'block' => 'checkout_thankyou_proceed', 'file' => '/views/smarty/blocks/page/checkout/thankyou.tpl' ],
    ],
    'events'      => [
        'onActivate' => '\DigideskMediaSolutions\TrustedShops\Core\Events::onActivate',
    ],
];