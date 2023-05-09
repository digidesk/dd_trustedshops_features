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

namespace DigideskMediaSolutions\TrustedShops\Controller\Admin;

use DigideskMediaSolutions\TrustedShops\Model\TrustedShopsIDs;

use OxidEsales\Eshop\Application\Controller\Admin\AdminController;

use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\Request;
use OxidEsales\Eshop\Core\Session;
use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Configuration\Bridge\ModuleConfigurationDaoBridge;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Configuration\Bridge\ModuleConfigurationDaoBridgeInterface;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Path\ModuleAssetsPathResolverBridge;
use OxidEsales\EshopCommunity\Internal\Framework\Module\Path\ModuleAssetsPathResolverBridgeInterface;

class TrustedShopsFeatures extends AdminController
{
    protected $_sThisTemplate = '@dd_trustedshops_features/admin/dd_trustedshops_features';


    /**
     * @return string
     */
    public function render()
    {
        parent::render();
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Config $oConfig */
        $oConfig = $oRegistry::get( Config::class );
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );
        /** @var Session $oSession */
        $oSession = $oRegistry::get( Session::class );
        /** @var TrustedShopsIDs $oTsIdModel */
        $oTsIdModel = oxNew( TrustedShopsIDs::class );

        $sId = $oRequest->getRequestEscapedParameter( 'id' );
        $sFunction = $oRequest->getRequestEscapedParameter( 'fnc' );
        $this->addTplParam( 'sAdminSid', $oSession->getId() );
        $this->addTplParam( 'sAdminToken', $oSession->getSessionChallengeToken() );
        $this->addTplParam( 'sShopId', $oConfig->getShopId() );
        $this->addTplParam( 'oTsIdModel', $oTsIdModel );
        $this->addTplParam( 'aLanguages', $oRegistry::getLang()->getLanguageArray() );
        if( strlen( $sId ) )
        {
            if( $sFunction == 'saveTSID' )
            {
                $sId = $this->getActiveTSID();
            }
            $this->addTplParam( 'oData', $oTsIdModel->get( $sId ) );
        }
        else
        {
            if( $this->_sThisTemplate != 'forms/dd_trustedshops_features_tsid_modal.tpl' )
            {
                $this->addTplParam( 'oData', $oTsIdModel->get( $this->getActiveTSID() ) );
            }
        }

