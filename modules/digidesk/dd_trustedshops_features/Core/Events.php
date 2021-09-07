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
 */

namespace DigideskMediaSolutions\TrustedShops\Core;

use DigideskMediaSolutions\TrustedShops\Application\Model\TrustedShopsIDs;
use OxidEsales\Eshop\Core\Registry;
use OxidEsales\Eshop\Core\Config;
use OxidEsales\Eshop\Core\Module\Module;
use OxidEsales\Eshop\Core\DatabaseProvider;

class Events
{
    /**
     * String mit dem Namen bzw. der ID des Moduls
     *
     * @var string $__sModuleName
     */
    private static $__sModuleName = 'dd_trustedshops_features';

    /**
     * Array mit den Namen der Tabellen des Moduls
     *
     * @var array $__aTableNames
     */
    private static $__aTableNames = [
        //'',
    ];

    /**
     * Array mit SQL-Befehlen, die beim ERSTEN Aktivieren des Moduls ausgeführt werden sollen und NUR der Einrichtung
     * dienen.
     *
     * @var array
     */
    private static $__aSetupSQLs = [
        //"",
    ];

    /**
     * Array mit SQL-Befehlen, die beim Update des Moduls ausgeführt werden sollen und NUR der Aktualisierung
     * dienen.
     *
     * @var array
     */
    private static $__aUpdateSQLs = [
        //'0.0.1' => array(
        //    "",
        //),
    ];

    /**
     * Array mit SQL-Befehlen, die bei JEDEM Aktivieren des Moduls ausgeführt werden sollen.
     *
     * @var array
     */
    private static $__aActivateSQLs = [
        // '',
    ];

    /**
     * Array mit SQL-Befehlen, die beim JEDEM Deaktivieren des Moduls ausgeführt werden sollen.
     *
     * @var array
     */
    private static $__aDeactivateSQLs = [
        // '',
    ];


    /**
     * Wird beim Aktivieren des Moduls ausgeführt.
     */
    public static function onActivate()
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;

        /** @var Config $oConfig */
        $oConfig = $oRegistry::getConfig();

        /** @var Module $oModule */
        $oModule = oxNew( Module::class );
        $oModule->load( 'dd_trustedshops_features' );
        $iShopId = $oConfig->getShopId();

        $sCurrentVersion = $oModule->getInfo( 'version' );
        $sInstalledVersion = $oConfig->getShopConfVar( 'iInstallledVersion', $iShopId, 'module:dd_trustedshops_features' );

        if( $sInstalledVersion < '2.0.0' && $sCurrentVersion >= '2.0.0' )
        {
            self::saveOldSettings( 0 );
            self::saveOldSettings( 1 );
        }

        // SQL-Befehle nur beim ersten Aktivieren des Moduls durchf�hren
        if( !$oConfig->getShopConfVar( 'blModuleWasEnabled', $iShopId, 'module:dd_trustedshops_features' ) )
        {
            $oConfig->saveShopConfVar( 'bool', 'blModuleWasEnabled', 'true', $iShopId, 'module:dd_trustedshops_features' );
        }

        if( !$sInstalledVersion || version_compare( $sInstalledVersion, $sCurrentVersion, '<' ) )
        {
            $oConfig->saveShopConfVar( 'str', 'iInstallledVersion', $sCurrentVersion, $iShopId, 'module:dd_trustedshops_features' );
        }
    }


    /**
     * Speichert die alten Einstellungen des Moduls
     *
     * @param $iLang int
     */
    private static function saveOldSettings( $iLang )
    {
        /** @var Registry $oRegistry */
        $oRegistry = Registry::class;

        /** @var Config $oConfig */
        $oConfig = $oRegistry::getConfig();
        $iShopId = $oConfig->getShopId();

        /** @var TrustedShopsIDs $oTsIdModel */
        $oTsIdModel = oxNew( TrustedShopsIDs::class );

        $oTSID = $oTsIdModel->get( $iLang );

        if( $oTSID && $oTSID->review_sticker_position && $oTSID->review_sticker_position != 0 )
        {
            $sReviewSticker = '2';
            $sReviewStickerPosition = 'skyscraper_horizontal';
            if( $oTSID->review_sticker_position == 2 )
            {
                $sReviewStickerPosition = 'skyscraper_vertical';
            }

            $oTSID->review_sticker = $sReviewSticker;
            $oTSID->review_sticker_position = $sReviewStickerPosition;

            $oConfig->saveShopConfVar( 'str', 'aTSIDConfig_' . $iLang, json_encode( $oTSID ), $iShopId, 'module:dd_trustedshops_features' );
        }
    }


    /**
     * Iteriert ein Array mit SQL-Befehlen und führt diese aus.
     *
     * @param $aSQLs
     *
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseConnectionException
     * @throws \OxidEsales\Eshop\Core\Exception\DatabaseErrorException
     */
    private static function executeSQLs( $aSQLs )
    {
        if( count( $aSQLs ) > 0 )
        {
            foreach( $aSQLs as $sSQL )
            {
                dumpVar( $sSQL, 1 ); // Ausgef�hrte SQLs in Log-Datei speichern
                DatabaseProvider::getDb()->execute( $sSQL );
            }
        }
    }
}