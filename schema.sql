-- Schema definition for op-mysql data
-- Contains CREATE TABLE IF NOT EXISTS statements derived from oai_db-basic.sql example

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Table structure for table `AccessAndMobilitySubscriptionData`
CREATE TABLE IF NOT EXISTS `AccessAndMobilitySubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `gpsis` json DEFAULT NULL,
  `internalGroupIds` json DEFAULT NULL,
  `sharedVnGroupDataIds` json DEFAULT NULL,
  `subscribedUeAmbr` json DEFAULT NULL,
  `nssai` json DEFAULT NULL,
  `ratRestrictions` json DEFAULT NULL,
  `forbiddenAreas` json DEFAULT NULL,
  `serviceAreaRestriction` json DEFAULT NULL,
  `coreNetworkTypeRestrictions` json DEFAULT NULL,
  `rfspIndex` int(10) DEFAULT NULL,
  `subsRegTimer` int(10) DEFAULT NULL,
  `ueUsageType` int(10) DEFAULT NULL,
  `mpsPriority` tinyint(1) DEFAULT NULL,
  `mcsPriority` tinyint(1) DEFAULT NULL,
  `activeTime` int(10) DEFAULT NULL,
  `sorInfo` json DEFAULT NULL,
  `sorInfoExpectInd` tinyint(1) DEFAULT NULL,
  `sorafRetrieval` tinyint(1) DEFAULT NULL,
  `sorUpdateIndicatorList` json DEFAULT NULL,
  `upuInfo` json DEFAULT NULL,
  `micoAllowed` tinyint(1) DEFAULT NULL,
  `sharedAmDataIds` json DEFAULT NULL,
  `odbPacketServices` json DEFAULT NULL,
  `serviceGapTime` int(10) DEFAULT NULL,
  `mdtUserConsent` json DEFAULT NULL,
  `mdtConfiguration` json DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  `cagData` json DEFAULT NULL,
  `stnSr` varchar(50) DEFAULT NULL,
  `cMsisdn` varchar(50) DEFAULT NULL,
  `nbIoTUePriority` int(10) DEFAULT NULL,
  `nssaiInclusionAllowed` tinyint(1) DEFAULT NULL,
  `rgWirelineCharacteristics` varchar(50) DEFAULT NULL,
  `ecRestrictionDataWb` json DEFAULT NULL,
  `ecRestrictionDataNb` tinyint(1) DEFAULT NULL,
  `expectedUeBehaviourList` json DEFAULT NULL,
  `primaryRatRestrictions` json DEFAULT NULL,
  `secondaryRatRestrictions` json DEFAULT NULL,
  `edrxParametersList` json DEFAULT NULL,
  `ptwParametersList` json DEFAULT NULL,
  `iabOperationAllowed` tinyint(1) DEFAULT NULL,
  `wirelineForbiddenAreas` json DEFAULT NULL,
  `wirelineServiceAreaRestriction` json DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`) -- Assuming composite primary key based on context
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `Amf3GppAccessRegistration`
CREATE TABLE IF NOT EXISTS `Amf3GppAccessRegistration` (
  `ueid` varchar(15) NOT NULL,
  `amfInstanceId` varchar(50) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `purgeFlag` tinyint(1) DEFAULT NULL,
  `pei` varchar(50) DEFAULT NULL,
  `imsVoPs` json DEFAULT NULL,
  `deregCallbackUri` varchar(50) NOT NULL,
  `amfServiceNameDereg` json DEFAULT NULL,
  `pcscfRestorationCallbackUri` varchar(50) DEFAULT NULL,
  `amfServiceNamePcscfRest` json DEFAULT NULL,
  `initialRegistrationInd` tinyint(1) DEFAULT NULL,
  `guami` json NOT NULL,
  `backupAmfInfo` json DEFAULT NULL,
  `drFlag` tinyint(1) DEFAULT NULL,
  `ratType` json NOT NULL,
  `urrpIndicator` tinyint(1) DEFAULT NULL,
  `amfEeSubscriptionId` varchar(50) DEFAULT NULL,
  `epsInterworkingInfo` json DEFAULT NULL,
  `ueSrvccCapability` tinyint(1) DEFAULT NULL,
  `registrationTime` varchar(50) DEFAULT NULL,
  `vgmlcAddress` json DEFAULT NULL,
  `contextInfo` json DEFAULT NULL,
  `noEeSubscriptionInd` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ueid`, `amfInstanceId`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `AuthenticationStatus`
CREATE TABLE IF NOT EXISTS `AuthenticationStatus` (
  `ueid` varchar(20) NOT NULL,
  `nfInstanceId` varchar(50) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `timeStamp` varchar(50) NOT NULL,
  `authType` varchar(25) NOT NULL,
  `servingNetworkName` varchar(50) NOT NULL,
  `authRemovalInd` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ueid`, `nfInstanceId`, `authType`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `AuthenticationSubscription`
CREATE TABLE IF NOT EXISTS `AuthenticationSubscription` (
  `ueid` varchar(20) NOT NULL,
  `authenticationMethod` varchar(25) NOT NULL,
  `encPermanentKey` varchar(50) DEFAULT NULL,
  `protectionParameterId` varchar(50) DEFAULT NULL,
  `sequenceNumber` json DEFAULT NULL,
  `authenticationManagementField` varchar(50) DEFAULT NULL,
  `algorithmId` varchar(50) DEFAULT NULL,
  `encOpcKey` varchar(50) DEFAULT NULL,
  `encTopcKey` varchar(50) DEFAULT NULL,
  `vectorGenerationInHss` tinyint(1) DEFAULT NULL,
  `n5gcAuthMethod` varchar(15) DEFAULT NULL,
  `rgAuthenticationInd` tinyint(1) DEFAULT NULL,
  `supi` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ueid`) -- Assuming ueid is the primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SdmSubscriptions`
CREATE TABLE IF NOT EXISTS `SdmSubscriptions` (
  `ueid` varchar(15) NOT NULL,
  `subsId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, -- Added AUTO_INCREMENT assuming it's a primary/unique key
  `nfInstanceId` varchar(50) NOT NULL,
  `implicitUnsubscribe` tinyint(1) DEFAULT NULL,
  `expires` varchar(50) DEFAULT NULL,
  `callbackReference` varchar(50) NOT NULL,
  `amfServiceName` json DEFAULT NULL,
  `monitoredResourceUris` json NOT NULL,
  `singleNssai` json DEFAULT NULL,
  `dnn` varchar(50) DEFAULT NULL,
  `subscriptionId` varchar(50) DEFAULT NULL,
  `plmnId` json DEFAULT NULL,
  `immediateReport` tinyint(1) DEFAULT NULL,
  `report` json DEFAULT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `contextInfo` json DEFAULT NULL,
  PRIMARY KEY (`subsId`), -- Assuming subsId is the primary key
  UNIQUE KEY `ueid_nfInstanceId_callback` (`ueid`, `nfInstanceId`, `callbackReference`) -- Added potential unique key based on context
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SessionManagementSubscriptionData`
CREATE TABLE IF NOT EXISTS `SessionManagementSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `singleNssai` json NOT NULL,
  `dnnConfigurations` json DEFAULT NULL,
  `internalGroupIds` json DEFAULT NULL,
  `sharedVnGroupDataIds` json DEFAULT NULL,
  `sharedDnnConfigurationsId` varchar(50) DEFAULT NULL,
  `odbPacketServices` json DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  `sharedTraceDataId` varchar(50) DEFAULT NULL,
  `expectedUeBehavioursList` json DEFAULT NULL,
  `suggestedPacketNumDlList` json DEFAULT NULL,
  `3gppChargingCharacteristics` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`, `singleNssai`(255)) -- Example composite key, limited JSON key part
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SmfRegistrations`
CREATE TABLE IF NOT EXISTS `SmfRegistrations` (
  `ueid` varchar(15) NOT NULL,
  `subpduSessionId` int(10) NOT NULL,
  `smfInstanceId` varchar(50) NOT NULL,
  `smfSetId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ueid`, `subpduSessionId`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SmfSelectionSubscriptionData`
CREATE TABLE IF NOT EXISTS `SmfSelectionSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `subscribedSnssaiInfos` json DEFAULT NULL,
  `sharedSnssaiInfosId` varchar(50) DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SmsManagementSubscriptionData`
CREATE TABLE IF NOT EXISTS `SmsManagementSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  `mtSmsSubscribed` tinyint(1) DEFAULT NULL,
  `mtSmsBarringAll` tinyint(1) DEFAULT NULL,
  `mtSmsBarringRoaming` tinyint(1) DEFAULT NULL,
  `moSmsSubscribed` tinyint(1) DEFAULT NULL,
  `moSmsBarringAll` tinyint(1) DEFAULT NULL,
  `moSmsBarringRoaming` tinyint(1) DEFAULT NULL,
  `sharedSmsMngDataIds` json DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SmsSubscriptionData`
CREATE TABLE IF NOT EXISTS `SmsSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `smsSubscribed` tinyint(1) DEFAULT NULL,
  `sharedSmsSubsDataId` varchar(50) DEFAULT NULL,
  `traceData` json DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `SubscriptionDataSubscriptions`
CREATE TABLE IF NOT EXISTS `SubscriptionDataSubscriptions` (
  `subsId` varchar(50) NOT NULL,
  `ueid` varchar(15) NOT NULL,
  `callbackReference` varchar(50) NOT NULL,
  `originalCallbackReference` varchar(50) DEFAULT NULL,
  `monitoredResourceUris` json NOT NULL,
  `expiry` varchar(50) DEFAULT NULL,
  `supportedFeatures` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`subsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `V2xSubscriptionData`
CREATE TABLE IF NOT EXISTS `V2xSubscriptionData` (
  `ueid` varchar(15) NOT NULL,
  `servingPlmnid` varchar(15) NOT NULL,
  `nrV2xServicesAuth` json DEFAULT NULL,
  `lteV2xServicesAuth` json DEFAULT NULL,
  `nrUePc5Ambr` varchar(50) DEFAULT NULL,
  `ltePc5Ambr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ueid`, `servingPlmnid`) -- Assuming composite primary key
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */; 