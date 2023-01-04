-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: nild
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `craft_addresses`
--

DROP TABLE IF EXISTS `craft_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_fk_razfmarqvrpsecudgccrukofwrlmsacqvofk` (`ownerId`),
  CONSTRAINT `craft_fk_razfmarqvrpsecudgccrukofwrlmsacqvofk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xcayaazbiozgjpnxehvfobvcftxekumvnapy` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_addresses`
--

LOCK TABLES `craft_addresses` WRITE;
/*!40000 ALTER TABLE `craft_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_announcements`
--

DROP TABLE IF EXISTS `craft_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_rtysrobqnwbebqgqkzmigrrfwjuopfqkvzhr` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `craft_idx_ncfbmrydjthobiiurdmercgvtnvmaxobbkag` (`dateRead`),
  KEY `craft_fk_kwlmvdfnqsbyopjtjtnzdlahbqtlwntkiukh` (`pluginId`),
  CONSTRAINT `craft_fk_kwlmvdfnqsbyopjtjtnzdlahbqtlwntkiukh` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tvgcsoefjnwchglgrasdwxphfeirvhmfoepq` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_announcements`
--

LOCK TABLES `craft_announcements` WRITE;
/*!40000 ALTER TABLE `craft_announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexdata`
--

DROP TABLE IF EXISTS `craft_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_hceptiadvzvhndwntodyigrhayflfajpiwwo` (`sessionId`,`volumeId`),
  KEY `craft_idx_kkjxbjduvxupjcmndikdltooerpbbhmzkgzu` (`volumeId`),
  CONSTRAINT `craft_fk_ejnyjeffkdubuqbqsscsdvvsbrelzhmmckwi` FOREIGN KEY (`sessionId`) REFERENCES `craft_assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wwvttglztwfiwewperrhipxilylasapesgwy` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexdata`
--

