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
 * @link        http://www.digidesk.de
 * @author      digidesk - media solutions
 * @license         https://raw.githubusercontent.com/digidesk/dd_trustedshops_features/master/20210812_TS-licence_Oxid_EN_v1.1.txt
 */

namespace DigideskMediaSolutions\TrustedShops\Controller;

use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\ViewConfig;

class ArticleDetailsController extends ArticleDetailsController_parent
{
    /**
     * Gibt die Bewertungen des aktuellen Artikels zur�ck
     *
     * @return array
     */
    public function getReviews()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var ViewConfig $oViewConf */
        $oViewConf = $oRegistry::get( ViewConfig::class );

        $aReviews = array();

        $oTSID = $oViewConf->getTSIDObj();

        if ( !$oTSID || ( $oTSID->collect_product_reviews != '1' || $oTSID->collect_product_reviews_details_tab != '1' ) || ( $oTSID->collect_product_reviews_expert != '1' || $oTSID->collect_product_reviews_details_tab_expert != '1' ) )
        {
            $aReviews = parent::getReviews();
        }

        return $aReviews;
    }
}