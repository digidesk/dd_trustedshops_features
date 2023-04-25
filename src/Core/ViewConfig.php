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
 */

namespace DigideskMediaSolutions\TrustedShops\Core;

use DigideskMediaSolutions\TrustedShops\Model\TrustedShopsIDs;

use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\Theme;

class ViewConfig extends ViewConfig_parent
{
    /**
     * Gibt die Einstellung für die aktive TS-ID zurück, sofern konfiguriert.
     *
     * @return null|dd_trustedshops_ids
     */
    public function getTSIDObj()
    {
        /** @var TrustedShopsIDs $oTsIdModel */
        $oTsIdModel = oxNew( TrustedShopsIDs::class );

        return $oTsIdModel->get( $this->getActLanguageId() );
    }

    /**
     * Gibt die Trusted Shops Bewertungen zurück, die über die API eingelesen werden.
     *
     * @return array
     */
    public function getTSCustomerRatings()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Config $oConfig */
        $oConfig = $oRegistry::get( Config::class );

        $aReturn  = array();
        $oTSIDObj = $this->getTSIDObj();

        if ( $oTSIDObj )
        {
            $sCacheFilePath = $oConfig->getConfigParam( 'sCompileDir' ) . '/' . $oTSIDObj->tsid . '.json';
            $iCacheTimeout  = 43200; // half a day

            if ( !file_exists ( $sCacheFilePath ) || ( time () - filemtime ( $sCacheFilePath ) > $iCacheTimeout ) )
            {
                $ch = curl_init();
                curl_setopt( $ch, CURLOPT_HEADER, false );
                curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
                curl_setopt( $ch, CURLOPT_POST, false );
                curl_setopt( $ch, CURLOPT_URL, 'http://api.trustedshops.com/rest/public/v2/shops/' . $oTSIDObj->tsid . '/quality/reviews.json' );
                $sOutput = curl_exec( $ch );
                curl_close( $ch );

                if ( is_writable( dirname( $sCacheFilePath ) ) )
                {
                    file_put_contents( $sCacheFilePath, $sOutput );
                }
            }

            if ( file_exists ( $sCacheFilePath ) && $oJSON = json_decode ( file_get_contents ( $sCacheFilePath ), true ) )
            {
                $aReturn[ 'result' ]   = $oJSON [ 'response' ] [ 'data' ] [ 'shop' ] [ 'qualityIndicators' ] [ 'reviewIndicator' ] [ 'overallMark' ];
                $aReturn[ 'count' ]    = $oJSON [ 'response' ] [ 'data' ] [ 'shop' ] [ 'qualityIndicators' ] [ 'reviewIndicator' ] [ 'activeReviewCount' ];
                $aReturn[ 'shopName' ] = $oJSON [ 'response' ] [ 'data' ] [ 'shop' ] [ 'name' ];
                $aReturn[ 'max' ]      = "5.00";
            }
        }

        return $aReturn;
    }

    /**
     * Gibt die installierte Trusted Shops Modul Version zurück.
     *
     * @return string
     */
    public function getTSModuleVersion()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Config $oConfig */
        $oConfig = $oRegistry::get( Config::class );

        $sVersion = $oConfig->getShopConfVar( 'iInstallledVersion', $oConfig->getShopId(), 'module:dd_trustedshops_features' );

        return $sVersion;
    }

    /**
     * Gibt locale des aktuellen TS Objektes zurück.
     *
     * @return string
     */
    public function getTSLocale( $iLangId )
    {
        $sLocale = 'de_DE';

        if ( $iLangId )
        {
            $sLocale = 'en_GB';
        }

        return $sLocale;
    }


    public function isRoxiveTheme()
    {
        /** @var Theme $oTheme */
        $oTheme = oxNew( Theme::class );
        $oTheme->load( $oTheme->getActiveThemeId() );

        if ( $oTheme->getId() == 'dd_roxive' || $oTheme->getId() == 'flow' )
        {
            return true;
        }

        if ( ( $oParentTheme = $oTheme->getParent() ) && ( $oParentTheme->getId() == 'dd_roxive' || $oParentTheme->getId() == 'flow' ) )
        {
            return true;
        }

        return false;
    }
}