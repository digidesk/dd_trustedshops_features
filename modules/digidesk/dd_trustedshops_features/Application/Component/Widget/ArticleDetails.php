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

namespace DigideskMediaSolutions\TrustedShops\Application\Component\Widget;

use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\ViewConfig;

class ArticleDetails extends ArticleDetails_parent
{
    /**
     * Überladung der Funktion, OXID Standard soll bei Product Sticker ausgeblendet werden
     *
     * @return bool
     */
    public function isReviewActive()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Config $oConfig */
        $oConfig = $oRegistry::get( Config::class );
        /** @var ViewConfig $oViewConf */
        $oViewConf = $oRegistry::get( ViewConfig::class );

        $oTSID = $oViewConf->getTSIDObj();

        if ( $oTSID && ( ( $oTSID->savedTab == 'standard' && $oTSID->collect_product_reviews && $oTSID->collect_product_reviews_details_tab ) || ( $oTSID->savedTab == 'expert' && $oTSID->collect_product_reviews_expert && $oTSID->collect_product_reviews_details_tab_expert ) ) )
        {
            return false;
        }

        return $oConfig->getConfigParam( 'bl_perfLoadReviews' );
    }
}