LOCK TABLES `craft_assetindexdata` WRITE;
/*!40000 ALTER TABLE `craft_assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assetindexingsessions`
--

DROP TABLE IF EXISTS `craft_assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assetindexingsessions`
--

LOCK TABLES `craft_assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `craft_assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_assets`
--

DROP TABLE IF EXISTS `craft_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_vrhjqtdktgawppxvkwxhkyoxnmvvbtznhqjv` (`filename`,`folderId`),
  KEY `craft_idx_gwrqarhlwfosdkezlgsehmlmofmhykadbwzg` (`folderId`),
  KEY `craft_idx_zyeioferpeivqgvpffothbmmdycehwazgnuu` (`volumeId`),
  KEY `craft_fk_plpscjqvohsgbtszhrbwuczhybsfirxvqnsv` (`uploaderId`),
  CONSTRAINT `craft_fk_plpscjqvohsgbtszhrbwuczhybsfirxvqnsv` FOREIGN KEY (`uploaderId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_puwbegdezwavxnaufywzqxjqmkwxhqneynyn` FOREIGN KEY (`folderId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tlrirlnbkzdavcqqiwipeuogszpxwwsphsoh` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xiwhbqqijgoojckhaotlsmsrjewjoemrjvea` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_assets`
--

LOCK TABLES `craft_assets` WRITE;
/*!40000 ALTER TABLE `craft_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categories`
--

DROP TABLE IF EXISTS `craft_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_sjzblmqhddvpwatscpujzegqqkxwrasnlpfc` (`groupId`),
  KEY `craft_fk_uorneddszjdvrzckvuxhtqbfgegqjiwxuffl` (`parentId`),
  CONSTRAINT `craft_fk_drjszfkscmncsxdekapdqmeelfxucedvrmiv` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uorneddszjdvrzckvuxhtqbfgegqjiwxuffl` FOREIGN KEY (`parentId`) REFERENCES `craft_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_yzgvftykuwizazixqeshlkcsvcpdgqgyuyuv` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categories`
--

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups`
--

DROP TABLE IF EXISTS `craft_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_kbofnckzzqkdboxueyykxfppunjibrdqlsrl` (`name`),
  KEY `craft_idx_ulysahjleptdmosfsdpxvsatwydwhtgsgbvz` (`handle`),
  KEY `craft_idx_bkhvsgohxvsdnshutznrqtqrwwmycietpqlz` (`structureId`),
  KEY `craft_idx_zjptuyojtymmjlrytphkszbsvcasvnbqoxsz` (`fieldLayoutId`),
  KEY `craft_idx_jbfwixfeirvfarchfskatxlsrxjderrusson` (`dateDeleted`),
  CONSTRAINT `craft_fk_irnbfporgqobsmdvtxcnydsmokrsvesbqbup` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_puulitndbjalvtdnrfbdcxyuaxksbehnkgkm` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups`
--

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_categorygroups_sites`
--

DROP TABLE IF EXISTS `craft_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_mdqbmajttlwsjusykazoqjxztipasmnschmb` (`groupId`,`siteId`),
  KEY `craft_idx_vdwbotwczopokceoohjjyjypnuojayojwooh` (`siteId`),
  CONSTRAINT `craft_fk_jaxmjkcpzugqmbdwekrkszdzsneqrcjvdiqa` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_szadeabewnszuzmmmxdjrpwxmhepgpobdwnf` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_categorygroups_sites`
--

LOCK TABLES `craft_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedattributes`
--

DROP TABLE IF EXISTS `craft_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `craft_idx_nvalgsoukonbormjurldabkhxjndnzzlluwg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_jdgvdzgqocjoyoslvyailkgjboymuptjlotq` (`siteId`),
  KEY `craft_fk_btlbwizehnqdkcabkaufidiwopoettuumrdb` (`userId`),
  CONSTRAINT `craft_fk_btlbwizehnqdkcabkaufidiwopoettuumrdb` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_iitlsiiodptgjbdkaqxghpybmtcsdktimtfl` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_jdgvdzgqocjoyoslvyailkgjboymuptjlotq` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedattributes`
--

LOCK TABLES `craft_changedattributes` WRITE;
/*!40000 ALTER TABLE `craft_changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_changedfields`
--

DROP TABLE IF EXISTS `craft_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `craft_idx_cfwkjeysrccydqxjhzxiyghsajwccxoujjzm` (`elementId`,`siteId`,`dateUpdated`),
  KEY `craft_fk_lukybomralzqebjytubljdaajnxjkypvqjfj` (`siteId`),
  KEY `craft_fk_qcregdkncceqdeujxwqojwcmtflfhekemicc` (`fieldId`),
  KEY `craft_fk_tzgbllvmpzlkzdqidwhtdlopqevwwpselijl` (`userId`),
  CONSTRAINT `craft_fk_kqqwbykibvhyovbvzjbvqucafbvkgwmrfpsr` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_lukybomralzqebjytubljdaajnxjkypvqjfj` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_qcregdkncceqdeujxwqojwcmtflfhekemicc` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_tzgbllvmpzlkzdqidwhtdlopqevwwpselijl` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_changedfields`
--

LOCK TABLES `craft_changedfields` WRITE;
/*!40000 ALTER TABLE `craft_changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_content`
--

DROP TABLE IF EXISTS `craft_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_ihcclunqhptuwfexcazxgnrqimdlofrgufwc` (`elementId`,`siteId`),
  KEY `craft_idx_ndjqljfkkccwqxhwfomkyqhblruarcytgeno` (`siteId`),
  KEY `craft_idx_hdgeqqzdqunulaigtymfopspgwabxsaqgtfw` (`title`),
  CONSTRAINT `craft_fk_fbzwsjizopuyrebrzcpturcysqbiddyjxskf` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rxvkkuwuzubkihbjryvlowfouhjrnmuxzhgd` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_content`
--

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;
INSERT INTO `craft_content` VALUES (1,1,1,NULL,'2023-01-04 13:25:22','2023-01-04 13:25:22','d4867934-84cd-4a63-8ff9-a3d2019dc890');
/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_craftidtokens`
--

DROP TABLE IF EXISTS `craft_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fk_tpvwfyfjoloqdkoglbxyjshyemaibmedovgh` (`userId`),
  CONSTRAINT `craft_fk_tpvwfyfjoloqdkoglbxyjshyemaibmedovgh` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_craftidtokens`
--

LOCK TABLES `craft_craftidtokens` WRITE;
/*!40000 ALTER TABLE `craft_craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_deprecationerrors`
--

DROP TABLE IF EXISTS `craft_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_osketqjyzkumoiwlcdnjphhrojodjuqnqqhh` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_deprecationerrors`
--

LOCK TABLES `craft_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `craft_deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_drafts`
--

DROP TABLE IF EXISTS `craft_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `craft_idx_ibzsqjmhsmfbjeqzwoflewlhsyftjjjdpexi` (`creatorId`,`provisional`),
  KEY `craft_idx_jesnfmvchbmgtbqfwsninsldnwwkzagobgjz` (`saved`),
  KEY `craft_fk_kftcpxerhsvzooemiejfjezlczmykqmwtdla` (`canonicalId`),
  CONSTRAINT `craft_fk_kftcpxerhsvzooemiejfjezlczmykqmwtdla` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_opgjuzzeutngrlqariaibdhsemjcppqfqzmt` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_drafts`
--

LOCK TABLES `craft_drafts` WRITE;
/*!40000 ALTER TABLE `craft_drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements`
--

DROP TABLE IF EXISTS `craft_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dvhttluxcrnyslsngjopfophntnuynbzotle` (`dateDeleted`),
  KEY `craft_idx_eknqghnzivxmcwqmpuqagbsvmbqlggulmcoj` (`fieldLayoutId`),
  KEY `craft_idx_abmtobjbklwefvvshoxofastsxeiplgmkvzb` (`type`),
  KEY `craft_idx_odspmtragqcnrsmcgydlhlzoptgsqhdxgdbr` (`enabled`),
  KEY `craft_idx_xmckdeakumqhqznawnrplmmewqiutqgohtto` (`archived`,`dateCreated`),
  KEY `craft_idx_fihqdkxhgcgxsykchhjqqllwjpupebjtvysl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `craft_idx_bxlnluhiqiozwrxpwhbmoitojetyongkzvmi` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `craft_fk_elwjbevwijxthomtiuhvgopewjnmdqsxarqn` (`canonicalId`),
  KEY `craft_fk_qenmoqsqlezsakrsuahpeeruosrjogqxkaci` (`draftId`),
  KEY `craft_fk_fjttobmrsfslepgkzbhlvoalefsykngahzfb` (`revisionId`),
  CONSTRAINT `craft_fk_elwjbevwijxthomtiuhvgopewjnmdqsxarqn` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_fjttobmrsfslepgkzbhlvoalefsykngahzfb` FOREIGN KEY (`revisionId`) REFERENCES `craft_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_fydljzztdkzoabxjyncutxilyvkeezxnhofi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_qenmoqsqlezsakrsuahpeeruosrjogqxkaci` FOREIGN KEY (`draftId`) REFERENCES `craft_drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements`
--

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;
INSERT INTO `craft_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-01-04 13:25:21','2023-01-04 13:25:21',NULL,NULL,'0ab5a071-47ec-48dc-af62-2001de67b449');
/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_elements_sites`
--

DROP TABLE IF EXISTS `craft_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_dxvvrcwlpcknhxwqaaevcanatrhcspluuqkn` (`elementId`,`siteId`),
  KEY `craft_idx_iixcfgmfggztxbzifozoptasrenrbzrfophk` (`siteId`),
  KEY `craft_idx_dvzivstlhedeikiszhrawcimviibqiyhazqu` (`slug`,`siteId`),
  KEY `craft_idx_rtytojpdzsytsqypcsdtoxvkxwxkaylhpswr` (`enabled`),
  KEY `craft_idx_mtmwbnpdhsmsvsjksnnoakyxslyhgunkuvjt` (`uri`,`siteId`),
  CONSTRAINT `craft_fk_goejrxlayhbehbcjcrkzckuxtmqqidaazgaw` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ivncwlxmwtcimovdoyfprcvflemjkxfeyupf` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_elements_sites`
--

LOCK TABLES `craft_elements_sites` WRITE;
/*!40000 ALTER TABLE `craft_elements_sites` DISABLE KEYS */;
INSERT INTO `craft_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-01-04 13:25:22','2023-01-04 13:25:22','5d9aa554-7281-45ff-8336-bbc151697595');
/*!40000 ALTER TABLE `craft_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entries`
--

DROP TABLE IF EXISTS `craft_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_rhbxdkjnanpyqjejiaiyrvyaivybobubtbls` (`postDate`),
  KEY `craft_idx_cmnshiesviorupqjjtwxmrswtsfgbkrqcseb` (`expiryDate`),
  KEY `craft_idx_frkdvtqymqlvkscprlhpcfwcrklhpopplvek` (`authorId`),
  KEY `craft_idx_cdthwrbjrmgjjlzvwmedwgmcwnlxcqwqpgms` (`sectionId`),
  KEY `craft_idx_flckczayqtleonainydgqjovhepiqodjxgsm` (`typeId`),
  KEY `craft_fk_eiaskdymkpoaosxwantklosebylwtxjowrfh` (`parentId`),
  CONSTRAINT `craft_fk_dlspipiackpomabmteyzeiapfpgjguhfdtes` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_eiaskdymkpoaosxwantklosebylwtxjowrfh` FOREIGN KEY (`parentId`) REFERENCES `craft_entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_khjexdpdzlawaxylemnadrrygcocihbqzalq` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_rjztpwjaixzdoftynhfrhxcmzzkzitctdqyb` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_wixisgbrczuouznfwqrylwespplfwzzsaick` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entries`
--

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_entrytypes`
--

