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

namespace DigideskMediaSolutions\TrustedShops\Model;

use OxidEsales\Eshop\Core\Model\BaseModel;
use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\DatabaseProvider;
use OxidEsales\Eshop\Core\Language;
use OxidEsales\Eshop\Core\ViewConfig;
use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use OxidEsales\EshopCommunity\Internal\Framework\Database\QueryBuilderFactoryInterface;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Facade\ModuleSettingServiceInterface;

/**
 * Class TrustedShopsIDs
 *
 * @mixin \OxidEsales\Eshop\Core\Model\BaseModel
 */
class TrustedShopsIDs extends BaseModel
{
    /**
     * Enthält ein Array mit den installierten Trusted Shops IDs.
     *
     * @var array
     */
    private $__aTrustedShopsIds = array();

    /**
     * @var string
     */
    private $__sConfVarPrefix = 'aTSIDConfig_';
    /**
     * @var QueryBuilderFactoryInterface
     */
    protected $queryBuilderFactory;

    private $tableName = 'ddtrustedshops';

    /**
     * TrustedShopsIDs constructor.
     */
    public function __construct()
    {
        $container = ContainerFactory::getInstance()->getContainer();
        $this->queryBuilderFactory = $container->get( QueryBuilderFactoryInterface::class );

        parent::__construct();
    }


    /**
     * Gibt alle eingerichteten TS-IDs zurück.
     *
     * @param $iId
     *
     * @return mixed|null
     */
    public function get( $iId )
    {
        $oTSID = null;
        //$sTSIDJson = $oConfig->getShopConfVar( $this->__sConfVarPrefix . $iId, null, 'module:dd_trustedshops_features' );

        $queryBuilder = $this->queryBuilderFactory->create();
        $queryBuilder->select( 'DDVARVALUE' )
                     ->from( $this->tableName )
                     ->where( 'OXSHOPID = :shopid' )
                     ->andWhere( 'DDVARNAME = :varname' )
                     ->setParameters( [
                                          'shopid'  => Registry::getConfig()->getShopId(),
                                          'varname' => $this->__sConfVarPrefix . $iId,
                                      ] );
        $result = $queryBuilder->execute();
        $sTSIDJson = $result->fetchOne();

        if( !empty( $sTSIDJson ) )
        {
            $oTSID = json_decode( $sTSIDJson );
        }

        return $oTSID;
    }


    /**
     * Gibt alle eingerichteten TS-IDs zurück.
     *
     * @return array
     */
    public function getAll()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;

        $aTsIds = array();
        $aLangIds = $oRegistry::getLang()->getLanguageIds();

        if( is_array( $aLangIds ) && count( $aLangIds ) )
        {
            foreach( $aLangIds as $iId => $sLangAbbr )
            {
                //$sTSIDJson = $oConfig->getShopConfVar( $this->__sConfVarPrefix . $iId, null, 'module:dd_trustedshops_features' );
                $queryBuilder = $this->queryBuilderFactory->create();
                $queryBuilder->select( 'DDVARVALUE' )
                             ->from( $this->tableName )
                             ->where( 'OXSHOPID = :shopid' )
                             ->andWhere( 'DDVARNAME = :varname' )
                             ->setParameters( [
                                                  'shopid'  => Registry::getConfig()->getShopId(),
                                                  'varname' => $this->__sConfVarPrefix . $iId,
                                              ] );
                $result = $queryBuilder->execute();
                $sTSIDJson = $result->fetchOne();

                if( !empty( $sTSIDJson ) )
                {
                    $aTsIds[ $iId ] = json_decode( $sTSIDJson );
                }
            }
        }

