



BEGIN TRANSACTION

DELETE FROM dbo.ChatLog

DELETE FROM dbo.ConstructionSiteComponents

DELETE FROM dbo.ConstructionSites

DELETE FROM dbo.PCCooldowns

DELETE FROM dbo.PCCorpseItems

DELETE FROM dbo.PCCorpses

DELETE FROM dbo.PCCustomEffects

DELETE FROM dbo.PCKeyItems

DELETE FROM dbo.PCPerks

DELETE FROM dbo.PCSkills

DELETE FROM dbo.PCMigrationItems

DELETE FROM dbo.PCMigrations

DELETE FROM dbo.PCOutfits

DELETE FROM dbo.PCOverflowItems

DELETE FROM dbo.PCSearchSiteItems

DELETE FROM dbo.PCSearchSites

DELETE FROM dbo.StructureQuickBuildAudit

DELETE FROM dbo.PCTerritoryFlagsStructuresItems

DELETE FROM dbo.PCTerritoryFlagsPermissions

DELETE FROM dbo.PCTerritoryFlagsStructures

DELETE FROM dbo.PCTerritoryFlags

DELETE FROM dbo.PCRegionalFame

DELETE FROM dbo.PCQuestKillTargetProgress

DELETE FROM dbo.PCQuestStatus

DELETE FROM dbo.ClientLogEvents

DELETE FROM dbo.PlayerCharacters

DELETE FROM dbo.StorageItems

DELETE FROM dbo.GrowingPlants

-- rollback
-- commit