DROP TABLE IF EXISTS `craft_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_bbvftpvvmfqdckrchlqecqixqbcrksisxtyw` (`name`,`sectionId`),
  KEY `craft_idx_fyirsuxgqoclihpmfcuixaitudxjjaovfwez` (`handle`,`sectionId`),
  KEY `craft_idx_novtjrlvljamhxdhdundfjovzgqmwiaqrkyo` (`sectionId`),
  KEY `craft_idx_jilkkdbknoilgywnprbmygrzjhxinnmwxcqe` (`fieldLayoutId`),
  KEY `craft_idx_gsmqpsuqhxulnxdmratoynyuvtixhaytrbgi` (`dateDeleted`),
  CONSTRAINT `craft_fk_gljgfluqsfoxfzriwmuvdnroazwanzkcwdvq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_prhczcxdwwffxujwjxjvpvxxiwusyrhyfzgd` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_entrytypes`
--

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldgroups`
--

DROP TABLE IF EXISTS `craft_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_nualbfyuxcmuairwsyhqjaazholnbwfbolgs` (`name`),
  KEY `craft_idx_ykqgevnzwiejmaqbzdrvmvuopczizzqqzgqo` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldgroups`
--

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;
INSERT INTO `craft_fieldgroups` VALUES (1,'Common','2023-01-04 13:25:21','2023-01-04 13:25:21',NULL,'70d3c04f-75fd-40b0-bcb2-3ce87ed1c356');
/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayoutfields`
--

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_qcagyifoqlrmavbyaewzhljcslmiuwimwxgc` (`layoutId`,`fieldId`),
  KEY `craft_idx_bqujprgqctmejvfpwmfqkkmpdxyjdoqcoarr` (`sortOrder`),
  KEY `craft_idx_rfcxzslavraassvdgteecxjidvqatnlufibp` (`tabId`),
  KEY `craft_idx_kwxqhjfrhwqazeteiyfaenleaixcbyjomakt` (`fieldId`),
  CONSTRAINT `craft_fk_huqwsgniqefqkghfwhzvieqvugjjwtkgkrly` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_icvcbfetpyyvrobcnijqblwqsopfdsgqoqml` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_tttwlptyoeiylrbzejpqpcjcaqketmklific` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouts`
--

DROP TABLE IF EXISTS `craft_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ivchiihhibyzjpanigfvaejtxlucfvdpbxol` (`dateDeleted`),
  KEY `craft_idx_skgjgdpfqfzqepptpibpgzvfdbozankrtbaz` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouts`
--

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fieldlayouttabs`
--

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_sporgzdrpzfrorvmtaempxsmbxpipvizsyts` (`sortOrder`),
  KEY `craft_idx_rqdtaghvorixvfacigxixiivnyqzsubfixrr` (`layoutId`),
  CONSTRAINT `craft_fk_nxifrxvavxejuomrzutlqqbmvynlfzszodmu` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_fields`
--

DROP TABLE IF EXISTS `craft_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_rznazhvfedhqqutuzsjjnioregluuoidzqsl` (`handle`,`context`),
  KEY `craft_idx_mryfogqzimsyvnrkqcumxwyzbyraajygevdb` (`groupId`),
  KEY `craft_idx_pfqebmyrlghyzolitcnmwkjffxzlkdfsznan` (`context`),
  CONSTRAINT `craft_fk_ukzukdfdukklulgjptcwmccgbtquzqoijxfw` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_fields`
--

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_globalsets`
--