        return $this->_sThisTemplate;
    }


    /**
     * @return mixed|string|null
     */
    public function getActiveTSID()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );

        $iActiveTsId = $oRequest->getRequestEscapedParameter( 'tsid' );
        if( !strlen( $iActiveTsId ) )
        {
            /** @var TrustedShopsIDs $oTsIdModel */
            $oTsIdModel = oxNew( TrustedShopsIDs::class );
            $aAllIds = $oTsIdModel->getAll();
            if( count( $aAllIds ) )
            {
                $aAllIds = array_values( $aAllIds );
                $iActiveTsId = $aAllIds[ 0 ]->langid;
            }
        }

        return $iActiveTsId;
    }


    /**
     * Setzt ein benutzerdefiniertes Template zur Ausgabe
     */
    public function getAjaxTpl()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );

        $sTpl = $oRequest->getRequestEscapedParameter( 'tpl' );
        if( $sTpl )
        {
            $this->_sThisTemplate = $sTpl;
        }
        // Look & Feel for loading
        usleep( 500000 );
    }


    /**
     * Speichert eine neue TS-ID
     */
    public function saveTSID()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );

        $sError = '';
        $blSuccess = false;
        $aData = $oRequest->getRequestEscapedParameter( 'editval' );
        if( isset( $aData[ 'tsid' ] ) && empty( $aData[ 'tsid' ] ) )
        {
            $sError = $oRegistry::getLang()->translateString( 'DD_TRUSTEDSHOPS_FEATURES_ERRORS_EMPTY_TSID' );
        }
        if( empty( $sError ) )
        {
            $aData[ 'id' ] = $oRequest->getRequestEscapedParameter( 'id' );
            /** @var TrustedShopsIDs $oTSID */
            $oTSID = oxNew( TrustedShopsIDs::class );
            $blSuccess = $oTSID->saveData( $aData );
        }
        if( $oRequest->getRequestEscapedParameter( 'ajax' ) )
        {
            header( "Content-type: application/json; charset=utf-8" );
            die( json_encode( array( 'success' => $blSuccess, 'error' => $sError ) ) );
        }
    }


    /**
     * Löscht eine TS-ID
     */
    public function deleteTSID()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );

        $sId = $oRequest->getRequestEscapedParameter( 'deleteId' );
        if( strlen( $sId ) )
        {
            /** @var TrustedShopsIDs $oTSID */
            $oTSID = oxNew( TrustedShopsIDs::class );
            $oTSID->deleteId( (int) $sId );
        }
    }


    /**
     * Speichert die Einstellungen in einer TS-ID.
     */
    public function saveSettings()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Request $oRequest */
        $oRequest = $oRegistry::get( Request::class );
        /** @var TrustedShopsIDs $oTSID */
        $oTSID = oxNew( TrustedShopsIDs::class );

        $sError = '';
        $blSuccess = false;
        $aSettingsStandard = $oRequest->getRequestEscapedParameter( 'settings_standard' );
        $aSettingsExpert = $oRequest->getRequestEscapedParameter( 'settings_expert' );
        $aData = array_merge(
            [ 'langid' => (string) $oRequest->getRequestEscapedParameter( 'langid' ) ],
            [ 'savedTab' => (string) $oRequest->getRequestEscapedParameter( 'savedTab' ) ],
            ( is_array( $aSettingsStandard ) ? $aSettingsStandard : [] ),
            ( is_array( $aSettingsExpert ) ? $aSettingsExpert : [] )
        );
        $blSuccess = $oTSID->saveData( $aData );
        header( "Content-type: application/json; charset=utf-8" );
        die( json_encode( array( 'success' => $blSuccess, 'error' => $sError ) ) );
    }


    /**
     * Gibt die aktuelle Modulversion zurück
     *
     * @return string
     */
    public function getModuleVersion()
    {
        $oContainer = ContainerFactory::getInstance()->getContainer();
        /** @var ModuleConfigurationDaoBridge $oModuleConfigurationDaoBridge */
        $oModuleConfigurationDaoBridge = $oContainer->get( ModuleConfigurationDaoBridgeInterface::class );

        return $oModuleConfigurationDaoBridge->get( 'dd_trustedshops_features' )->getVersion();
    }


    /**
     * Generiert den Link zum Trusted Shops Integration
     *
     * @return string
     */
    public function getTrustedShopsIntegrationCenterLink()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var TrustedShopsIDs $oTsIdModel */
        $oTsIdModel = oxNew( TrustedShopsIDs::class );

        $oTSID = $oTsIdModel->get( $this->getActiveTSID() );

        return vsprintf(
            'https://www.trustedshops.com/integration/?shop_id=%s&backend_language=%s&shopsw=%s&shopsw_version=%s&plugin_version=%s&context=trustbadge',
            array(
                $oTSID->tsid,
                strtolower( $oRegistry::getLang()->getLanguageAbbr() ),
                'OXID_ESALES',
                $this->getShopVersion(),
                $this->getModuleVersion(),
            )
        );
    }


    /**
     * Generiert die URL für die Infografik in der passenden Sprache
     *
     * @return string
     */
    public function getInfoPictureUrl()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var Config $oConfig */
        $oConfig = $oRegistry::get( Config::class );

        $sImageName = $oRegistry::getLang()->translateString( 'DD_TRUSTEDSHOPS_FEATURES_REGISTER_INFO_PICTURE' );

        /** @var ModuleAssetsPathResolverBridge $oModuleAssetsPathResolverBridge */
        $oModuleAssetsPathResolverBridge = ContainerFactory::getInstance()->getContainer()->get( ModuleAssetsPathResolverBridgeInterface::class );

        $sUrl = str_replace(
            rtrim( $oConfig->getConfigParam( 'sShopDir' ), '/' ),
            rtrim( $oConfig->getShopUrl(), '/' ),
            $oModuleAssetsPathResolverBridge->getAssetsPath( 'dd_trustedshops_features' ) . '/img/' . $sImageName
        );

        return $sUrl;
    }


    /**
     * Liefert die Test URL aus dem InfoText aus dem Tab Experte mit der passenden TsID zur�ck
     *
     * @return string
     */
    public function getTestLink()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;
        /** @var TrustedShopsIDs $oTsIdModel */
        $oTsIdModel = oxNew( TrustedShopsIDs::class );

        $sTestURL = $oRegistry::getLang()->translateString( 'DD_TRUSTEDSHOPS_FEATURES_EXPERT_INFO_TEXT_2_URL' );
        $oTSID = $oTsIdModel->get( $this->getActiveTSID() );
        $sTestURL .= '?tsid=' . $oTSID->tsid;

        return $sTestURL;
    }

    public function getConfig()
    {
        return Registry::getConfig();
    }
}