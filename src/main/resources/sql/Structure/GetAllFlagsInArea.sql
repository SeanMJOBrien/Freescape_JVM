
SELECT pctf.PCTerritoryFlagID ,
       pctf.PlayerID ,
       pctf.StructureBlueprintID ,
       pctf.LocationAreaTag ,
       pctf.LocationX ,
       pctf.LocationY ,
       pctf.LocationZ ,
       pctf.LocationOrientation ,
       pctf.BuildPrivacySettingID ,
       sb.StructureBlueprintID ,
       sb.StructureCategoryID ,
       sb.Name ,
       sb.Description ,
       sb.Resref ,
       sb.IsActive ,
       sb.IsTerritoryFlag ,
       sb.IsUseable ,
       sb.ItemStorageCount ,
       sb.MaxStructuresCount ,
       sb.MaxBuildDistance ,
       sb.ResearchSlots ,
       sb.RPPerSecond,
       sb.Level
FROM dbo.PCTerritoryFlags pctf
JOIN dbo.StructureBlueprints sb ON sb.StructureBlueprintID = pctf.StructureBlueprintID
WHERE pctf.LocationAreaTag = :areaTag
ORDER BY sb.MaxBuildDistance DESC