DROP TABLE IF EXISTS `craft_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_cdkjpmcnupotsgtezloveferniqzscbetjao` (`name`),
  KEY `craft_idx_itkzwvwncrbqvtsuvduzwhxawevyyrepckhv` (`handle`),
  KEY `craft_idx_vxdguzremdwnbmdyeduqmttjpmlphnvnwmch` (`fieldLayoutId`),
  KEY `craft_idx_mlnpmcmorqjgditmsbcshbdzdijkbbrgcbrc` (`sortOrder`),
  CONSTRAINT `craft_fk_fbreqvbnihjfkggdiniygfougbcyqyeqswel` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_sxkxqzazogecssflpoyjxhkpwlbwbyokmdlg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_globalsets`
--

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqlschemas`
--

DROP TABLE IF EXISTS `craft_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqlschemas`
--

LOCK TABLES `craft_gqlschemas` WRITE;
/*!40000 ALTER TABLE `craft_gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_gqltokens`
--

DROP TABLE IF EXISTS `craft_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_anrckapvmqglvekcvlifmxfneevbqutbhbua` (`accessToken`),
  UNIQUE KEY `craft_idx_mrpjnczumyipnxvjzcgctqbajsbechwsxzph` (`name`),
  KEY `craft_fk_jvmldwwugnyyvxotjxackvpnzteyrqpinmzg` (`schemaId`),
  CONSTRAINT `craft_fk_jvmldwwugnyyvxotjxackvpnzteyrqpinmzg` FOREIGN KEY (`schemaId`) REFERENCES `craft_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_gqltokens`
--

LOCK TABLES `craft_gqltokens` WRITE;
/*!40000 ALTER TABLE `craft_gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_imagetransformindex`
--

DROP TABLE IF EXISTS `craft_imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_jsxukpxgwrgvisfoppankydudqhthupqmgtf` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_imagetransformindex`
--

LOCK TABLES `craft_imagetransformindex` WRITE;
/*!40000 ALTER TABLE `craft_imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_imagetransforms`
--

DROP TABLE IF EXISTS `craft_imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_uqmdimguxkaxdojvjuqycaetvlwigykcxqmj` (`name`),
  KEY `craft_idx_jwcslunhgtakeuaffeonzpkeymtlwmhuiehh` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_imagetransforms`
--

LOCK TABLES `craft_imagetransforms` WRITE;
/*!40000 ALTER TABLE `craft_imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_info`
--

DROP TABLE IF EXISTS `craft_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_info`
--

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;
INSERT INTO `craft_info` VALUES (1,'4.3.5','4.0.0.9',0,'egygdyrlxcih','3@qrfpoyeyoq','2023-01-04 13:25:21','2023-01-04 13:26:35','844d30c4-ce65-4e90-82b8-0281064fc742');
/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks`
--

DROP TABLE IF EXISTS `craft_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_bzorymokwaheevgwrdtuvzrtsemylfutrpsz` (`primaryOwnerId`),
  KEY `craft_idx_rawgiyvqegfzfckjbbyygjukbylrlkaipxtz` (`fieldId`),
  KEY `craft_idx_lwgtjvzzjuzgkizvbaxyjbijpoawypvfpvuv` (`typeId`),
  CONSTRAINT `craft_fk_oeignostwjueewluwnserutbvieizplogjdb` FOREIGN KEY (`primaryOwnerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_okqzfvqxnwzuclimbbxguxbpjvjjqnxxrnfs` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_pixzyupsgehctbbzabbvyyphaybgkxnmckzs` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_xpjrvkcelxbinocszowvykbbjvlnfvydpjel` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks`
--

LOCK TABLES `craft_matrixblocks` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocks_owners`
--

DROP TABLE IF EXISTS `craft_matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `craft_fk_aaygdmvjdbmbpywyljjelubtvqgynudebueq` (`ownerId`),
  CONSTRAINT `craft_fk_aaygdmvjdbmbpywyljjelubtvqgynudebueq` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_gcassthrbqqvlegiwvkvvwatijfxrqnijsqc` FOREIGN KEY (`blockId`) REFERENCES `craft_matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocks_owners`
--

LOCK TABLES `craft_matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_matrixblocktypes`
--

DROP TABLE IF EXISTS `craft_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ytglscgadotgltrmolnaxehqklyaxosmzxpt` (`name`,`fieldId`),
  KEY `craft_idx_wxrnzfaefqhcrfsnbobkrjsqzfbzbnyltdhr` (`handle`,`fieldId`),
  KEY `craft_idx_gtxdanuzxpmzpjpraxenpoqvkhitdczdgtjn` (`fieldId`),
  KEY `craft_idx_mbrhrnmonacdvqsrfcjmhsywocjyyityiuiq` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_pmkzraetuxydgeafxxqdoshybhzemyyisqou` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_simlxvfitgryjavzxfbxdfrcpmtymmdtpvtb` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_matrixblocktypes`
--

LOCK TABLES `craft_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_migrations`
--

DROP TABLE IF EXISTS `craft_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_vanvianfjvyktoehimdjajlsjbcabbbhtbgn` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_migrations`
--

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;
INSERT INTO `craft_migrations` VALUES (1,'craft','Install','2023-01-04 13:25:24','2023-01-04 13:25:24','2023-01-04 13:25:24','292aaf50-e061-49f9-9d8e-601aa63d717f'),(2,'craft','m210121_145800_asset_indexing_changes','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','a19f71f2-57d1-4855-ab2a-3745f0a6c764'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','bf677058-a18b-411c-89da-9f2c3a7b2353'),(4,'craft','m210724_180756_rename_source_cols','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','f24c81de-a6e3-431e-a878-e837fa5af2e8'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','3011f8f2-b7ab-46a1-866a-72187d93cc78'),(6,'craft','m210817_014201_universal_users','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','2b807031-fbde-4837-9f2d-6e4d717d2d1e'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','57f97167-cf38-42e8-8435-6779ec5e929d'),(8,'craft','m211115_135500_image_transformers','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','1cd5bf4e-206d-4155-baae-3b05e8f18f2b'),(9,'craft','m211201_131000_filesystems','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','eb877d61-7012-4369-be51-af67e9cfac00'),(10,'craft','m220103_043103_tab_conditions','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','8318495a-fc8a-4a7d-990d-a8536fd56844'),(11,'craft','m220104_003433_asset_alt_text','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','2db64644-126b-4990-b994-ee30149cbe7e'),(12,'craft','m220123_213619_update_permissions','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','70e3a857-896d-44e3-b434-41d68fc1b88c'),(13,'craft','m220126_003432_addresses','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','837d8c75-9881-40d2-aa64-45dd84a83da7'),(14,'craft','m220209_095604_add_indexes','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','2f884f93-59a4-4ac9-964d-161048a39210'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','7c6d339f-22f6-4573-920d-25e5ec62edf8'),(16,'craft','m220214_000000_truncate_sessions','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','61312628-ae37-4aff-bc8a-eaf7aaa968fb'),(17,'craft','m220222_122159_full_names','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','4e857cad-68a2-4ff5-9ea8-2caf6be2d278'),(18,'craft','m220223_180559_nullable_address_owner','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','ec6c2058-e7e1-491f-a289-9898925604b6'),(19,'craft','m220225_165000_transform_filesystems','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','9e0f3881-6975-4c68-ab7b-bc5312737049'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','476641a0-0cd2-4f0e-a5e8-c48a49ae0876'),(21,'craft','m220314_211928_field_layout_element_uids','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','d9d6ac81-6c60-4c97-99f2-18931a8245d1'),(22,'craft','m220316_123800_transform_fs_subpath','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','271423a6-caca-428c-8e28-d4b83fd60a89'),(23,'craft','m220317_174250_release_all_jobs','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','ec2a4be1-0869-4de7-93c9-593ddd71e758'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','441173bc-1780-409c-8bab-1b530ad5ee9a'),(25,'craft','m220413_024536_site_enabled_string','2023-01-04 13:25:25','2023-01-04 13:25:25','2023-01-04 13:25:25','a8364e9b-5dd5-49fb-9dde-162858f25308');
/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_plugins`
--

DROP TABLE IF EXISTS `craft_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_syxrxjecutswtyklcjflvrrmntdqxxuanfvw` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_plugins`
--

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_projectconfig`
--

DROP TABLE IF EXISTS `craft_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_projectconfig`
--

LOCK TABLES `craft_projectconfig` WRITE;
/*!40000 ALTER TABLE `craft_projectconfig` DISABLE KEYS */;
INSERT INTO `craft_projectconfig` VALUES ('dateModified','1672838725'),('email.fromEmail','\"chealey@propelcog.com\"'),('email.fromName','\"NILD\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.70d3c04f-75fd-40b0-bcb2-3ce87ed1c356.name','\"Common\"'),('meta.__names__.70d3c04f-75fd-40b0-bcb2-3ce87ed1c356','\"Common\"'),('meta.__names__.746e86bd-8785-4f3e-9787-eafea0aa0f40','\"NILD\"'),('meta.__names__.a8d19b21-b199-43de-8b7d-96edb1c8caa3','\"NILD\"'),('siteGroups.746e86bd-8785-4f3e-9787-eafea0aa0f40.name','\"NILD\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.handle','\"default\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.hasUrls','true'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.language','\"en-US\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.name','\"NILD\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.primary','true'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.siteGroup','\"746e86bd-8785-4f3e-9787-eafea0aa0f40\"'),('sites.a8d19b21-b199-43de-8b7d-96edb1c8caa3.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"NILD\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `craft_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_queue`
--

DROP TABLE IF EXISTS `craft_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_eudlbxdflryumxappidblwvmppzoxepehsly` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `craft_idx_iupblxkecxfhufilcxzyhfpgfzoahvvahfsl` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_queue`
--

LOCK TABLES `craft_queue` WRITE;
/*!40000 ALTER TABLE `craft_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_relations`
--

DROP TABLE IF EXISTS `craft_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xqstuwtpfdkkipfucuhlxggrjsmmmouhjckk` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `craft_idx_dnkvzymsntotfdvkypjbtnlpbshqavjpkjpa` (`sourceId`),
  KEY `craft_idx_ugkcpjxwggguvqhjgztwvivzjkqzfxdzrkcc` (`targetId`),
  KEY `craft_idx_aazspoyvkeemtocbgywrnnqeklaiwbxzukyq` (`sourceSiteId`),
  CONSTRAINT `craft_fk_mrivpvmaseppaziitgslqemmhejwygzswgin` FOREIGN KEY (`sourceSiteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_fk_nxvobisdfpkbpirzqhwiiffsnqupfzgahxuo` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qizqczdvdqahrhpkevobwljyfjqhbxagafmk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ryybmrqnfhqgvevusqwmbbaczgbcgwjksizt` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_relations`
--

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_resourcepaths`
--

DROP TABLE IF EXISTS `craft_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_resourcepaths`
--

LOCK TABLES `craft_resourcepaths` WRITE;
/*!40000 ALTER TABLE `craft_resourcepaths` DISABLE KEYS */;
INSERT INTO `craft_resourcepaths` VALUES ('162e6fd1','@craft/web/assets/feed/dist'),('192be038','@craft/web/assets/velocity/dist'),('1cbce28f','@craft/web/assets/jquerypayment/dist'),('1cef3ded','@craft/web/assets/jquerytouchevents/dist'),('20e73851','@craft/web/assets/picturefill/dist'),('293b5295','@craft/web/assets/craftsupport/dist'),('2b5f8551','@craft/web/assets/xregexp/dist'),('40f5d951','@craft/web/assets/jqueryui/dist'),('4a124947','@bower/jquery/dist'),('4ff256af','@craft/web/assets/elementresizedetector/dist'),('5e8e0ffa','@craft/web/assets/fileupload/dist'),('6f6d491a','@craft/web/assets/dashboard/dist'),('83f52068','@craft/web/assets/axios/dist'),('85bd52f3','@craft/web/assets/iframeresizer/dist'),('8e97a49c','@craft/web/assets/updateswidget/dist'),('8edc5b44','@craft/web/assets/d3/dist'),('94e97d0d','@craft/web/assets/cp/dist'),('98a1df45','@craft/web/assets/selectize/dist'),('9fb46567','@craft/web/assets/tailwindreset/dist'),('b02de6f2','@craft/web/assets/recententries/dist'),('de31d3f9','@craft/web/assets/fabric/dist'),('f683e4ee','@craft/web/assets/garnish/dist');
/*!40000 ALTER TABLE `craft_resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_revisions`
--

DROP TABLE IF EXISTS `craft_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_gfnlszipfgorrzfeflutbyijjsooplvkwpqm` (`canonicalId`,`num`),
  KEY `craft_fk_kreuhyxisnvhbscjpakhajspdlsgfhtnldsn` (`creatorId`),
  CONSTRAINT `craft_fk_kreuhyxisnvhbscjpakhajspdlsgfhtnldsn` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_fk_zytprljxhaoojcxtwkwxbhavpenmqldckciw` FOREIGN KEY (`canonicalId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_revisions`
--

LOCK TABLES `craft_revisions` WRITE;
/*!40000 ALTER TABLE `craft_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_searchindex`
--

DROP TABLE IF EXISTS `craft_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `craft_idx_firzzgrnwnpaclsqhgzkusfgmvykgwzxqskr` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_searchindex`
--

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;
INSERT INTO `craft_searchindex` VALUES (1,'email',0,1,' chealey propelcog com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' chealey ');
/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections`
--

DROP TABLE IF EXISTS `craft_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_dihoqudpygnbwaeqetqsdvspzgnrqebdfkju` (`handle`),
  KEY `craft_idx_wycmyffuufhspvismbcptgswtnmqdyoedoyx` (`name`),
  KEY `craft_idx_dkiltabdujzisockziliqukkpsaapvxkcdgu` (`structureId`),
  KEY `craft_idx_pdysupomuazorfccfbplgsmmxjzrrcuwkyla` (`dateDeleted`),
  CONSTRAINT `craft_fk_awuezjuyiexlydmosecbqagljwuzydvidsle` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections`
--

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sections_sites`
--

DROP TABLE IF EXISTS `craft_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_glgtmokipbaozptmedlrtjqnmlchlimfxglw` (`sectionId`,`siteId`),
  KEY `craft_idx_lleciqtlotgziymrtwxvwbkovpgxyjigcnry` (`siteId`),
  CONSTRAINT `craft_fk_qwsvhbwnqofikanhuqmrenhjmtjeotefbjuv` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qysmacnoyynqwpjnwarcpdowjshaakapbawe` FOREIGN KEY (`siteId`) REFERENCES `craft_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sections_sites`
--

LOCK TABLES `craft_sections_sites` WRITE;
/*!40000 ALTER TABLE `craft_sections_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sequences`
--

DROP TABLE IF EXISTS `craft_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sequences`
--

LOCK TABLES `craft_sequences` WRITE;
/*!40000 ALTER TABLE `craft_sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sessions`
--

DROP TABLE IF EXISTS `craft_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ewgwpnjwrwdexiiitabkglhdqaxtytkzpalg` (`uid`),
  KEY `craft_idx_geryijcfsvarenyiexwbyxqemyaqoczmtdyg` (`token`),
  KEY `craft_idx_zcntjoylswsdcooljqdrfyxmfdkffeflxdmk` (`dateUpdated`),
  KEY `craft_idx_eicptgwipkjjprqyyowtroytmactnsfkjxft` (`userId`),
  CONSTRAINT `craft_fk_ctyfwvbjzcmghpimejnyfvymamkfcsvxgygs` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sessions`
--

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;
INSERT INTO `craft_sessions` VALUES (1,1,'gMPqdAmFydG9twVD56dyJC5ruZbFvt26qvH4ntl6-N6yGY70KuYQ5RUinbd4i1zsTVMsB3V2yVV8SOBB3zsIIxChkLYt0dSGBD6A','2023-01-04 13:28:19','2023-01-04 13:33:25','b600a781-35c6-4d63-8fdf-986e44aac959');
/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_shunnedmessages`
--

DROP TABLE IF EXISTS `craft_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_skijspofhvnqpendbggdgsascvieoimqexgo` (`userId`,`message`),
  CONSTRAINT `craft_fk_jgsoigncvjdhtgykxuaaduhfqqwmfejnnbwa` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_shunnedmessages`
--

LOCK TABLES `craft_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `craft_shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sitegroups`
--

DROP TABLE IF EXISTS `craft_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_ksrbrfyorxplbyrnqhjznpkckbjbenhohlns` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sitegroups`
--

LOCK TABLES `craft_sitegroups` WRITE;
/*!40000 ALTER TABLE `craft_sitegroups` DISABLE KEYS */;
INSERT INTO `craft_sitegroups` VALUES (1,'NILD','2023-01-04 13:25:21','2023-01-04 13:25:21',NULL,'746e86bd-8785-4f3e-9787-eafea0aa0f40');
/*!40000 ALTER TABLE `craft_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_sites`
--

DROP TABLE IF EXISTS `craft_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_vsmxwuoewrrtwuxqhdgsvbfmoqrbleimfhmg` (`dateDeleted`),
  KEY `craft_idx_vivyflvgeyggvcllwcatkiemvlryslzjfqgr` (`handle`),
  KEY `craft_idx_fozykfzoigznwxkyzejzioirflhrvkoaqoyr` (`sortOrder`),
  KEY `craft_fk_hlzrvcytqsxzqihshnlsoyhvvpyhvjfctrod` (`groupId`),
  CONSTRAINT `craft_fk_hlzrvcytqsxzqihshnlsoyhvvpyhvjfctrod` FOREIGN KEY (`groupId`) REFERENCES `craft_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_sites`
--

LOCK TABLES `craft_sites` WRITE;
/*!40000 ALTER TABLE `craft_sites` DISABLE KEYS */;
INSERT INTO `craft_sites` VALUES (1,1,1,'true','NILD','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-01-04 13:25:21','2023-01-04 13:25:21',NULL,'a8d19b21-b199-43de-8b7d-96edb1c8caa3');
/*!40000 ALTER TABLE `craft_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structureelements`
--

DROP TABLE IF EXISTS `craft_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_hktwhwxmuavjyzbtkcwecvyyxercpqrdahas` (`structureId`,`elementId`),
  KEY `craft_idx_dzgzbqjupvqnctkxcazarucqhnilnsqkblot` (`root`),
  KEY `craft_idx_npksagrasmdzsbmzlntoflimsimsgyilafhy` (`lft`),
  KEY `craft_idx_vjbnzedvshkeybbcnwaafqmntwhpfpzgsecg` (`rgt`),
  KEY `craft_idx_xbkfedtmxlybvfvnthkqoxloxzzmjgcxtdbh` (`level`),
  KEY `craft_idx_zexmtvjbjrbhynjoeslrssvrlotfocxctzje` (`elementId`),
  CONSTRAINT `craft_fk_glhvxxzuxdqchcutngxakgssvtiqlnhzqtqh` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_jlhxxnorkrdpbfuanuwwlnjzkcbmboujwfea` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structureelements`
--

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_structures`
--

DROP TABLE IF EXISTS `craft_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_atasdeanphdtiyzoxosqpcmtkixbdiyscqqb` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_structures`
--

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_systemmessages`
--

DROP TABLE IF EXISTS `craft_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_fjutdhiprokuuetyvsxgeudefqdrhxtpdups` (`key`,`language`),
  KEY `craft_idx_eporvetunxqhncnwauqpbiuishbxvowmzrcl` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_systemmessages`
--

LOCK TABLES `craft_systemmessages` WRITE;
/*!40000 ALTER TABLE `craft_systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_taggroups`
--

DROP TABLE IF EXISTS `craft_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_aqrfsuujymnxwpvszfbxgvihekcjqpcaorzq` (`name`),
  KEY `craft_idx_voockkjfwwvnzkrbfkvfvyllxyibewqisbui` (`handle`),
  KEY `craft_idx_brqeblbwgpdenzyejydlndyanqopqlcuyhgw` (`dateDeleted`),
  KEY `craft_fk_cdgjayuzyskoiqofvclhwmlvcylkollmkugl` (`fieldLayoutId`),
  CONSTRAINT `craft_fk_cdgjayuzyskoiqofvclhwmlvcylkollmkugl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_taggroups`
--

LOCK TABLES `craft_taggroups` WRITE;
/*!40000 ALTER TABLE `craft_taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tags`
--

DROP TABLE IF EXISTS `craft_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_azzfnukpgirolmqnhlffxigqwcvxqezgxznj` (`groupId`),
  CONSTRAINT `craft_fk_jtogwehlqlmodtxykkcpzkztqvzryndmfkjr` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_zsaeecwmdsivqknuknsaoevsmxvvixhvvete` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tags`
--

LOCK TABLES `craft_tags` WRITE;
/*!40000 ALTER TABLE `craft_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_tokens`
--

DROP TABLE IF EXISTS `craft_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_xkqvycwmucrewgyypihvrzizhksgpjrzjsed` (`token`),
  KEY `craft_idx_fjofyhhgvlcnodyinzqdhausjfcxeryawupj` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_tokens`
--

LOCK TABLES `craft_tokens` WRITE;
/*!40000 ALTER TABLE `craft_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups`
--

DROP TABLE IF EXISTS `craft_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_fyqixxusiewjfffyasqjfrzruxwbgxsebadv` (`handle`),
  KEY `craft_idx_zmifmsiepzpdkmegtqzrftfocqcspxhptogz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups`
--

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_usergroups_users`
--

DROP TABLE IF EXISTS `craft_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_taanioawysryaqxshmidhljuocngclfckzvo` (`groupId`,`userId`),
  KEY `craft_idx_xzjwtysahwnkrgqpwzgtbecyaazdlcptpnqg` (`userId`),
  CONSTRAINT `craft_fk_lohahkkdqetcxbmjqkfxduxpvlvifwuolycu` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_uqfnluzcuydtiguhantoafzebxgaipboymmq` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_usergroups_users`
--

LOCK TABLES `craft_usergroups_users` WRITE;
/*!40000 ALTER TABLE `craft_usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions`
--

DROP TABLE IF EXISTS `craft_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_fjoraicsfaqjmfxndggrxuwyafxnrlnlfnnw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions`
--

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_hzvuvlcdcgwjshacblvxdnlpnzdadqycjchz` (`permissionId`,`groupId`),
  KEY `craft_idx_jrrclbuhigpptcibgshsgtbfkpvaacoxllzq` (`groupId`),
  CONSTRAINT `craft_fk_nhokxsftkrvhakyzhbqqtjxxsivwiblqbrym` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_nrorzcesndugklstxafqmgmfpdpyotneyxzu` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_usergroups`
--

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpermissions_users`
--

DROP TABLE IF EXISTS `craft_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_zcmonavmryqoylqxlkyqbtkgckwqfxsjtzbw` (`permissionId`,`userId`),
  KEY `craft_idx_eulezfbqtpyllwszkcdvlgugqrhohpyqutzg` (`userId`),
  CONSTRAINT `craft_fk_ouucfgsyemjnyoyotixiumxzqsejldihtkwg` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ucaxxwxjpggakznvvzcfxzahlzuurmzcqvry` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpermissions_users`
--

LOCK TABLES `craft_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_userpreferences`
--

DROP TABLE IF EXISTS `craft_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `craft_fk_yutnxparyfkmhyjgbqrijzfdorrarjzzgnnj` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_userpreferences`
--

LOCK TABLES `craft_userpreferences` WRITE;
/*!40000 ALTER TABLE `craft_userpreferences` DISABLE KEYS */;
INSERT INTO `craft_userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `craft_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_users`
--

DROP TABLE IF EXISTS `craft_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_idx_natgtmzqgaxqnypimybagpmedsqcfwmgqsoz` (`active`),
  KEY `craft_idx_gszdkxfizzaqgcvbusejjqxovimsewkswxmd` (`locked`),
  KEY `craft_idx_bkwrsqnlozpvkkrgrbnrvdkfqqmphjetxyul` (`pending`),
  KEY `craft_idx_zzkgpcteajzcggdqtiretnfftxvjcojmnglh` (`suspended`),
  KEY `craft_idx_ggnxfynrbubqjjirlwfzrxclbbsbqphzgutn` (`verificationCode`),
  KEY `craft_idx_hssyqmyaxzqruvuxotfxxjtnymdpdjjsnbua` (`email`),
  KEY `craft_idx_wufmykhvhoessahzyscrgrpfgmipyttkefpb` (`username`),
  KEY `craft_fk_qszqztwezroltwbntfgztfespklzmshgvbgw` (`photoId`),
  CONSTRAINT `craft_fk_qjufcpwjcfdjevskhmutsvwvzotoibnwpneo` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_qszqztwezroltwbntfgztfespklzmshgvbgw` FOREIGN KEY (`photoId`) REFERENCES `craft_assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_users`
--

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;
INSERT INTO `craft_users` VALUES (1,NULL,1,0,0,0,1,'chealey',NULL,NULL,NULL,'chealey@propelcog.com','$2y$13$9pRkvD8RpoM3VwJT5gETluQuPHhqOXRLUWlqvZ3LqVHY4TwppvGom','2023-01-04 13:28:20',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-01-04 13:25:22','2023-01-04 13:25:22','2023-01-04 13:28:21');
/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumefolders`
--

DROP TABLE IF EXISTS `craft_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_idx_hgyowoyangpvorfhcukeywbhmefrvgvkghrr` (`name`,`parentId`,`volumeId`),
  KEY `craft_idx_vpjtmhqagnjitoulhmdnysgwuimbryhpgrdi` (`parentId`),
  KEY `craft_idx_mjcvbdobjlxiorfkxvwxrliuulidlfkcozeb` (`volumeId`),
  CONSTRAINT `craft_fk_cuadaadescfnpvaqmdwahducjikphxyihrat` FOREIGN KEY (`volumeId`) REFERENCES `craft_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fk_ofkihuumymjyxpteolicwlqgqetpzsnxfvrq` FOREIGN KEY (`parentId`) REFERENCES `craft_volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumefolders`
--

LOCK TABLES `craft_volumefolders` WRITE;
/*!40000 ALTER TABLE `craft_volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_volumes`
--

DROP TABLE IF EXISTS `craft_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_npozrdsboarcqzafaxylybfahembxwlkmuqj` (`name`),
  KEY `craft_idx_eeaazawrebnokyikmeozqtjiewoghcttxdmq` (`handle`),
  KEY `craft_idx_gpyzrurfcbsobgoasoxabqlucyksdtfntccl` (`fieldLayoutId`),
  KEY `craft_idx_xyegfalyreanwtfmiqxxwivnunkuupfokjbi` (`dateDeleted`),
  CONSTRAINT `craft_fk_jkktvemfjpmvsztjcylzyoaaykitinleieel` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_volumes`
--

LOCK TABLES `craft_volumes` WRITE;
/*!40000 ALTER TABLE `craft_volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `craft_volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craft_widgets`
--

DROP TABLE IF EXISTS `craft_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_idx_doysthssqowyeroolaoqiyfppfmjxrrgjbxf` (`userId`),
  CONSTRAINT `craft_fk_jxqnudkymuqlzsujjbqbcajjhnzjmudqsolb` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craft_widgets`
--

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;
INSERT INTO `craft_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-01-04 13:28:20','2023-01-04 13:28:20','30dce407-7022-429c-b055-3397dec8e245'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-01-04 13:28:20','2023-01-04 13:28:20','ffdfec5c-14f5-46c5-9390-0d553c17e1ab'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-01-04 13:28:21','2023-01-04 13:28:21','ff194e46-6256-4cf8-95aa-be2e824e005b'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-01-04 13:28:21','2023-01-04 13:28:21','148210ac-bee2-4ea2-b421-61798c6003ec');
/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 21:34:20
