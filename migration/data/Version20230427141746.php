<?php

declare(strict_types=1);

namespace DigideskMediaSolutions\TrustedShops\Migrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230427141746 extends AbstractMigration
{
    public function up(Schema $schema): void
    {
        $platform = $this->connection->getDatabasePlatform();
        $platform->registerDoctrineTypeMapping('enum', 'string');

        if (!$schema->hasTable('ddtrustedshops')) {
            $this->addSql(
                "CREATE TABLE IF NOT EXISTS `ddtrustedshops` (
                `OXID` CHAR(32) character set latin1 collate latin1_general_ci NOT NULL DEFAULT '',
                `OXSHOPID` int(11) NOT NULL DEFAULT 1,
                `DDVARNAME` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '',
                `DDVARVALUE` text NOT NULL,
                PRIMARY KEY (`OXID`),
                UNIQUE KEY `DDVARNAME` (`DDVARNAME`,`OXSHOPID`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8;"
            );
        }
    }

    public function down(Schema $schema): void
    {
        if (!$schema->hasTable('ddtrustedshops')) {
            $this->addSql(
                "DROP TABLE `ddtrustedshops`;"
            );
        }
    }
}