        return $aTsIds;
    }


    /**
     * @param $aData
     *
     * @return bool
     */
    public function saveData( $aData )
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;

        $sConfVarName = $this->__sConfVarPrefix . $aData[ 'langid' ];

        $queryBuilder = $this->queryBuilderFactory->create();
        $queryBuilder->select( 'OXID', 'DDVARVALUE' )
                     ->from( $this->tableName )
                     ->where( 'OXSHOPID = :shopid' )
                     ->andWhere( 'DDVARNAME = :varname' )
                     ->setParameters( [
                                          'shopid'  => Registry::getConfig()->getShopId(),
                                          'varname' => $sConfVarName,
                                      ] );
        $result = $queryBuilder->execute();
        $aResult = $result->fetchAllAssociative();
        $sOxid = $sTSIDJson = '';
        if( $aResult && count( $aResult ) )
        {
            $sOxid = $aResult[ 0 ][ 'OXID' ];
            $sTSIDJson = $aResult[ 0 ][ 'DDVARVALUE' ];
        }

        $aTsId = array();

        if( !empty( $sTSIDJson ) )
        {
            $aTsId = json_decode( $sTSIDJson );
        }

        if( $aData[ 'id' ] == '-1' )
        {
            $aTsId = array(
                'lang_abbr'                                                    => strtoupper( $oRegistry::getLang()->getLanguageAbbr( $aData[ 'langid' ] ) ),
                'trustbadge_variant'                                           => 'reviews',
                'trustbadge_offset'                                            => '35px',
                'trustbadge_position'                                          => 'bottomRight',
                'google_rich_snippets'                                         => array(
                    'category_pages' => 1,
                    'details_pages'  => 1,
                    'home_page'      => 0,
                ),
                'google_rich_snippets_expert'                                  => array(
                    'category_pages' => 1,
                    'details_pages'  => 1,
                    'home_page'      => 0,
                ),
                'collect_product_reviews_details_tab_name'                     => 'Trusted Shops Bewertungen',
                'collect_product_reviews_details_tab_border'                   => '#c0c0c0',
                'collect_product_reviews_details_tab_color_stars'              => '#ffdc0f',
                'collect_product_reviews_details_tab_size_stars'               => '15px',
                'collect_product_reviews_details_tab_color_bg'                 => '#ffffff',
                'collect_product_reviews_details_stars_color_stars'            => '#ffdc0f',
                'collect_product_reviews_details_stars_size'                   => '15px',
                'collect_product_reviews_details_stars_font_size'              => '12px',
                'note_sticker_font'                                            => 'Helvetica',
                'note_sticker_reviews_amount'                                  => '5',
                'note_sticker_min_rating'                                      => '3.0',
                'note_sticker_bg'                                              => '#ffffff',
                'savedTab'                                                     => 'standard',
                'collect_product_reviews_details_tab_jquery_selector_expert'   => '.relatedInfo',
                'collect_product_reviews_details_stars_jquery_selector_expert' => '.star-ratings',
                'collect_product_reviews_details_tab_name_expert'              => 'Trusted Shops Bewertungen',
                'review_jquery_selector_expert'                                => '#sidebar',
            );

            $aTsId = $this->setCodes( $aData[ 'tsid' ], $aTsId );
        }

        $aTsId = array_merge( (array) $aTsId, $aData );

        //$oConfig->saveShopConfVar( 'str', $sConfVarName, json_encode( $aTsId ), null, 'module:dd_trustedshops_features' );

        $aTsId = $this->setRichSnippetCode( $aTsId );

        $aTsId = array_merge( (array) $aTsId, $aData );

        //$oConfig->saveShopConfVar( 'str', $sConfVarName, json_encode( $aTsId ), null, 'module:dd_trustedshops_features' );
        $queryBuilder = $this->queryBuilderFactory->create();
        if ( $sOxid )
        {
            $queryBuilder->update( $this->tableName )
                         ->set( 'DDVARVALUE', ':DDVARVALUE' )
                         ->where( 'OXID = :OXID' )
                         ->setParameters( [
                                              'DDVARVALUE' => json_encode( $aTsId ),
                                              'OXID'       => $sOxid,
                                          ] );
        }
        else
        {
            $queryBuilder->insert( $this->tableName )
                         ->values( [
                                       'OXID'       => ':OXID',
                                       'OXSHOPID'   => ':OXSHOPID',
                                       'DDVARNAME'  => ':DDVARNAME',
                                       'DDVARVALUE' => ':DDVARVALUE',
                                   ] )
                         ->setParameters( [
                                              'OXID'       => Registry::getUtilsObject()->generateUId(),
                                              'OXSHOPID'   => Registry::getConfig()->getShopId(),
                                              'DDVARNAME'  => $sConfVarName,
                                              'DDVARVALUE' => json_encode( $aTsId ),
                                          ] );
        }
        $queryBuilder->execute();

        return true;
    }


    /**
     * Setzt die Standard Codes für den Tab Experte in das Default Array
     *
     * @param $sTSID
     * @param $aTsId
     *
     * @return mixed
     */
    private function setCodes( $sTSID, $aTsId )
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Language $oLang */
        $oLang = $oRegistry::get( Language::class );

        $sIntroText = $oLang->translateString( 'DD_TRUSTEDSHOPS_FEATURES_WIDGET_PRODUCT_STICKER_INTROTEXT', null, false );
        $aTsId[ 'trustbadge_code' ] = "
                (function () {
                    var _tsid   = '$sTSID';
                    _tsConfig   = {
                        'yOffset':            '35px', /* offset from page bottom */
                        'variant':            'reviews', /* text, default, small, reviews, custom, custom_reviews */
                        'customElementId':    '', /* required for variants custom and custom_reviews */
                        'trustcardDirection': '', /* for custom variants: topRight, topLeft, bottomRight, bottomLeft */
                        'disableResponsive':  'false', /* deactivate responsive behaviour */
                        'disableTrustbadge':  'false' /* deactivate trustbadge */
                    };
                    var _ts     = document.createElement('script');
                    _ts.type    = 'text/javascript';
                    _ts.charset = 'utf-8';
                    _ts.async   = true;
                    _ts.src     = '//widgets.trustedshops.com/js/' + _tsid + '.js';
                    var __ts    = document.getElementsByTagName('script')[0];
                    __ts.parentNode.insertBefore(_ts, __ts);
                })();";

        $aTsId[ 'product_sticker_code' ] = "
                    _tsProductReviewsConfig = {
                        tsid:               '$sTSID',
                        sku:                '%sku%',
                        variant:            'productreviews',
                        /* optional */
                        borderColor:        '#c0c0c0',
                        backgroundColor:    '#ffffff',
                        locale:             '%locale%',
                        starColor:          '#ffdc0f',
                        commentBorderColor: '#dad9d5',
                        commentHideArrow:   'false',
                        richSnippets:       'on',
                        starSize:           '15px',
                        ratingSummary:      'false',
                        maxHeight:          '1200px',
                        hideEmptySticker:   'false',
                        filter:             'true',
                        element:            '%element%',
                        introtext:          '$sIntroText'
                    };
                    var scripts             = document.getElementsByTagName( 'SCRIPT' ), me = document.getElementById('ddproductreviewscontent');
                            var _ts                 = document.createElement( 'SCRIPT' );
                            _ts.type                = 'text/javascript';
                            _ts.async               = true;
                            _ts.charset             = 'utf-8';
                            _ts.src                 = '//widgets.trustedshops.com/reviews/tsSticker/tsProductSticker.js';
                            me.parentNode.insertBefore( _ts, me );
                            _tsProductReviewsConfig.script = _ts;";

        $aTsId[ 'product_sticker_tab_code' ] = "
                        var summaryBadge = new productStickerSummary();
                        summaryBadge.showSummary(
                            {
                                'tsId':              '$sTSID',
                                'sku':               '%sku%',
                                'element':           '%element%',
                                'starColor':         '#ffdc0f',
                                'starSize':          '15px',
                                'fontSize':          '12px',
                                'showRating':        'true',
                                'scrollToReviews':   'false',
                                'enablePlaceholder': 'false'
                            }
                        );";

        $aTsId[ 'review_code' ] = "_tsRatingConfig = {
                                tsid:               '$sTSID',
                                variant: 'skyscraper_horizontal', 
                                // valid values: 'vertical', 'skyscraper_horizontal', 'skyscraper_vertical', 'testimonial'
                                theme: 'light',
                                reviews: 10, 
                                // default = 10
                                borderColor: '#fa9600', 
                                // optional - overrides the border color
                                colorclassName: 'test' 
                                // optional - override the whole sticker style with your own css class 
                            };
                            var div = document.getElementById('ts_reviewsticker');
                            var _ts = document.createElement('SCRIPT');
                            _ts.type = 'text/javascript';
                            _ts.async = true;
                            _ts.charset = 'utf-8';
                            _ts.src ='//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
                            div.parentNode.insertBefore(_ts, div);
                            _tsRatingConfig.script = _ts;";

        $aTsId[ 'comment_code' ] = "_tsRatingConfig = {
                                tsid:               '$sTSID',
                                variant:            'testimonial',
                                reviews:             5,
                                richSnippets:       'on',
                                linkColor:          '#333333',
                                quotationMarkColor: '#333333',
                                fontColor: '#333333',
                                reviewMinLength:    '10',
                                betterThan:          3.0,
                                fontFamily:         'Helvetica',
                                backgroundColor:    '#ffffff',
                            };
                            var div = document.getElementById('ts_reviewsticker');
                            var _ts = document.createElement('SCRIPT');
                            _ts.type = 'text/javascript';
                            _ts.async = true;
                            _ts.charset = 'utf-8';
                            _ts.src ='//widgets.trustedshops.com/reviews/tsSticker/tsSticker.js';
                            div.parentNode.insertBefore(_ts, div);
                            _tsRatingConfig.script = _ts;";

        return $aTsId;
    }


    /**
     * Setzt den Rich Snippet Code in das Default Array
     *
     * @param $aTsId
     *
     * @return mixed
     */
    private function setRichSnippetCode( $aTsId )
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var ViewConfig $oViewConf */
        $oViewConf = $oRegistry::get( ViewConfig::class );

        $aTSRatings = $oViewConf->getTSCustomerRatings();
        $sShopName = $aTSRatings[ 'shopName' ];

        $aTsId[ 'rich_snippets_code' ] = '<script type="application/ld+json"> {
                    "@context": "http://schema.org",
                    "@type": "Organization",
                    "name": "' . $sShopName . '", "aggregateRating" : {
                    "@type": "AggregateRating",
                    "ratingValue" : "%ratingValue%", "bestRating" : "%bestRating%", "ratingCount" : "%ratingCount%"
                    }
                    }
                </script>';

        return $aTsId;
    }


    /**
     * Löscht eine TS-ID aus oxconfig
     *
     * @param $iId
     *
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseConnectionException
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseErrorException
     */
    public function deleteId( $iId )
    {
        $sConfVarName = $this->__sConfVarPrefix . $iId;

        $queryBuilder = $this->queryBuilderFactory->create();
        $queryBuilder->delete( $this->tableName )
                     ->where( 'DDVARNAME', ':DDVARNAME' )
                     ->where( 'OXSHOPID', ':OXSHOPID' )
                     ->setParameters( [
                                          'DDVARNAME' => $sConfVarName,
                                          'OXSHOPID'  => Registry::getConfig()->getShopId(),
                                      ] );
        $queryBuilder->execute();
    }
}