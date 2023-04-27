<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

namespace DigideskMediaSolutions\TrustedShops\Core;

use OxidEsales\DoctrineMigrationWrapper\MigrationsBuilder;
use Symfony\Component\Console\Output\BufferedOutput;

/**
 * Class Events
 */
class Events
{
    /**
     * Execute action on deactivate event
     */
    public static function onDeactivate()
    {
    }

    /**
     * Execute action on activate event
     */
    public static function onActivate()
    {
        self::executeMigrations();
    }

    private static function executeMigrations(): void
    {
        $migrations = (new MigrationsBuilder())->build();

        $output = new BufferedOutput();
        $migrations->setOutput($output);
        $needsUpdate = $migrations->execute('migrations:up-to-date', 'dd_trustedshops_features');

        if ($needsUpdate) {
            $migrations->execute('migrations:migrate', 'dd_trustedshops_features');
        }
    }
}
