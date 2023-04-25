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

namespace DigideskMediaSolutions\TrustedShops\Controller;

class ThankYouController extends ThankYouController_parent
{

    /**
     * Gibt das voraussichtliche Lieferdatum anhand der gekauften Artikel zurück.
     *
     * @return bool|string
     */
    public function getEstimatedDeliveryDate()
    {
        $iMaxDeliveryTime = 0;

        /** @var Thankyou $this */
        foreach ( $this->getBasket()->getBasketArticles() as $oArticle )
        {
            if( $oArticle->oxarticles__oxmaxdeltime->value )
            {
                $iNormalizedDeliveryTime = $this->__normalizeDeliveryTime( $oArticle->oxarticles__oxmaxdeltime->value, $oArticle->oxarticles__oxdeltimeunit->value );

                if( $iNormalizedDeliveryTime > $iMaxDeliveryTime )
                {
                    $iMaxDeliveryTime = $iNormalizedDeliveryTime;
                }
            }
        }

        if( $iMaxDeliveryTime > 0 )
        {
            $sEstimatedDeliveryDate = date( "Y-m-d", strtotime( $iMaxDeliveryTime . ' weekdays' ) );
        }
        else
        {
            $sEstimatedDeliveryDate = date( "Y-m-d", strtotime( '30 weekdays' ) );
        }

        return $sEstimatedDeliveryDate;
    }


    /**
     * Rechnet die Lieferzeit-Angabe in Tage um
     *
     * @param $iMaxUnit
     * @param $sUnit
     */
    private function __normalizeDeliveryTime( $iMaxUnit, $sUnit )
    {
        switch ( $sUnit )
        {
            default:
            case 'DAY':
                $iFactor = 1;
                break;
            case 'WEEK':
                $iFactor = 5;
                break;
            case 'MONTH':
                $iFactor = 22;
                break;
            case 'YEAR':
                $iFactor = 264;
                break;
        }

        return $iMaxUnit * $iFactor;
    }
}