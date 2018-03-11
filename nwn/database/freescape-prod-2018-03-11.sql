USE [master]
GO
/****** Object:  Database [freescape]    Script Date: 3/12/2018 12:25:26 AM ******/
CREATE DATABASE [freescape]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'freescape', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\freescape.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'freescape_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\freescape_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [freescape] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [freescape].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [freescape] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [freescape] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [freescape] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [freescape] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [freescape] SET ARITHABORT OFF 
GO
ALTER DATABASE [freescape] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [freescape] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [freescape] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [freescape] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [freescape] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [freescape] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [freescape] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [freescape] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [freescape] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [freescape] SET  ENABLE_BROKER 
GO
ALTER DATABASE [freescape] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [freescape] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [freescape] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [freescape] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [freescape] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [freescape] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [freescape] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [freescape] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [freescape] SET  MULTI_USER 
GO
ALTER DATABASE [freescape] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [freescape] SET DB_CHAINING OFF 
GO
ALTER DATABASE [freescape] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [freescape] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [freescape] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [freescape] SET QUERY_STORE = OFF
GO
USE [freescape]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [freescape]
GO
/****** Object:  Table [dbo].[Abilities]    Script Date: 3/12/2018 12:25:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abilities](
	[AbilityID] [int] NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[FeatID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[JavaScriptName] [varchar](64) NOT NULL,
	[BaseManaCost] [int] NOT NULL,
	[BaseCastingTime] [float] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[AbilityCategoryID] [int] NOT NULL,
	[AbilityCooldownCategoryID] [int] NULL,
	[IsQueuedWeaponSkill] [bit] NOT NULL,
	[SPPrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AbilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbilityCategories]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbilityCategories](
	[AbilityCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AbilityCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbilityCooldownCategories]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbilityCooldownCategories](
	[AbilityCooldownCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[BaseCooldownTime] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AbilityCooldownCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeID] [int] NOT NULL,
	[NWNValue] [int] NOT NULL,
	[Name] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorizedDMs]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorizedDMs](
	[AuthorizedDMID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CDKey] [nvarchar](20) NOT NULL,
	[DMRole] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorizedDMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaseItemTypes]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseItemTypes](
	[BaseItemTypeID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BaseItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuildPrivacyDomain]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuildPrivacyDomain](
	[BuildPrivacyTypeID] [int] NOT NULL,
	[Name] [nvarchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BuildPrivacyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatChannelsDomain]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatChannelsDomain](
	[ChatChannelID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ChatChannelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatLog]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLog](
	[ChatLogID] [bigint] IDENTITY(1,1) NOT NULL,
	[ChatChannelID] [int] NOT NULL,
	[SenderPlayerID] [nvarchar](60) NULL,
	[SenderAccountName] [nvarchar](1024) NOT NULL,
	[SenderCDKey] [nvarchar](20) NOT NULL,
	[ReceiverPlayerID] [nvarchar](60) NULL,
	[ReceiverAccountName] [nvarchar](1024) NULL,
	[ReceiverCDKey] [nvarchar](20) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[DateSent] [datetime2](7) NOT NULL,
	[SenderDMName] [nvarchar](60) NULL,
	[ReceiverDMName] [nvarchar](60) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChatLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLogEvents]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLogEvents](
	[ClientLogEventID] [int] IDENTITY(1,1) NOT NULL,
	[ClientLogEventTypeID] [int] NOT NULL,
	[PlayerID] [nvarchar](60) NULL,
	[CDKey] [nvarchar](20) NOT NULL,
	[AccountName] [nvarchar](1024) NOT NULL,
	[DateOfEvent] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ClientLogEvents_ClientLogEventID] PRIMARY KEY CLUSTERED 
(
	[ClientLogEventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLogEventTypesDomain]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLogEventTypesDomain](
	[ClientLogEventTypeID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ClientLogEventTypesDomain_ClientLogEventTypeID] PRIMARY KEY CLUSTERED 
(
	[ClientLogEventTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConstructionSiteComponents]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionSiteComponents](
	[ConstructionSiteComponentID] [int] IDENTITY(1,1) NOT NULL,
	[ConstructionSiteID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[StructureComponentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConstructionSiteComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConstructionSites]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConstructionSites](
	[ConstructionSiteID] [int] IDENTITY(1,1) NOT NULL,
	[PCTerritoryFlagID] [int] NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[StructureBlueprintID] [int] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConstructionSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftBlueprintCategories]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftBlueprintCategories](
	[CraftBlueprintCategoryID] [bigint] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CraftBlueprintCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftBlueprintComponents]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftBlueprintComponents](
	[CraftComponentID] [bigint] IDENTITY(1,1) NOT NULL,
	[CraftBlueprintID] [bigint] NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CraftComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CraftBlueprints]    Script Date: 3/12/2018 12:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CraftBlueprints](
	[CraftBlueprintID] [bigint] NOT NULL,
	[CraftID] [bigint] NOT NULL,
	[CraftCategoryID] [bigint] NOT NULL,
	[Level] [int] NOT NULL,
	[ItemName] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CraftBlueprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crafts]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crafts](
	[CraftID] [bigint] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CraftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Creatures]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Creatures](
	[CreatureID] [int] NOT NULL,
	[DifficultyRating] [float] NOT NULL,
	[XPModifier] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CreatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomEffects]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomEffects](
	[CustomEffectID] [bigint] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IconID] [int] NOT NULL,
	[ScriptHandler] [nvarchar](64) NOT NULL,
	[StartMessage] [nvarchar](64) NOT NULL,
	[ContinueMessage] [nvarchar](64) NOT NULL,
	[WornOffMessage] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomEffectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DMRoleDomain]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DMRoleDomain](
	[DMRoleDomainID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DMRoleDomainID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Downloads]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Downloads](
	[DownloadID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Downloads_DownloadID] PRIMARY KEY CLUSTERED 
(
	[DownloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FameRegions]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FameRegions](
	[FameRegionID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [QuestFameRegions_FameRegionID] PRIMARY KEY CLUSTERED 
(
	[FameRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[Resref] [nvarchar](16) NOT NULL,
	[AC] [int] NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[RecommendedLevel] [int] NOT NULL,
	[LoggingBonus] [int] NOT NULL,
	[MiningBonus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Resref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTypes]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTypes](
	[ItemTypeID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyItemCategories]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyItemCategories](
	[KeyItemCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeyItemCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeyItems]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeyItems](
	[KeyItemID] [int] NOT NULL,
	[KeyItemCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LootTableItems]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootTableItems](
	[LootTableItemID] [int] IDENTITY(1,1) NOT NULL,
	[LootTableID] [int] NOT NULL,
	[Resref] [varchar](16) NOT NULL,
	[MaxQuantity] [int] NOT NULL,
	[Weight] [tinyint] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LootTableItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LootTables]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LootTables](
	[LootTableID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LootTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPCGroups]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPCGroups](
	[NPCGroupID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_NPCGroups_NPCGroupID] PRIMARY KEY CLUSTERED 
(
	[NPCGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCAbilityCooldowns]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCAbilityCooldowns](
	[PCAbilityCooldownID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[AbilityCooldownCategoryID] [int] NOT NULL,
	[DateUnlocked] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCAbilityCooldownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCBlueprints]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCBlueprints](
	[PCBlueprintID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[CraftBlueprintID] [bigint] NOT NULL,
	[AcquiredDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCBlueprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCorpseItems]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCorpseItems](
	[PCCorpseItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PCCorpseID] [bigint] NOT NULL,
	[NWItemObject] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCCorpseItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCorpses]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCorpses](
	[PCCorpseID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PositionX] [float] NOT NULL,
	[PositionY] [float] NOT NULL,
	[PositionZ] [float] NOT NULL,
	[Orientation] [float] NOT NULL,
	[AreaTag] [nvarchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[PCCorpseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCCustomEffects]    Script Date: 3/12/2018 12:25:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCCustomEffects](
	[PCCustomEffectID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[CustomEffectID] [bigint] NOT NULL,
	[Ticks] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCCustomEffectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCKeyItems]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCKeyItems](
	[PCKeyItemID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[KeyItemID] [int] NOT NULL,
	[AcquiredDate] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCKeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCLearnedAbilities]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCLearnedAbilities](
	[PCLearnedAbilityID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[AcquiredDate] [datetime2](7) NOT NULL,
	[AbilityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCLearnedAbilityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCMigrationItems]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCMigrationItems](
	[PCMigrationItemID] [int] NOT NULL,
	[PCMigrationID] [int] NOT NULL,
	[CurrentResref] [nvarchar](16) NOT NULL,
	[NewResref] [nvarchar](16) NOT NULL,
	[StripItemProperties] [bit] NOT NULL,
	[BaseItemTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCMigrationItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCMigrations]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCMigrations](
	[PCMigrationID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCMigrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCOutfits]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCOutfits](
	[PlayerID] [nvarchar](60) NOT NULL,
	[Outfit1] [varbinary](max) NULL,
	[Outfit2] [varbinary](max) NULL,
	[Outfit3] [varbinary](max) NULL,
	[Outfit4] [varbinary](max) NULL,
	[Outfit5] [varbinary](max) NULL,
	[Outfit6] [varbinary](max) NULL,
	[Outfit7] [varbinary](max) NULL,
	[Outfit8] [varbinary](max) NULL,
	[Outfit9] [varbinary](max) NULL,
	[Outfit10] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCOverflowItems]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCOverflowItems](
	[PCOverflowItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[ItemObject] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCOverflowItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCQuestKillTargetProgress]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCQuestKillTargetProgress](
	[PCQuestKillTargetProgressID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[PCQuestStatusID] [int] NOT NULL,
	[NPCGroupID] [int] NOT NULL,
	[RemainingToKill] [int] NOT NULL,
 CONSTRAINT [PK_PCQuestKillTargetProgress_PCQuestKillTargetProgressID] PRIMARY KEY CLUSTERED 
(
	[PCQuestKillTargetProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCQuestStatus]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCQuestStatus](
	[PCQuestStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[QuestID] [int] NOT NULL,
	[CurrentQuestStateID] [int] NOT NULL,
	[CompletionDate] [datetime2](7) NULL,
	[SelectedItemRewardID] [int] NULL,
 CONSTRAINT [PK_PCQuestStatus_PCQuestStatusID] PRIMARY KEY CLUSTERED 
(
	[PCQuestStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCRegionalFame]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCRegionalFame](
	[PCRegionalFameID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[FameRegionID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_PCRegionalFame_PCRegionalFameID] PRIMARY KEY CLUSTERED 
(
	[PCRegionalFameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSearchSiteItems]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSearchSiteItems](
	[PCSearchSiteItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SearchSiteID] [int] NOT NULL,
	[SearchItem] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCSearchSiteItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSearchSites]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSearchSites](
	[PCSearchSiteID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SearchSiteID] [int] NOT NULL,
	[UnlockDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCSearchSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCSkills]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCSkills](
	[PCSkillID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[SkillID] [int] NOT NULL,
	[XP] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[IsLocked] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCTerritoryFlags]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCTerritoryFlags](
	[PCTerritoryFlagID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[StructureBlueprintID] [int] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
	[BuildPrivacySettingID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCTerritoryFlagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCTerritoryFlagsPermissions]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCTerritoryFlagsPermissions](
	[PCTerritoryFlagPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PCTerritoryFlagID] [int] NOT NULL,
	[PlayerID] [nvarchar](60) NOT NULL,
	[TerritoryFlagPermissionID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCTerritoryFlagPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCTerritoryFlagsStructures]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCTerritoryFlagsStructures](
	[PCTerritoryFlagStructureID] [bigint] IDENTITY(1,1) NOT NULL,
	[PCTerritoryFlagID] [int] NOT NULL,
	[StructureBlueprintID] [int] NOT NULL,
	[IsUseable] [bit] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
	[CreateDate] [datetime2](0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCTerritoryFlagStructureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCTerritoryFlagsStructuresItems]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCTerritoryFlagsStructuresItems](
	[PCStructureItemID] [bigint] IDENTITY(1,1) NOT NULL,
	[PCStructureID] [bigint] NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[ItemObject] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PCStructureItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCTerritoryFlagsStructuresResearchQueues]    Script Date: 3/12/2018 12:25:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues](
	[PCStructureResearchID] [int] IDENTITY(1,1) NOT NULL,
	[PCStructureID] [bigint] NOT NULL,
	[ResearchBlueprintID] [int] NOT NULL,
	[ResearchSlot] [int] NOT NULL,
	[StartDateTime] [datetime2](7) NOT NULL,
	[CompletedDateTime] [datetime2](7) NOT NULL,
	[IsCanceled] [bit] NOT NULL,
	[DeliverDateTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PCStructureResearchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerCharacters]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerCharacters](
	[PlayerID] [nvarchar](60) NOT NULL,
	[CharacterName] [nvarchar](max) NULL,
	[HitPoints] [int] NOT NULL,
	[LocationAreaTag] [nvarchar](64) NOT NULL,
	[LocationX] [float] NOT NULL,
	[LocationY] [float] NOT NULL,
	[LocationZ] [float] NOT NULL,
	[LocationOrientation] [float] NOT NULL,
	[CreateTimestamp] [datetime2](0) NOT NULL,
	[MaxHunger] [int] NOT NULL,
	[CurrentHunger] [int] NOT NULL,
	[CurrentHungerTick] [int] NOT NULL,
	[UnallocatedSP] [int] NOT NULL,
	[NextSPResetDate] [datetime2](0) NULL,
	[NumberOfSPResets] [int] NOT NULL,
	[ResetTokens] [int] NOT NULL,
	[NextResetTokenReceiveDate] [datetime2](0) NULL,
	[HPRegenerationAmount] [int] NOT NULL,
	[RegenerationTick] [int] NOT NULL,
	[RegenerationRate] [int] NOT NULL,
	[VersionNumber] [int] NOT NULL,
	[MaxMana] [int] NOT NULL,
	[CurrentMana] [int] NOT NULL,
	[CurrentManaTick] [int] NOT NULL,
	[RevivalStoneCount] [int] NOT NULL,
	[RespawnAreaTag] [nvarchar](64) NOT NULL,
	[RespawnLocationX] [float] NOT NULL,
	[RespawnLocationY] [float] NOT NULL,
	[RespawnLocationZ] [float] NOT NULL,
	[RespawnLocationOrientation] [float] NOT NULL,
	[DateLastForcedSPReset] [datetime2](7) NULL,
	[DateSanctuaryEnds] [datetime2](7) NOT NULL,
	[IsSanctuaryOverrideEnabled] [bit] NOT NULL,
	[STRBase] [int] NOT NULL,
	[DEXBase] [int] NOT NULL,
	[CONBase] [int] NOT NULL,
	[INTBase] [int] NOT NULL,
	[WISBase] [int] NOT NULL,
	[CHABase] [int] NOT NULL,
	[TotalSPAcquired] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestKillTargetList]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestKillTargetList](
	[QuestKillTargetListID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[NPCGroupID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestKillTargetList_QuestKillTargetListID] PRIMARY KEY CLUSTERED 
(
	[QuestKillTargetListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestPrerequisites]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestPrerequisites](
	[QuestPrerequisiteID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[RequiredQuestID] [int] NOT NULL,
 CONSTRAINT [PK_QuestPreqrequisites_QuestPrerequisiteID] PRIMARY KEY CLUSTERED 
(
	[QuestPrerequisiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRequiredItemList]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRequiredItemList](
	[QuestRequiredItemListID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestRequiredItemList_QuestRequiredItemListID] PRIMARY KEY CLUSTERED 
(
	[QuestRequiredItemListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRequiredKeyItemList]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRequiredKeyItemList](
	[QuestRequiredKeyItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[KeyItemID] [int] NOT NULL,
	[QuestStateID] [int] NOT NULL,
 CONSTRAINT [PK_QuestRequiredKeyItemList_QuestRequiredKeyItemID] PRIMARY KEY CLUSTERED 
(
	[QuestRequiredKeyItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestRewardItems]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestRewardItems](
	[QuestRewardItemID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_QuestRewards_QuestRewardID] PRIMARY KEY CLUSTERED 
(
	[QuestRewardItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quests]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quests](
	[QuestID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[JournalTag] [nvarchar](32) NOT NULL,
	[FameRegionID] [int] NOT NULL,
	[RequiredFameAmount] [int] NOT NULL,
	[AllowRewardSelection] [bit] NOT NULL,
	[RewardGold] [int] NOT NULL,
	[RewardXP] [int] NOT NULL,
	[RewardKeyItemID] [int] NULL,
	[RewardFame] [int] NOT NULL,
	[IsRepeatable] [bit] NOT NULL,
	[MapNoteTag] [nvarchar](32) NOT NULL,
	[StartKeyItemID] [int] NULL,
	[RemoveStartKeyItemAfterCompletion] [bit] NOT NULL,
 CONSTRAINT [PK_Quests_QuestID] PRIMARY KEY CLUSTERED 
(
	[QuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestStates]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestStates](
	[QuestStateID] [int] IDENTITY(1,1) NOT NULL,
	[QuestID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[QuestTypeID] [int] NOT NULL,
	[JournalStateID] [int] NOT NULL,
	[IsFinalState] [bit] NOT NULL,
 CONSTRAINT [PK_QuestStates_QuestStateID] PRIMARY KEY CLUSTERED 
(
	[QuestStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestTypeDomain]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestTypeDomain](
	[QuestTypeID] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_QuestTypeDomain_QuestTypeID] PRIMARY KEY CLUSTERED 
(
	[QuestTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResearchBlueprints]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResearchBlueprints](
	[ResearchBlueprintID] [int] IDENTITY(1,1) NOT NULL,
	[CraftBlueprintID] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Price] [int] NOT NULL,
	[ResearchPoints] [bigint] NOT NULL,
	[SkillRequired] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ResearchBlueprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerConfiguration]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerConfiguration](
	[ServerConfigurationID] [int] NOT NULL,
	[ServerName] [varchar](50) NOT NULL,
	[MessageOfTheDay] [varchar](1024) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServerConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillCategories]    Script Date: 3/12/2018 12:25:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillCategories](
	[SkillCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Sequence] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[SkillID] [int] NOT NULL,
	[SkillCategoryID] [int] NOT NULL,
	[Name] [nvarchar](32) NOT NULL,
	[MaxRank] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Primary] [int] NOT NULL,
	[Secondary] [int] NOT NULL,
	[Tertiary] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillXPRequirement]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillXPRequirement](
	[SkillXPRequirementID] [int] IDENTITY(1,1) NOT NULL,
	[SkillID] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[XP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SkillXPRequirementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpawnTableCreatures]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpawnTableCreatures](
	[SpawnTableCreatureID] [int] IDENTITY(1,1) NOT NULL,
	[SpawnTableID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Weight] [tinyint] NOT NULL,
	[MaxNumberInArea] [int] NOT NULL,
	[LootTableID] [int] NULL,
	[DifficultyRating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpawnTableCreatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpawnTables]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpawnTables](
	[SpawnTableID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SpawnTableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageContainers]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageContainers](
	[StorageContainerID] [int] NOT NULL,
	[AreaName] [nvarchar](255) NOT NULL,
	[AreaTag] [nvarchar](64) NOT NULL,
	[AreaResref] [nvarchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageContainerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageItems]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageItems](
	[StorageItemID] [int] IDENTITY(1,1) NOT NULL,
	[StorageContainerID] [int] NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[ItemTag] [nvarchar](64) NOT NULL,
	[ItemResref] [nvarchar](16) NOT NULL,
	[ItemObject] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StorageItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StructureBlueprints]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StructureBlueprints](
	[StructureBlueprintID] [int] NOT NULL,
	[StructureCategoryID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsTerritoryFlag] [bit] NOT NULL,
	[IsUseable] [bit] NOT NULL,
	[ItemStorageCount] [int] NOT NULL,
	[MaxStructuresCount] [int] NOT NULL,
	[MaxBuildDistance] [float] NOT NULL,
	[ResearchSlots] [int] NOT NULL,
	[RPPerSecond] [int] NOT NULL,
	[Level] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StructureBlueprintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StructureCategories]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StructureCategories](
	[StructureCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Description] [nvarchar](64) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsTerritoryFlagCategory] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StructureCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StructureComponents]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StructureComponents](
	[StructureComponentID] [int] IDENTITY(1,1) NOT NULL,
	[StructureBlueprintID] [int] NOT NULL,
	[Resref] [nvarchar](16) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StructureComponentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StructureQuickBuildAudit]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StructureQuickBuildAudit](
	[StructureQuickBuildID] [int] IDENTITY(1,1) NOT NULL,
	[PCTerritoryFlagID] [int] NULL,
	[PCTerritoryFlagStructureID] [bigint] NULL,
	[DMName] [nvarchar](200) NOT NULL,
	[DateBuilt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_StructureQuickBuildAudit_StructureQuickBuildID] PRIMARY KEY CLUSTERED 
(
	[StructureQuickBuildID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TerritoryFlagPermissions]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TerritoryFlagPermissions](
	[TerritoryFlagPermissionID] [int] NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSelectable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryFlagPermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/12/2018 12:25:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[DiscordUserID] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](32) NOT NULL,
	[AvatarHash] [nvarchar](max) NOT NULL,
	[Discriminator] [nvarchar](4) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[RoleID] [int] NOT NULL,
	[DateRegistered] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (0, -1, N'N/A')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (1, 0, N'STR')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (2, 1, N'DEX')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (3, 2, N'CON')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (4, 3, N'INT')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (5, 4, N'WIS')
INSERT [dbo].[Attributes] ([AttributeID], [NWNValue], [Name]) VALUES (6, 5, N'CHA')
SET IDENTITY_INSERT [dbo].[AuthorizedDMs] ON 

INSERT [dbo].[AuthorizedDMs] ([AuthorizedDMID], [Name], [CDKey], [DMRole], [IsActive]) VALUES (1, N'zunath', N'PXDK7WRX', 2, 1)
SET IDENTITY_INSERT [dbo].[AuthorizedDMs] OFF
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (-1, N'Invalid')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (0, N'shortsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (1, N'longsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (2, N'battleaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (3, N'bastardsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (4, N'lightflail')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (5, N'warhammer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (6, N'heavycrossbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (7, N'lightcrossbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (8, N'longbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (9, N'lightmace')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (10, N'halberd')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (11, N'shortbow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (12, N'twobladedsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (13, N'greatsword')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (14, N'smallshield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (15, N'torch')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (16, N'armor')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (17, N'helmet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (18, N'greataxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (19, N'amulet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (20, N'arrow')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (21, N'belt')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (22, N'dagger')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (23, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (24, N'miscsmall')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (25, N'bolt')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (26, N'boots')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (27, N'bullet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (28, N'club')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (29, N'miscmedium')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (30, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (31, N'dart')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (32, N'diremace')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (33, N'doubleaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (34, N'misclarge')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (35, N'heavyflail')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (36, N'gloves')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (37, N'lighthammer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (38, N'handaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (39, N'healerskit')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (40, N'kama')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (41, N'katana')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (42, N'kukri')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (43, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (44, N'magicrod')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (45, N'magicstaff')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (46, N'magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (47, N'morningstar')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (48, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (49, N'potions')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (50, N'quarterstaff')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (51, N'rapier')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (52, N'ring')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (53, N'scimitar')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (54, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (55, N'scythe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (56, N'largeshield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (57, N'towershield')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (58, N'shortspear')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (59, N'shuriken')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (60, N'sickle')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (61, N'sling')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (62, N'thievestools')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (63, N'throwingaxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (64, N'trapkit')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (65, N'key')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (66, N'largebox')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (67, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (68, N'DELETED')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (69, N'cslashweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (70, N'cpiercweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (71, N'cbludgweapon')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (72, N'cslshprcweap')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (73, N'creatureitem')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (74, N'book')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (75, N'spellscroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (76, N'gold')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (77, N'gem')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (78, N'bracer')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (79, N'miscthin')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (80, N'cloak')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (81, N'grenade')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (82, N'Encampment')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (83, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (84, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (85, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (86, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (87, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (88, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (89, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (90, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (91, N'padding')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (92, N'Lance')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (93, N'Trumpet')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (94, N'MoonOnAStick')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (95, N'trident')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (96, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (97, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (98, N'XP2SpecReq')
GO
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (99, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (100, N'XP2SpecReq')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (101, N'empty_potion')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (102, N'blank_scroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (103, N'blank_magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (104, N'crafted_potion')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (105, N'crafted_scroll')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (106, N'crafted_magicwand')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (107, N'XP2SpecialRequest')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (108, N'dwarvenwaraxe')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (109, N'craftcompbase')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (110, N'craftcompsmall')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (111, N'Whip')
INSERT [dbo].[BaseItemTypes] ([BaseItemTypeID], [Name]) VALUES (112, N'craftbase')
INSERT [dbo].[BuildPrivacyDomain] ([BuildPrivacyTypeID], [Name]) VALUES (0, N'Unknown')
INSERT [dbo].[BuildPrivacyDomain] ([BuildPrivacyTypeID], [Name]) VALUES (1, N'Owner Only')
INSERT [dbo].[BuildPrivacyDomain] ([BuildPrivacyTypeID], [Name]) VALUES (2, N'Friends Only')
INSERT [dbo].[BuildPrivacyDomain] ([BuildPrivacyTypeID], [Name]) VALUES (3, N'Public')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (1, N'Shout')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (2, N'Whisper')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (3, N'Talk')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (4, N'Party')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (5, N'DM')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (6, N'Tell')
INSERT [dbo].[ChatChannelsDomain] ([ChatChannelID], [Name]) VALUES (7, N'Server')
SET IDENTITY_INSERT [dbo].[ChatLog] ON 

INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (1, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'heyo', CAST(N'2018-03-09T12:24:17.8966667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (2, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Heya headless dude', CAST(N'2018-03-09T12:24:24.5933333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (3, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'mwhahaha', CAST(N'2018-03-09T12:24:28.4866667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (4, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'go ahead and grab some gearz', CAST(N'2018-03-09T12:24:36.6333333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (5, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok, there''s one error', CAST(N'2018-03-09T12:25:06.6266667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (6, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'one sec', CAST(N'2018-03-09T12:25:09.0900000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (7, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'gonna look at it', CAST(N'2018-03-09T12:25:11.9600000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (8, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Well the bread is an object i guess. Doens''t register as an inventory item since i can''t pick it up', CAST(N'2018-03-09T12:25:41.0633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (9, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'So you must have made it a placeable', CAST(N'2018-03-09T12:25:47.3333333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (10, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'it''s just for testing yeah', CAST(N'2018-03-09T12:25:54.0466667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (11, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'Ok don''t think the armor XP will work, but the other stuff should', CAST(N'2018-03-09T12:26:13.1000000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (12, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ready?', CAST(N'2018-03-09T12:26:17.9766667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (13, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'sure thign', CAST(N'2018-03-09T12:26:26.4233333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (14, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'I get one handed and shield experience when they die', CAST(N'2018-03-09T12:27:42.4900000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (15, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok, there''s a bug with armor and the bow', CAST(N'2018-03-09T12:27:53.7600000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (16, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'try spawning just one', CAST(N'2018-03-09T12:28:07.2133333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (17, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'didn''t kill anyone with the bow', CAST(N'2018-03-09T12:28:21.9900000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (18, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'So we don''t really know yet', CAST(N'2018-03-09T12:28:26.2133333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (19, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'anything?', CAST(N'2018-03-09T12:28:51.4700000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (20, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Alas. Didn''t get any though', CAST(N'2018-03-09T12:28:54.5633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (21, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok', CAST(N'2018-03-09T12:28:58.1766667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (22, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'check out your menu', CAST(N'2018-03-09T12:29:02.4700000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (23, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'see if your xp bar has changed', CAST(N'2018-03-09T12:29:07.5000000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (24, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'for shields + one handed', CAST(N'2018-03-09T12:29:12.8200000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (25, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'only the shield bar has actually charged some', CAST(N'2018-03-09T12:30:04.7200000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (26, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'No wait', CAST(N'2018-03-09T12:30:29.2433333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (27, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Now one handed shows progress', CAST(N'2018-03-09T12:30:42.4400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (28, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Not sure it did before', CAST(N'2018-03-09T12:30:50.0533333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (29, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Ahh', CAST(N'2018-03-09T12:31:22.3100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (30, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'I was just at the beginning of new level', CAST(N'2018-03-09T12:31:29.8933333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (31, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'yeah you leveled up', CAST(N'2018-03-09T12:31:41.5500000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (32, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'I think it''s working', CAST(N'2018-03-09T12:31:45.2900000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (33, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'cool. I''ll go fix these up', CAST(N'2018-03-09T12:32:45.0266667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (34, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'WEee', CAST(N'2018-03-09T12:32:47.6500000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (35, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'lol', CAST(N'2018-03-09T12:32:57.3233333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (36, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Got a message that i leveled onehanded up from 1 to 2', CAST(N'2018-03-09T12:33:00.8633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (37, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Bot not from 0 to 1 it seems', CAST(N'2018-03-09T12:33:07.6133333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (38, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'try using two hander', CAST(N'2018-03-09T12:33:25.3100000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (39, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'one sec', CAST(N'2018-03-09T12:33:58.5533333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (40, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'give me more to kill and lets see if this levels up and gives messages', CAST(N'2018-03-09T12:34:12.5400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (41, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'this should level you up', CAST(N'2018-03-09T12:34:27.4466667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (42, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'I changed your xp', CAST(N'2018-03-09T12:34:33.5000000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (43, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'It got a message', CAST(N'2018-03-09T12:34:43.6933333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (44, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Levelling up from 0 to 1', CAST(N'2018-03-09T12:35:02.0466667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (45, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'kk', CAST(N'2018-03-09T12:35:04.4700000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (46, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'alright I''ll go fix bows and armor', CAST(N'2018-03-09T12:35:17.3733333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (47, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Thats some pretty sweet progress right there :)', CAST(N'2018-03-09T12:35:17.9733333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (48, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'it''s giving you SP in the background too, you just can''t see it yet', CAST(N'2018-03-09T12:35:32.3833333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (49, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Tell me about it in Discord :)', CAST(N'2018-03-09T12:35:53.1633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (50, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'kk', CAST(N'2018-03-09T12:35:55.7500000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (51, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'oh crap, I just realized I have a memory leak with this lol', CAST(N'2018-03-09T13:01:52.6166667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (52, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'will need to fix that', CAST(N'2018-03-09T13:01:55.7166667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (53, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Got no experience message on this kill either', CAST(N'2018-03-09T13:02:11.0400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (54, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'did you get heavy armor and archery experience?', CAST(N'2018-03-09T13:02:11.9600000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (55, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'crap', CAST(N'2018-03-09T13:02:15.5100000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (56, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'not even armor?', CAST(N'2018-03-09T13:02:18.2833333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (57, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'They didn''t hit me but no.', CAST(N'2018-03-09T13:02:23.7766667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (58, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'it''s a static 10% regardless', CAST(N'2018-03-09T13:02:31.5800000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (59, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'But i dropped and equiped everything during the fight', CAST(N'2018-03-09T13:02:35.7266667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (60, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok try killing with melee', CAST(N'2018-03-09T13:02:35.8500000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (61, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'one moment', CAST(N'2018-03-09T13:02:46.8933333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (62, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Nothing', CAST(N'2018-03-09T13:03:05.5166667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (63, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok, let''s try melee', CAST(N'2018-03-09T13:03:09.6566667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (64, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'T', CAST(N'2018-03-09T13:03:40.0233333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (65, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Two handed and heavy armor', CAST(N'2018-03-09T13:03:47.1600000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (66, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'ok. it''s not linking your ranged hits', CAST(N'2018-03-09T13:03:56.3500000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (67, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'but glad armor is working', CAST(N'2018-03-09T13:04:02.9533333' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (68, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Dont think so', CAST(N'2018-03-09T13:04:05.1400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (69, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'yeah', CAST(N'2018-03-09T13:04:07.8266667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (70, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'try using light armor real quick', CAST(N'2018-03-09T13:04:10.8966667' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (71, 3, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Light armor AND two handed :)', CAST(N'2018-03-09T13:04:46.3333333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (72, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'perfect', CAST(N'2018-03-09T13:04:57.0500000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (73, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'alright. will go fix the memory leak and ranged weapons next', CAST(N'2018-03-09T13:05:07.4400000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (74, 3, NULL, N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'thx', CAST(N'2018-03-09T13:05:10.7000000' AS DateTime2), N'[DM: [DM] Zunath (UPWVMPKM)]', NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (75, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'heyo', CAST(N'2018-03-10T14:41:02.3733333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (76, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Heya', CAST(N'2018-03-10T14:41:05.8866667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (77, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'grab some gear from the box and then use the bread to spawn a goblin', CAST(N'2018-03-10T14:41:15.9400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (78, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Light armor one handed and shields', CAST(N'2018-03-10T14:42:18.1833333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (79, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Nothing that second time', CAST(N'2018-03-10T14:42:48.2500000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (80, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'Did you hit it?', CAST(N'2018-03-10T14:42:56.2633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (81, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'maybe i missed', CAST(N'2018-03-10T14:43:00.5566667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (82, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'you only get XP for what you do in combat', CAST(N'2018-03-10T14:43:03.2200000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (83, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'yeah you have to hit', CAST(N'2018-03-10T14:43:07.1066667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (84, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'got it third time', CAST(N'2018-03-10T14:43:07.9166667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (85, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'the enemies we create will have to last longer than a single hit', CAST(N'2018-03-10T14:43:23.2766667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (86, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'use the bread to heal', CAST(N'2018-03-10T14:44:50.9033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (87, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'or kill me lmfao', CAST(N'2018-03-10T14:44:55.7300000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (88, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'can you stab me a few times?', CAST(N'2018-03-10T14:45:41.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (89, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Seems to work', CAST(N'2018-03-10T14:45:45.4633333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (90, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'check your rest menu', CAST(N'2018-03-10T14:46:16.1600000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (91, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'make sure you got some XP', CAST(N'2018-03-10T14:46:20.8833333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (92, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'I did', CAST(N'2018-03-10T14:46:32.4400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (93, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'cool', CAST(N'2018-03-10T14:46:34.7600000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (94, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'I think this portion of it is done then', CAST(N'2018-03-10T14:46:39.7733333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (95, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Light armor seems to take a while to level up', CAST(N'2018-03-10T14:47:07.6200000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (96, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'yeah all of the armors will', CAST(N'2018-03-10T14:47:14.9100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (97, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'it''s a static 10% of total XP but I might bump it up to 20%', CAST(N'2018-03-10T14:47:29.5033333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (98, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Sure', CAST(N'2018-03-10T14:47:50.1566667' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (99, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'It''s better than having to take a hit to level it up', CAST(N'2018-03-10T14:47:51.0066667' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (100, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'Yeah', CAST(N'2018-03-10T14:48:01.6100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (101, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'I can get behind that', CAST(N'2018-03-10T14:48:06.9333333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (102, 3, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'zunath', N'UPWVMPKM', NULL, NULL, NULL, N'cool. well then, off to the next thing', CAST(N'2018-03-10T14:48:28.4733333' AS DateTime2), NULL, NULL)
INSERT [dbo].[ChatLog] ([ChatLogID], [ChatChannelID], [SenderPlayerID], [SenderAccountName], [SenderCDKey], [ReceiverPlayerID], [ReceiverAccountName], [ReceiverCDKey], [Message], [DateSent], [SenderDMName], [ReceiverDMName]) VALUES (103, 3, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Cablefish', N'UPFKQUKC', NULL, NULL, NULL, N'I''ve only levelled up once ', CAST(N'2018-03-10T14:48:48.8666667' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ChatLog] OFF
SET IDENTITY_INSERT [dbo].[ClientLogEvents] ON 

INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (1, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:43:42.4010000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (2, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:45:34.2860000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (3, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:49:19.5350000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (4, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:49:44.8000000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (5, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:49:51.7050000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (6, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:50:02.1930000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (7, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:50:29.4440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (8, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:52:27.2860000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (9, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T14:57:01.6110000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (10, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:04:42.8060000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (11, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:05:38.7530000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (12, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:14:44.5220000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (13, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:17:28.8130000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (14, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:19:21.6830000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (15, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:21:09.8830000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (16, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-08T15:39:39.8700000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (17, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T04:11:14.1620000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (18, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T05:06:32.4020000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (19, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T05:12:40.0180000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (20, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T05:34:40.7980000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (21, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T05:36:03.5440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (22, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:16:42.5220000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (23, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:17:18.9790000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (24, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:17:51.5190000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (25, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:19:13.9440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (26, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:19:34.7210000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (27, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:20:15.8730000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (28, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:21:56.8080000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (29, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:22:39.3880000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (30, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:23:02.7240000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (31, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:23:40.2150000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (32, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:29:12.6930000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (33, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:30:01.3080000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (34, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:30:18.9280000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (35, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:33:35.1970000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (36, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:34:04.5530000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (37, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:35:20.1710000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (38, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:35:41.2860000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (39, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:36:50.3940000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (40, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T11:50:28.0360000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (41, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:18:01.3160000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (42, 1, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'UPFKQUKC', N'Cablefish', CAST(N'2018-03-09T12:24:04.3660000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (43, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:55:50.6030000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (44, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:56:52.7570000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (45, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:56:59.4650000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (46, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:57:17.2070000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (47, 1, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:57:42.9550000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (48, 2, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:58:12.0200000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (49, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T12:58:42.8180000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (50, 1, N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'UPFKQUKC', N'Cablefish', CAST(N'2018-03-09T13:00:23.2340000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (51, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:45:19.1290000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (52, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:46:26.6040000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (53, 1, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:46:52.8440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (54, 2, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:47:01.7720000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (55, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:47:09.4630000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (56, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:47:57.7050000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (57, 1, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:48:07.4410000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (58, 2, N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:48:13.1330000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (59, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:48:21.7230000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (60, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:51:37.1760000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (61, 1, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:52:23.3880000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (62, 2, NULL, N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:52:45.6470000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (63, 1, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:53:09.3450000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (64, 2, N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T13:54:56.9830000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (65, 1, N'dee8c10a-e085-427a-9032-677007349682', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T14:12:29.5010000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (66, 2, N'dee8c10a-e085-427a-9032-677007349682', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T14:13:19.7850000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (67, 1, N'dee8c10a-e085-427a-9032-677007349682', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:24:54.2620000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (68, 2, N'dee8c10a-e085-427a-9032-677007349682', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:26:01.5460000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (69, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:29:44.6450000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (70, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:30:48.2130000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (71, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:39:51.6600000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (72, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-09T15:41:22.0110000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (73, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:04:14.6530000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (74, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:09:11.0210000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (75, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:09:42.7750000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (76, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:12:01.2760000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (77, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:17:45.1410000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (78, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:26:48.6460000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (79, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:28:35.0940000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (80, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:29:07.9440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (81, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:36:08.8290000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (82, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:45:19.2120000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (83, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:48:29.5580000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (84, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:52:54.3630000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (85, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T08:54:34.9610000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (86, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:05:44.8910000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (87, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:08:39.2680000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (88, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:11:51.8700000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (89, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:24:21.5090000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (90, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:27:16.8640000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (91, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:28:40.3120000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (92, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:35:16.3260000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (93, 2, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T09:44:46.4020000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (94, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:23:20.9520000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (95, 1, N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:26:53.8430000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (96, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:34:24.2840000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (97, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:37:07.7930000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (98, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:40:21.4580000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (99, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:48:24.8740000' AS DateTime2))
GO
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (100, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T13:51:09.6640000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (101, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:19:34.7220000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (102, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:21:09.6280000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (103, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:24:28.3260000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (104, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:25:34.6940000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (105, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:37:04.1750000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (106, 1, N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'UPFKQUKC', N'Cablefish', CAST(N'2018-03-10T14:40:50.9890000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (107, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T14:48:46.9060000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (108, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T15:50:51.3280000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (109, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-10T15:53:57.9580000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (110, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T02:42:36.7700000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (111, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T02:47:45.6350000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (112, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T02:54:46.9160000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (113, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T02:55:38.9010000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (114, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T03:56:03.3400000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (115, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T03:58:28.3410000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (116, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T04:52:02.3230000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (117, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T04:55:59.1900000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (118, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T04:59:53.6030000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (119, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T05:10:37.0770000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (120, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T06:47:05.0650000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (121, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T06:47:21.1910000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (122, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T06:48:30.5400000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (123, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T06:50:53.8670000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (124, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T06:55:21.4790000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (125, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T07:02:44.1570000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (126, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T07:09:57.7630000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (127, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T09:51:17.0990000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (128, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:01:29.7450000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (129, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:03:44.1150000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (130, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:07:55.7440000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (131, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:11:20.3620000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (132, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:18:30.6780000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (133, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:24:51.6330000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (134, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:26:20.5780000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (135, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:31:22.8230000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (136, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T10:32:30.8490000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (137, 1, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:05:06.1700000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (138, 2, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:05:35.6260000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (139, 1, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:07:33.1110000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (140, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:11:09.9800000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (141, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:11:29.2600000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (142, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:15:00.3480000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (143, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:15:27.3770000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (144, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:17:58.2340000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (145, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:24:14.7090000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (146, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:25:04.1730000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (147, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:29:10.1370000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (148, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:32:38.7620000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (149, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:36:19.4370000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (150, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T15:37:32.1580000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (151, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:15:01.2890000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (152, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:16:31.4410000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (153, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:17:28.6920000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (154, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:18:31.0100000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (155, 1, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:20:48.3730000' AS DateTime2))
INSERT [dbo].[ClientLogEvents] ([ClientLogEventID], [ClientLogEventTypeID], [PlayerID], [CDKey], [AccountName], [DateOfEvent]) VALUES (156, 2, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'UPWVMPKM', N'zunath', CAST(N'2018-03-11T16:23:34.8020000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ClientLogEvents] OFF
INSERT [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID], [Name]) VALUES (1, N'Log In')
INSERT [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID], [Name]) VALUES (2, N'Log Out')
SET IDENTITY_INSERT [dbo].[ConstructionSiteComponents] ON 

INSERT [dbo].[ConstructionSiteComponents] ([ConstructionSiteComponentID], [ConstructionSiteID], [Quantity], [StructureComponentID]) VALUES (5, 436, 14, 1)
INSERT [dbo].[ConstructionSiteComponents] ([ConstructionSiteComponentID], [ConstructionSiteID], [Quantity], [StructureComponentID]) VALUES (6, 436, 0, 2)
SET IDENTITY_INSERT [dbo].[ConstructionSiteComponents] OFF
SET IDENTITY_INSERT [dbo].[ConstructionSites] ON 

INSERT [dbo].[ConstructionSites] ([ConstructionSiteID], [PCTerritoryFlagID], [PlayerID], [StructureBlueprintID], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation]) VALUES (436, NULL, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 1, N'Area001', 10.473724365234375, 8.4166183471679688, 3.807907091868401E-07, 301.76907348632812)
SET IDENTITY_INSERT [dbo].[ConstructionSites] OFF
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (0, N'Unknown', 0)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (1, N'Components', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (2, N'Melee Weapons', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (3, N'Ranged Weapons', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (4, N'Ammo', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (5, N'Armor', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (6, N'Tools', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (7, N'Upgrade Kits', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (8, N'Repair Kits', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (9, N'Medical', 1)
INSERT [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID], [Name], [IsActive]) VALUES (12, N'Throwing', 1)
INSERT [dbo].[Crafts] ([CraftID], [Name], [IsActive], [Description]) VALUES (1, N'Smithery', 1, N'This craft enables you to create items such as blades and armor. A Smithery Workbench is required to use this craft.')
INSERT [dbo].[Crafts] ([CraftID], [Name], [IsActive], [Description]) VALUES (3, N'Mixing', 1, N'This craft enables you to create medical kits, treatment kits, food, and other restorative items. A Mixing Table is required to use this craft.')
INSERT [dbo].[Crafts] ([CraftID], [Name], [IsActive], [Description]) VALUES (4, N'Engineering', 1, N'This craft enables you to create guns, ammo, explosives and other mechanically-based items. An Engineering Workbench is required to use this craft.')
INSERT [dbo].[CustomEffects] ([CustomEffectID], [Name], [IconID], [ScriptHandler], [StartMessage], [ContinueMessage], [WornOffMessage]) VALUES (1, N'Bleeding', 129, N'BleedingEffect', N'You start bleeding.', N'You continue to bleed...', N'You have stopped bleeding.')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (1, N'DM')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (2, N'Admin')
INSERT [dbo].[DMRoleDomain] ([DMRoleDomainID], [Description]) VALUES (3, N'Player')
INSERT [dbo].[FameRegions] ([FameRegionID], [Name]) VALUES (3, N'Global')
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'bandages', 0, 3, 1, 0, 0)
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'healing_kit', 0, 3, 1, 0, 0)
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'healing_kit_p1', 0, 3, 11, 0, 0)
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'healing_kit_p2', 0, 3, 21, 0, 0)
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'healing_kit_p3', 0, 3, 31, 0, 0)
INSERT [dbo].[Items] ([Resref], [AC], [ItemTypeID], [RecommendedLevel], [LoggingBonus], [MiningBonus]) VALUES (N'healing_kit_p4', 0, 3, 41, 0, 0)
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (1, N'Light Armor')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (2, N'Heavy Armor')
INSERT [dbo].[ItemTypes] ([ItemTypeID], [Name]) VALUES (3, N'First Aid Supplies')
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (0, N'Unknown', 0)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (1, N'Maps', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (2, N'Quest Items', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (3, N'Documents', 1)
INSERT [dbo].[KeyItemCategories] ([KeyItemCategoryID], [Name], [IsActive]) VALUES (4, N'Blueprints', 1)
SET IDENTITY_INSERT [dbo].[PCSkills] ON 

INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (106, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 1, 680, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (107, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 2, 400, 0, 1)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (108, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 3, 169, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (109, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 4, 410, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (110, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 5, 216, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (111, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 6, 100, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (112, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 7, 66, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (113, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 8, 396, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (114, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 9, 400, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (115, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 10, 585, 2, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (116, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (117, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 12, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (118, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (119, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 14, 125, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (120, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 15, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (121, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (122, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (123, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (124, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (125, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (126, N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', 21, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (127, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 1, 240, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (128, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 2, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (129, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 3, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (130, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 4, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (131, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 5, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (132, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 6, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (133, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 7, 160, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (134, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 8, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (135, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 9, 240, 1, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (136, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 10, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (137, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (138, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 12, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (139, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (140, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 14, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (141, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 15, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (142, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (143, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (144, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (145, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (146, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (147, N'679b6e07-1412-44fc-abf3-002c3a769e8f', 21, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (148, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 1, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (149, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 2, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (150, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 3, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (151, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 4, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (152, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 5, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (153, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 6, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (154, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 7, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (155, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 8, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (156, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 9, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (157, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 10, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (158, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (159, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 12, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (160, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (161, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 14, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (162, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 15, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (163, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (164, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (165, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (166, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (167, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (168, N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', 21, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (169, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 1, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (170, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 2, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (171, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 3, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (172, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 4, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (173, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 5, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (174, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 6, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (175, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 7, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (176, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 8, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (177, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 9, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (178, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 10, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (179, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 11, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (180, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 12, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (181, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 13, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (182, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 14, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (183, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 15, 30, 2, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (184, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 16, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (185, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 17, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (186, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 18, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (187, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 19, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (188, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 20, 0, 0, 0)
INSERT [dbo].[PCSkills] ([PCSkillID], [PlayerID], [SkillID], [XP], [Rank], [IsLocked]) VALUES (189, N'755fada3-8a8b-48a9-b362-bdb83a97fd00', 21, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[PCSkills] OFF
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'08f91e32-0ee2-4fbf-8623-c61182cec772', N'Larry Tester', 13, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-09T12:24:04.0000000' AS DateTime2), 100, 91, 14, 8, NULL, 0, 3, NULL, 0, 14, 0, 1, 0, 0, 14, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-12T12:24:04.2800000' AS DateTime2), 0, 16, 13, 16, 10, 10, 9, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'34b8d367-68fc-4e19-b2bb-0df2c613bf04', N'aa Brian', 14, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-09T12:57:43.0000000' AS DateTime2), 100, 99, 54, 5, NULL, 0, 3, NULL, 0, 14, 0, 1, 0, 0, 14, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-12T12:57:42.9200000' AS DateTime2), 0, 16, 15, 14, 10, 10, 10, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'3eb39068-17c3-40ac-8766-dc66d32e30e4', N'Mard Undry', 67, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-09T15:29:45.0000000' AS DateTime2), 100, 85, 13, 13, NULL, 0, 3, NULL, 1, 12, 0, 1, 20, 20, 12, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-12T15:29:44.5433333' AS DateTime2), 0, 14, 8, 14, 10, 16, 14, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'4007c4ae-ddf5-4a5f-ab8e-a24515a36457', N'Shelino Davis', 27, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-10T13:34:24.0000000' AS DateTime2), 100, 86, 40, 12, NULL, 0, 3, NULL, 1, 19, 0, 1, 20, 20, 19, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-13T13:34:24.2233333' AS DateTime2), 0, 16, 15, 14, 10, 10, 10, 7)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'679b6e07-1412-44fc-abf3-002c3a769e8f', N'Annie TheTester', 31, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-10T14:40:51.0000000' AS DateTime2), 100, 96, 41, 7, NULL, 0, 3, NULL, 1, 20, 0, 1, 20, 14, 20, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-13T14:40:50.9000000' AS DateTime2), 0, 16, 15, 14, 10, 10, 10, 2)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'755fada3-8a8b-48a9-b362-bdb83a97fd00', N'Kashan Brina', 32, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-11T15:11:10.0000000' AS DateTime2), 100, 95, 13, 7, NULL, 0, 3, NULL, 1, 12, 0, 1, 20, 18, 12, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-14T15:11:09.9100000' AS DateTime2), 0, 16, 15, 14, 10, 10, 10, 2)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'af5072f4-c63e-4176-b738-5f9c0cc1a3c9', N'Waron Fryar', 32, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-11T15:07:33.0000000' AS DateTime2), 100, 99, 58, 5, NULL, 0, 3, NULL, 1, 17, 0, 1, 20, 10, 17, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-14T15:07:33.0433333' AS DateTime2), 0, 14, 14, 14, 10, 15, 10, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'dee8c10a-e085-427a-9032-677007349682', N'Deriane Reynolds', 35, N'Area001', 10, 10, 0, 90, CAST(N'2018-03-09T14:12:29.0000000' AS DateTime2), 100, 99, 41, 7, NULL, 0, 3, NULL, 1, 20, 0, 1, 20, 11, 20, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-12T14:12:29.4100000' AS DateTime2), 0, 16, 13, 16, 10, 10, 9, 0)
INSERT [dbo].[PlayerCharacters] ([PlayerID], [CharacterName], [HitPoints], [LocationAreaTag], [LocationX], [LocationY], [LocationZ], [LocationOrientation], [CreateTimestamp], [MaxHunger], [CurrentHunger], [CurrentHungerTick], [UnallocatedSP], [NextSPResetDate], [NumberOfSPResets], [ResetTokens], [NextResetTokenReceiveDate], [HPRegenerationAmount], [RegenerationTick], [RegenerationRate], [VersionNumber], [MaxMana], [CurrentMana], [CurrentManaTick], [RevivalStoneCount], [RespawnAreaTag], [RespawnLocationX], [RespawnLocationY], [RespawnLocationZ], [RespawnLocationOrientation], [DateLastForcedSPReset], [DateSanctuaryEnds], [IsSanctuaryOverrideEnabled], [STRBase], [DEXBase], [CONBase], [INTBase], [WISBase], [CHABase], [TotalSPAcquired]) VALUES (N'ee8df398-76f8-4885-826b-df4d0ce60bf2', N'Arto Arna', 2, N'Area001', 9.0405178070068359, 5.441347599029541, 0, 312, CAST(N'2018-03-08T14:42:11.0000000' AS DateTime2), 100, 88, 29, 11, NULL, 0, 3, NULL, 0, 9, 0, 1, 0, 0, 9, 3, N'', 0, 0, 0, 0, NULL, CAST(N'2018-03-11T14:42:11.4300000' AS DateTime2), 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (0, N'None')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (1, N'Kill Enemies')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (2, N'Talk to NPC')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (3, N'Use Object')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (4, N'Collect Items')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (5, N'Explore Area')
INSERT [dbo].[QuestTypeDomain] ([QuestTypeID], [Name]) VALUES (6, N'Use Item on Target')
INSERT [dbo].[ServerConfiguration] ([ServerConfigurationID], [ServerName], [MessageOfTheDay]) VALUES (1, N'Freescape', N'Welcome to Freescape!')
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (1, N'Melee Combat', 1, 1)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (2, N'Ranged Combat', 1, 2)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (3, N'Defense', 1, 3)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (4, N'Crafting', 1, 4)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (5, N'Utility', 1, 6)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (6, N'Magic', 1, 7)
INSERT [dbo].[SkillCategories] ([SkillCategoryID], [Name], [IsActive], [Sequence]) VALUES (7, N'Gathering', 1, 5)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (1, 1, N'One-Handed', 100, 1, N'Ability to use one-handed weapons like long swords and clubs. Higher skill levels unlock more powerful one-handed weapons.', 1, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (2, 1, N'Two-Handed', 100, 1, N'Ability to use heavy weapons like great swords and heavy flails in combat. Higher skill levels unlock more powerful two-handed weapons.', 1, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (3, 1, N'Twin Blades', 100, 1, N'Ability to use double edged weapons like two-bladed swords in combat. Higher skill levels unlock more powerful twin blade weapons.', 1, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (4, 1, N'Martial Arts', 100, 1, N'Ability to fight using martial gloves in combat. Higher skill levels unlock more powerful martial gloves.', 1, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (5, 2, N'Archery', 100, 1, N'Ability to use ranged weapons like longbows and crossbows in combat. Higher skill levels unlock more powerful bows.', 2, 5, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (6, 2, N'Throwing', 100, 1, N'Ability to use throwing weapons like shurikens, grenades and slings in combat. Higher skill levels unlock more powerful throwing weapons.', 2, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (7, 3, N'Light Armor', 100, 1, N'Ability to effectively defend against attacks while wearing light armor like robes. Higher skill levels unlock more powerful light armors.', 2, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (8, 3, N'Heavy Armor', 100, 1, N'Ability to effectively defend against attacks while wearing heavy armor like plate mail. Higher skill levels unlock more powerful heavy armors.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (9, 3, N'Shields', 100, 1, N'Ability to effectively defend against attacks while using shields. Higher skill levels unlock more powerful shields.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (10, 7, N'Mining', 100, 1, N'Ability to mine raw resources from ore veins. Higher skill levels increase yield and unlock tougher types of veins.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (11, 4, N'Metalworking', 100, 1, N'Ability to smelt ore nuggets obtained from mining and create tools used in other crafts. Higher skill levels increase smelting yield and allow more difficult ore to be smelted. Also reduces crafting difficulty and unlocks more recipes.', 2, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (12, 4, N'Weaponsmith', 100, 1, N'Ability to create weapons like axes and bows. Higher skill levels reduce crafting difficulty and unlock more recipes.', 2, 4, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (13, 4, N'Armorsmith', 100, 1, N'Ability to create armors like robes and plate mail. Higher skill levels reduce crafting difficulty and unlock more recipes.', 3, 4, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (14, 7, N'Logging', 100, 1, N'Ability to obtain wood from trees. Higher skill levels increase yield and unlock tougher types of trees.', 3, 1, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (15, 4, N'Construction', 100, 1, N'Ability to create structures like tents, chests, and houses. Higher skill levels unlock more structures available for building.', 4, 3, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (16, 4, N'Cooking', 100, 1, N'Ability to create food items which can grant temporary stat increases. Higher skill levels reduce crafting difficulty and unlock more recipes.', 4, 6, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (17, 5, N'First Aid', 100, 1, N'Ability to treat bodily injuries in the field with healing kits. Higher skill levels increase effectiveness of healing kits.', 4, 5, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (18, 5, N'Item Repair', 100, 1, N'Ability to repair an item and increase its durability. Higher skill levels increase the effectiveness of repair kits.', 4, 2, 0)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (19, 6, N'Evocation Magic', 100, 1, N'Ability to use offensive spells like flame and poison. Higher skill levels increase effectiveness of evocation spells.', 4, 5, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (20, 6, N'Alteration Magic', 100, 1, N'Ability to use recovery and defensive spells like cure and shield. Higher skill levels increase effectiveness of healing spells.', 5, 4, 6)
INSERT [dbo].[Skills] ([SkillID], [SkillCategoryID], [Name], [MaxRank], [IsActive], [Description], [Primary], [Secondary], [Tertiary]) VALUES (21, 6, N'Summoning Magic', 100, 1, N'Ability to summon creatures for a limited period of time. Higher skill levels increase duration of the creature. XP in this skill is gained as long as your summoned creature participates during battle.', 6, 5, 4)
SET IDENTITY_INSERT [dbo].[SkillXPRequirement] ON 

INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1, 1, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2, 1, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (3, 1, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (4, 1, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (5, 1, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (6, 1, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (7, 1, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (8, 1, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (9, 1, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (10, 1, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (11, 1, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (12, 1, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (13, 1, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (14, 1, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (15, 1, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (16, 1, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (17, 1, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (18, 1, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (19, 1, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (20, 1, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (21, 1, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (22, 1, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (23, 1, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (24, 1, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (25, 1, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (26, 1, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (27, 1, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (28, 1, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (29, 1, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (30, 1, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (31, 1, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (32, 1, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (33, 1, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (34, 1, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (35, 1, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (36, 1, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (37, 1, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (38, 1, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (39, 1, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (40, 1, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (41, 1, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (42, 1, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (43, 1, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (44, 1, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (45, 1, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (46, 1, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (47, 1, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (48, 1, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (49, 1, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (50, 1, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (51, 1, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (52, 1, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (53, 1, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (54, 1, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (55, 1, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (56, 1, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (57, 1, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (58, 1, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (59, 1, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (60, 1, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (61, 1, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (62, 1, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (63, 1, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (64, 1, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (65, 1, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (66, 1, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (67, 1, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (68, 1, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (69, 1, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (70, 1, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (71, 1, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (72, 1, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (73, 1, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (74, 1, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (75, 1, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (76, 1, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (77, 1, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (78, 1, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (79, 1, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (80, 1, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (81, 1, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (82, 1, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (83, 1, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (84, 1, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (85, 1, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (86, 1, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (87, 1, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (88, 1, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (89, 1, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (90, 1, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (91, 1, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (92, 1, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (93, 1, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (94, 1, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (95, 1, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (96, 1, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (97, 1, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (98, 1, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (99, 1, 98, 65000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (100, 1, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (101, 1, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (405, 2, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (406, 2, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (407, 2, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (408, 2, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (409, 2, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (410, 2, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (411, 2, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (412, 2, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (413, 2, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (414, 2, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (415, 2, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (416, 2, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (417, 2, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (418, 2, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (419, 2, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (420, 2, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (421, 2, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (422, 2, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (423, 2, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (424, 2, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (425, 2, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (426, 2, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (427, 2, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (428, 2, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (429, 2, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (430, 2, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (431, 2, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (432, 2, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (433, 2, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (434, 2, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (435, 2, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (436, 2, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (437, 2, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (438, 2, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (439, 2, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (440, 2, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (441, 2, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (442, 2, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (443, 2, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (444, 2, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (445, 2, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (446, 2, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (447, 2, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (448, 2, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (449, 2, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (450, 2, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (451, 2, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (452, 2, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (453, 2, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (454, 2, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (455, 2, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (456, 2, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (457, 2, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (458, 2, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (459, 2, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (460, 2, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (461, 2, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (462, 2, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (463, 2, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (464, 2, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (465, 2, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (466, 2, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (467, 2, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (468, 2, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (469, 2, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (470, 2, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (471, 2, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (472, 2, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (473, 2, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (474, 2, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (475, 2, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (476, 2, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (477, 2, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (478, 2, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (479, 2, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (480, 2, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (481, 2, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (482, 2, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (483, 2, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (484, 2, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (485, 2, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (486, 2, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (487, 2, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (488, 2, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (489, 2, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (490, 2, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (491, 2, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (492, 2, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (493, 2, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (494, 2, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (495, 2, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (496, 2, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (497, 2, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (498, 2, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (499, 2, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (500, 2, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (501, 2, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (502, 2, 97, 60000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (503, 2, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (504, 2, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (505, 2, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (506, 3, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (507, 3, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (508, 3, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (509, 3, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (510, 3, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (511, 3, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (512, 3, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (513, 3, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (514, 3, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (515, 3, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (516, 3, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (517, 3, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (518, 3, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (519, 3, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (520, 3, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (521, 3, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (522, 3, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (523, 3, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (524, 3, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (525, 3, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (526, 3, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (527, 3, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (528, 3, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (529, 3, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (530, 3, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (531, 3, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (532, 3, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (533, 3, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (534, 3, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (535, 3, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (536, 3, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (537, 3, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (538, 3, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (539, 3, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (540, 3, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (541, 3, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (542, 3, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (543, 3, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (544, 3, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (545, 3, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (546, 3, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (547, 3, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (548, 3, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (549, 3, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (550, 3, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (551, 3, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (552, 3, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (553, 3, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (554, 3, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (555, 3, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (556, 3, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (557, 3, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (558, 3, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (559, 3, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (560, 3, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (561, 3, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (562, 3, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (563, 3, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (564, 3, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (565, 3, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (566, 3, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (567, 3, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (568, 3, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (569, 3, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (570, 3, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (571, 3, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (572, 3, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (573, 3, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (574, 3, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (575, 3, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (576, 3, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (577, 3, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (578, 3, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (579, 3, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (580, 3, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (581, 3, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (582, 3, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (583, 3, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (584, 3, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (585, 3, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (586, 3, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (587, 3, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (588, 3, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (589, 3, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (590, 3, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (591, 3, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (592, 3, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (593, 3, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (594, 3, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (595, 3, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (596, 3, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (597, 3, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (598, 3, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (599, 3, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (600, 3, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (601, 3, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (602, 3, 96, 59000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (603, 3, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (604, 3, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (605, 3, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (606, 3, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (607, 4, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (608, 4, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (609, 4, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (610, 4, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (611, 4, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (612, 4, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (613, 4, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (614, 4, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (615, 4, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (616, 4, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (617, 4, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (618, 4, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (619, 4, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (620, 4, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (621, 4, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (622, 4, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (623, 4, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (624, 4, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (625, 4, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (626, 4, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (627, 4, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (628, 4, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (629, 4, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (630, 4, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (631, 4, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (632, 4, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (633, 4, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (634, 4, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (635, 4, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (636, 4, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (637, 4, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (638, 4, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (639, 4, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (640, 4, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (641, 4, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (642, 4, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (643, 4, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (644, 4, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (645, 4, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (646, 4, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (647, 4, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (648, 4, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (649, 4, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (650, 4, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (651, 4, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (652, 4, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (653, 4, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (654, 4, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (655, 4, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (656, 4, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (657, 4, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (658, 4, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (659, 4, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (660, 4, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (661, 4, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (662, 4, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (663, 4, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (664, 4, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (665, 4, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (666, 4, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (667, 4, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (668, 4, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (669, 4, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (670, 4, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (671, 4, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (672, 4, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (673, 4, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (674, 4, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (675, 4, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (676, 4, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (677, 4, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (678, 4, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (679, 4, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (680, 4, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (681, 4, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (682, 4, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (683, 4, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (684, 4, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (685, 4, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (686, 4, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (687, 4, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (688, 4, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (689, 4, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (690, 4, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (691, 4, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (692, 4, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (693, 4, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (694, 4, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (695, 4, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (696, 4, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (697, 4, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (698, 4, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (699, 4, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (700, 4, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (701, 4, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (702, 4, 95, 58000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (703, 4, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (704, 4, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (705, 4, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (706, 4, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (707, 4, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (708, 5, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (709, 5, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (710, 5, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (711, 5, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (712, 5, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (713, 5, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (714, 5, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (715, 5, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (716, 5, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (717, 5, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (718, 5, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (719, 5, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (720, 5, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (721, 5, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (722, 5, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (723, 5, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (724, 5, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (725, 5, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (726, 5, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (727, 5, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (728, 5, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (729, 5, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (730, 5, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (731, 5, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (732, 5, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (733, 5, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (734, 5, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (735, 5, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (736, 5, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (737, 5, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (738, 5, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (739, 5, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (740, 5, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (741, 5, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (742, 5, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (743, 5, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (744, 5, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (745, 5, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (746, 5, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (747, 5, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (748, 5, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (749, 5, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (750, 5, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (751, 5, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (752, 5, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (753, 5, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (754, 5, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (755, 5, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (756, 5, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (757, 5, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (758, 5, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (759, 5, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (760, 5, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (761, 5, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (762, 5, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (763, 5, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (764, 5, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (765, 5, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (766, 5, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (767, 5, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (768, 5, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (769, 5, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (770, 5, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (771, 5, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (772, 5, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (773, 5, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (774, 5, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (775, 5, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (776, 5, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (777, 5, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (778, 5, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (779, 5, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (780, 5, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (781, 5, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (782, 5, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (783, 5, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (784, 5, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (785, 5, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (786, 5, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (787, 5, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (788, 5, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (789, 5, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (790, 5, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (791, 5, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (792, 5, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (793, 5, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (794, 5, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (795, 5, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (796, 5, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (797, 5, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (798, 5, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (799, 5, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (800, 5, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (801, 5, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (802, 5, 94, 57000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (803, 5, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (804, 5, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (805, 5, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (806, 5, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (807, 5, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (808, 5, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (809, 6, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (810, 6, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (811, 6, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (812, 6, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (813, 6, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (814, 6, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (815, 6, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (816, 6, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (817, 6, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (818, 6, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (819, 6, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (820, 6, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (821, 6, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (822, 6, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (823, 6, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (824, 6, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (825, 6, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (826, 6, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (827, 6, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (828, 6, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (829, 6, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (830, 6, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (831, 6, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (832, 6, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (833, 6, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (834, 6, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (835, 6, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (836, 6, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (837, 6, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (838, 6, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (839, 6, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (840, 6, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (841, 6, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (842, 6, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (843, 6, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (844, 6, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (845, 6, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (846, 6, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (847, 6, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (848, 6, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (849, 6, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (850, 6, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (851, 6, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (852, 6, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (853, 6, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (854, 6, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (855, 6, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (856, 6, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (857, 6, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (858, 6, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (859, 6, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (860, 6, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (861, 6, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (862, 6, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (863, 6, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (864, 6, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (865, 6, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (866, 6, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (867, 6, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (868, 6, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (869, 6, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (870, 6, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (871, 6, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (872, 6, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (873, 6, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (874, 6, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (875, 6, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (876, 6, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (877, 6, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (878, 6, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (879, 6, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (880, 6, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (881, 6, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (882, 6, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (883, 6, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (884, 6, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (885, 6, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (886, 6, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (887, 6, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (888, 6, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (889, 6, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (890, 6, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (891, 6, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (892, 6, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (893, 6, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (894, 6, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (895, 6, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (896, 6, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (897, 6, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (898, 6, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (899, 6, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (900, 6, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (901, 6, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (902, 6, 93, 56000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (903, 6, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (904, 6, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (905, 6, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (906, 6, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (907, 6, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (908, 6, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (909, 6, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (910, 7, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (911, 7, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (912, 7, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (913, 7, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (914, 7, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (915, 7, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (916, 7, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (917, 7, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (918, 7, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (919, 7, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (920, 7, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (921, 7, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (922, 7, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (923, 7, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (924, 7, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (925, 7, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (926, 7, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (927, 7, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (928, 7, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (929, 7, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (930, 7, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (931, 7, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (932, 7, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (933, 7, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (934, 7, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (935, 7, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (936, 7, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (937, 7, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (938, 7, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (939, 7, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (940, 7, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (941, 7, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (942, 7, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (943, 7, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (944, 7, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (945, 7, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (946, 7, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (947, 7, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (948, 7, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (949, 7, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (950, 7, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (951, 7, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (952, 7, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (953, 7, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (954, 7, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (955, 7, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (956, 7, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (957, 7, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (958, 7, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (959, 7, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (960, 7, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (961, 7, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (962, 7, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (963, 7, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (964, 7, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (965, 7, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (966, 7, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (967, 7, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (968, 7, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (969, 7, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (970, 7, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (971, 7, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (972, 7, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (973, 7, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (974, 7, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (975, 7, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (976, 7, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (977, 7, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (978, 7, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (979, 7, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (980, 7, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (981, 7, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (982, 7, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (983, 7, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (984, 7, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (985, 7, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (986, 7, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (987, 7, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (988, 7, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (989, 7, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (990, 7, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (991, 7, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (992, 7, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (993, 7, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (994, 7, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (995, 7, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (996, 7, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (997, 7, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (998, 7, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (999, 7, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1000, 7, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1001, 7, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1002, 7, 92, 55000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1003, 7, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1004, 7, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1005, 7, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1006, 7, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1007, 7, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1008, 7, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1009, 7, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1010, 7, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1011, 8, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1012, 8, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1013, 8, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1014, 8, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1015, 8, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1016, 8, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1017, 8, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1018, 8, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1019, 8, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1020, 8, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1021, 8, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1022, 8, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1023, 8, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1024, 8, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1025, 8, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1026, 8, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1027, 8, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1028, 8, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1029, 8, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1030, 8, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1031, 8, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1032, 8, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1033, 8, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1034, 8, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1035, 8, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1036, 8, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1037, 8, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1038, 8, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1039, 8, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1040, 8, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1041, 8, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1042, 8, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1043, 8, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1044, 8, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1045, 8, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1046, 8, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1047, 8, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1048, 8, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1049, 8, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1050, 8, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1051, 8, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1052, 8, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1053, 8, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1054, 8, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1055, 8, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1056, 8, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1057, 8, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1058, 8, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1059, 8, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1060, 8, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1061, 8, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1062, 8, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1063, 8, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1064, 8, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1065, 8, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1066, 8, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1067, 8, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1068, 8, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1069, 8, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1070, 8, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1071, 8, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1072, 8, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1073, 8, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1074, 8, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1075, 8, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1076, 8, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1077, 8, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1078, 8, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1079, 8, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1080, 8, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1081, 8, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1082, 8, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1083, 8, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1084, 8, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1085, 8, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1086, 8, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1087, 8, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1088, 8, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1089, 8, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1090, 8, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1091, 8, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1092, 8, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1093, 8, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1094, 8, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1095, 8, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1096, 8, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1097, 8, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1098, 8, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1099, 8, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1100, 8, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1101, 8, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1102, 8, 91, 54000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1103, 8, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1104, 8, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1105, 8, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1106, 8, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1107, 8, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1108, 8, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1109, 8, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1110, 8, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1111, 8, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1112, 9, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1113, 9, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1114, 9, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1115, 9, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1116, 9, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1117, 9, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1118, 9, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1119, 9, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1120, 9, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1121, 9, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1122, 9, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1123, 9, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1124, 9, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1125, 9, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1126, 9, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1127, 9, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1128, 9, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1129, 9, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1130, 9, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1131, 9, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1132, 9, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1133, 9, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1134, 9, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1135, 9, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1136, 9, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1137, 9, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1138, 9, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1139, 9, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1140, 9, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1141, 9, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1142, 9, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1143, 9, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1144, 9, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1145, 9, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1146, 9, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1147, 9, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1148, 9, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1149, 9, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1150, 9, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1151, 9, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1152, 9, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1153, 9, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1154, 9, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1155, 9, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1156, 9, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1157, 9, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1158, 9, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1159, 9, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1160, 9, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1161, 9, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1162, 9, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1163, 9, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1164, 9, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1165, 9, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1166, 9, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1167, 9, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1168, 9, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1169, 9, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1170, 9, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1171, 9, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1172, 9, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1173, 9, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1174, 9, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1175, 9, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1176, 9, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1177, 9, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1178, 9, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1179, 9, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1180, 9, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1181, 9, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1182, 9, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1183, 9, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1184, 9, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1185, 9, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1186, 9, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1187, 9, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1188, 9, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1189, 9, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1190, 9, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1191, 9, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1192, 9, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1193, 9, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1194, 9, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1195, 9, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1196, 9, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1197, 9, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1198, 9, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1199, 9, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1200, 9, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1201, 9, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1202, 9, 90, 53000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1203, 9, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1204, 9, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1205, 9, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1206, 9, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1207, 9, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1208, 9, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1209, 9, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1210, 9, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1211, 9, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1212, 9, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1213, 10, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1214, 10, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1215, 10, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1216, 10, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1217, 10, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1218, 10, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1219, 10, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1220, 10, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1221, 10, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1222, 10, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1223, 10, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1224, 10, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1225, 10, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1226, 10, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1227, 10, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1228, 10, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1229, 10, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1230, 10, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1231, 10, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1232, 10, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1233, 10, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1234, 10, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1235, 10, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1236, 10, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1237, 10, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1238, 10, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1239, 10, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1240, 10, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1241, 10, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1242, 10, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1243, 10, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1244, 10, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1245, 10, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1246, 10, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1247, 10, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1248, 10, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1249, 10, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1250, 10, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1251, 10, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1252, 10, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1253, 10, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1254, 10, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1255, 10, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1256, 10, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1257, 10, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1258, 10, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1259, 10, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1260, 10, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1261, 10, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1262, 10, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1263, 10, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1264, 10, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1265, 10, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1266, 10, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1267, 10, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1268, 10, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1269, 10, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1270, 10, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1271, 10, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1272, 10, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1273, 10, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1274, 10, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1275, 10, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1276, 10, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1277, 10, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1278, 10, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1279, 10, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1280, 10, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1281, 10, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1282, 10, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1283, 10, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1284, 10, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1285, 10, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1286, 10, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1287, 10, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1288, 10, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1289, 10, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1290, 10, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1291, 10, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1292, 10, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1293, 10, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1294, 10, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1295, 10, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1296, 10, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1297, 10, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1298, 10, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1299, 10, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1300, 10, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1301, 10, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1302, 10, 89, 52000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1303, 10, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1304, 10, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1305, 10, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1306, 10, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1307, 10, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1308, 10, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1309, 10, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1310, 10, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1311, 10, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1312, 10, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1313, 10, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1314, 11, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1315, 11, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1316, 11, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1317, 11, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1318, 11, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1319, 11, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1320, 11, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1321, 11, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1322, 11, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1323, 11, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1324, 11, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1325, 11, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1326, 11, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1327, 11, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1328, 11, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1329, 11, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1330, 11, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1331, 11, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1332, 11, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1333, 11, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1334, 11, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1335, 11, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1336, 11, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1337, 11, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1338, 11, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1339, 11, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1340, 11, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1341, 11, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1342, 11, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1343, 11, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1344, 11, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1345, 11, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1346, 11, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1347, 11, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1348, 11, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1349, 11, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1350, 11, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1351, 11, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1352, 11, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1353, 11, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1354, 11, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1355, 11, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1356, 11, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1357, 11, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1358, 11, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1359, 11, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1360, 11, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1361, 11, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1362, 11, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1363, 11, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1364, 11, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1365, 11, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1366, 11, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1367, 11, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1368, 11, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1369, 11, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1370, 11, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1371, 11, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1372, 11, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1373, 11, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1374, 11, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1375, 11, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1376, 11, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1377, 11, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1378, 11, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1379, 11, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1380, 11, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1381, 11, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1382, 11, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1383, 11, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1384, 11, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1385, 11, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1386, 11, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1387, 11, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1388, 11, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1389, 11, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1390, 11, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1391, 11, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1392, 11, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1393, 11, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1394, 11, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1395, 11, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1396, 11, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1397, 11, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1398, 11, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1399, 11, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1400, 11, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1401, 11, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1402, 11, 88, 51500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1403, 11, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1404, 11, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1405, 11, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1406, 11, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1407, 11, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1408, 11, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1409, 11, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1410, 11, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1411, 11, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1412, 11, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1413, 11, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1414, 11, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1415, 12, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1416, 12, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1417, 12, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1418, 12, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1419, 12, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1420, 12, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1421, 12, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1422, 12, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1423, 12, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1424, 12, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1425, 12, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1426, 12, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1427, 12, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1428, 12, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1429, 12, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1430, 12, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1431, 12, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1432, 12, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1433, 12, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1434, 12, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1435, 12, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1436, 12, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1437, 12, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1438, 12, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1439, 12, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1440, 12, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1441, 12, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1442, 12, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1443, 12, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1444, 12, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1445, 12, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1446, 12, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1447, 12, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1448, 12, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1449, 12, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1450, 12, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1451, 12, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1452, 12, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1453, 12, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1454, 12, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1455, 12, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1456, 12, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1457, 12, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1458, 12, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1459, 12, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1460, 12, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1461, 12, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1462, 12, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1463, 12, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1464, 12, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1465, 12, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1466, 12, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1467, 12, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1468, 12, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1469, 12, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1470, 12, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1471, 12, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1472, 12, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1473, 12, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1474, 12, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1475, 12, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1476, 12, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1477, 12, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1478, 12, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1479, 12, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1480, 12, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1481, 12, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1482, 12, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1483, 12, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1484, 12, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1485, 12, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1486, 12, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1487, 12, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1488, 12, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1489, 12, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1490, 12, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1491, 12, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1492, 12, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1493, 12, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1494, 12, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1495, 12, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1496, 12, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1497, 12, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1498, 12, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1499, 12, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1500, 12, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1501, 12, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1502, 12, 87, 51000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1503, 12, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1504, 12, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1505, 12, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1506, 12, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1507, 12, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1508, 12, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1509, 12, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1510, 12, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1511, 12, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1512, 12, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1513, 12, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1514, 12, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1515, 12, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1516, 13, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1517, 13, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1518, 13, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1519, 13, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1520, 13, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1521, 13, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1522, 13, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1523, 13, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1524, 13, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1525, 13, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1526, 13, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1527, 13, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1528, 13, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1529, 13, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1530, 13, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1531, 13, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1532, 13, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1533, 13, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1534, 13, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1535, 13, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1536, 13, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1537, 13, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1538, 13, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1539, 13, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1540, 13, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1541, 13, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1542, 13, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1543, 13, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1544, 13, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1545, 13, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1546, 13, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1547, 13, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1548, 13, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1549, 13, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1550, 13, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1551, 13, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1552, 13, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1553, 13, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1554, 13, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1555, 13, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1556, 13, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1557, 13, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1558, 13, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1559, 13, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1560, 13, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1561, 13, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1562, 13, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1563, 13, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1564, 13, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1565, 13, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1566, 13, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1567, 13, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1568, 13, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1569, 13, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1570, 13, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1571, 13, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1572, 13, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1573, 13, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1574, 13, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1575, 13, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1576, 13, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1577, 13, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1578, 13, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1579, 13, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1580, 13, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1581, 13, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1582, 13, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1583, 13, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1584, 13, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1585, 13, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1586, 13, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1587, 13, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1588, 13, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1589, 13, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1590, 13, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1591, 13, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1592, 13, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1593, 13, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1594, 13, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1595, 13, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1596, 13, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1597, 13, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1598, 13, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1599, 13, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1600, 13, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1601, 13, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1602, 13, 86, 50500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1603, 13, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1604, 13, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1605, 13, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1606, 13, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1607, 13, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1608, 13, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1609, 13, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1610, 13, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1611, 13, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1612, 13, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1613, 13, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1614, 13, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1615, 13, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1616, 13, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1617, 14, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1618, 14, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1619, 14, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1620, 14, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1621, 14, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1622, 14, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1623, 14, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1624, 14, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1625, 14, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1626, 14, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1627, 14, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1628, 14, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1629, 14, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1630, 14, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1631, 14, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1632, 14, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1633, 14, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1634, 14, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1635, 14, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1636, 14, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1637, 14, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1638, 14, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1639, 14, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1640, 14, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1641, 14, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1642, 14, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1643, 14, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1644, 14, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1645, 14, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1646, 14, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1647, 14, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1648, 14, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1649, 14, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1650, 14, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1651, 14, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1652, 14, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1653, 14, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1654, 14, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1655, 14, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1656, 14, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1657, 14, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1658, 14, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1659, 14, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1660, 14, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1661, 14, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1662, 14, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1663, 14, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1664, 14, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1665, 14, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1666, 14, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1667, 14, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1668, 14, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1669, 14, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1670, 14, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1671, 14, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1672, 14, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1673, 14, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1674, 14, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1675, 14, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1676, 14, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1677, 14, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1678, 14, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1679, 14, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1680, 14, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1681, 14, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1682, 14, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1683, 14, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1684, 14, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1685, 14, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1686, 14, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1687, 14, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1688, 14, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1689, 14, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1690, 14, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1691, 14, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1692, 14, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1693, 14, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1694, 14, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1695, 14, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1696, 14, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1697, 14, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1698, 14, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1699, 14, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1700, 14, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1701, 14, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1702, 14, 85, 50000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1703, 14, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1704, 14, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1705, 14, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1706, 14, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1707, 14, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1708, 14, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1709, 14, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1710, 14, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1711, 14, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1712, 14, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1713, 14, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1714, 14, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1715, 14, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1716, 14, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1717, 14, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1718, 15, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1719, 15, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1720, 15, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1721, 15, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1722, 15, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1723, 15, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1724, 15, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1725, 15, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1726, 15, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1727, 15, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1728, 15, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1729, 15, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1730, 15, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1731, 15, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1732, 15, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1733, 15, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1734, 15, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1735, 15, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1736, 15, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1737, 15, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1738, 15, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1739, 15, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1740, 15, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1741, 15, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1742, 15, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1743, 15, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1744, 15, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1745, 15, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1746, 15, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1747, 15, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1748, 15, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1749, 15, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1750, 15, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1751, 15, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1752, 15, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1753, 15, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1754, 15, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1755, 15, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1756, 15, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1757, 15, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1758, 15, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1759, 15, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1760, 15, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1761, 15, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1762, 15, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1763, 15, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1764, 15, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1765, 15, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1766, 15, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1767, 15, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1768, 15, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1769, 15, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1770, 15, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1771, 15, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1772, 15, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1773, 15, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1774, 15, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1775, 15, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1776, 15, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1777, 15, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1778, 15, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1779, 15, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1780, 15, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1781, 15, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1782, 15, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1783, 15, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1784, 15, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1785, 15, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1786, 15, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1787, 15, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1788, 15, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1789, 15, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1790, 15, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1791, 15, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1792, 15, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1793, 15, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1794, 15, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1795, 15, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1796, 15, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1797, 15, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1798, 15, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1799, 15, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1800, 15, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1801, 15, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1802, 15, 84, 49500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1803, 15, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1804, 15, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1805, 15, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1806, 15, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1807, 15, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1808, 15, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1809, 15, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1810, 15, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1811, 15, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1812, 15, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1813, 15, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1814, 15, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1815, 15, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1816, 15, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1817, 15, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1818, 15, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1819, 16, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1820, 16, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1821, 16, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1822, 16, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1823, 16, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1824, 16, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1825, 16, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1826, 16, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1827, 16, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1828, 16, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1829, 16, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1830, 16, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1831, 16, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1832, 16, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1833, 16, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1834, 16, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1835, 16, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1836, 16, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1837, 16, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1838, 16, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1839, 16, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1840, 16, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1841, 16, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1842, 16, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1843, 16, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1844, 16, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1845, 16, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1846, 16, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1847, 16, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1848, 16, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1849, 16, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1850, 16, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1851, 16, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1852, 16, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1853, 16, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1854, 16, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1855, 16, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1856, 16, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1857, 16, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1858, 16, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1859, 16, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1860, 16, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1861, 16, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1862, 16, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1863, 16, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1864, 16, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1865, 16, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1866, 16, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1867, 16, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1868, 16, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1869, 16, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1870, 16, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1871, 16, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1872, 16, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1873, 16, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1874, 16, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1875, 16, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1876, 16, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1877, 16, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1878, 16, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1879, 16, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1880, 16, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1881, 16, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1882, 16, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1883, 16, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1884, 16, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1885, 16, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1886, 16, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1887, 16, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1888, 16, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1889, 16, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1890, 16, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1891, 16, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1892, 16, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1893, 16, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1894, 16, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1895, 16, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1896, 16, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1897, 16, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1898, 16, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1899, 16, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1900, 16, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1901, 16, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1902, 16, 83, 49000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1903, 16, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1904, 16, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1905, 16, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1906, 16, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1907, 16, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1908, 16, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1909, 16, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1910, 16, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1911, 16, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1912, 16, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1913, 16, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1914, 16, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1915, 16, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1916, 16, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1917, 16, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1918, 16, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1919, 16, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1920, 17, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1921, 17, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1922, 17, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1923, 17, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1924, 17, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1925, 17, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1926, 17, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1927, 17, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1928, 17, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1929, 17, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1930, 17, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1931, 17, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1932, 17, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1933, 17, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1934, 17, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1935, 17, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1936, 17, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1937, 17, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1938, 17, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1939, 17, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1940, 17, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1941, 17, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1942, 17, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1943, 17, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1944, 17, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1945, 17, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1946, 17, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1947, 17, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1948, 17, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1949, 17, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1950, 17, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1951, 17, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1952, 17, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1953, 17, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1954, 17, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1955, 17, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1956, 17, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1957, 17, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1958, 17, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1959, 17, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1960, 17, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1961, 17, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1962, 17, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1963, 17, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1964, 17, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1965, 17, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1966, 17, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1967, 17, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1968, 17, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1969, 17, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1970, 17, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1971, 17, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1972, 17, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1973, 17, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1974, 17, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1975, 17, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1976, 17, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1977, 17, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1978, 17, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1979, 17, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1980, 17, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1981, 17, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1982, 17, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1983, 17, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1984, 17, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1985, 17, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1986, 17, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1987, 17, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1988, 17, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1989, 17, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1990, 17, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1991, 17, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1992, 17, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1993, 17, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1994, 17, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1995, 17, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1996, 17, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1997, 17, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1998, 17, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (1999, 17, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2000, 17, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2001, 17, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2002, 17, 82, 48500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2003, 17, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2004, 17, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2005, 17, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2006, 17, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2007, 17, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2008, 17, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2009, 17, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2010, 17, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2011, 17, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2012, 17, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2013, 17, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2014, 17, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2015, 17, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2016, 17, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2017, 17, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2018, 17, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2019, 17, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2020, 17, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2021, 18, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2022, 18, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2023, 18, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2024, 18, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2025, 18, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2026, 18, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2027, 18, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2028, 18, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2029, 18, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2030, 18, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2031, 18, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2032, 18, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2033, 18, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2034, 18, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2035, 18, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2036, 18, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2037, 18, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2038, 18, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2039, 18, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2040, 18, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2041, 18, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2042, 18, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2043, 18, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2044, 18, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2045, 18, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2046, 18, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2047, 18, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2048, 18, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2049, 18, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2050, 18, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2051, 18, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2052, 18, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2053, 18, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2054, 18, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2055, 18, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2056, 18, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2057, 18, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2058, 18, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2059, 18, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2060, 18, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2061, 18, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2062, 18, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2063, 18, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2064, 18, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2065, 18, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2066, 18, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2067, 18, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2068, 18, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2069, 18, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2070, 18, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2071, 18, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2072, 18, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2073, 18, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2074, 18, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2075, 18, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2076, 18, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2077, 18, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2078, 18, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2079, 18, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2080, 18, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2081, 18, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2082, 18, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2083, 18, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2084, 18, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2085, 18, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2086, 18, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2087, 18, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2088, 18, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2089, 18, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2090, 18, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2091, 18, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2092, 18, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2093, 18, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2094, 18, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2095, 18, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2096, 18, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2097, 18, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2098, 18, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2099, 18, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2100, 18, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2101, 18, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2102, 18, 81, 48000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2103, 18, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2104, 18, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2105, 18, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2106, 18, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2107, 18, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2108, 18, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2109, 18, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2110, 18, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2111, 18, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2112, 18, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2113, 18, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2114, 18, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2115, 18, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2116, 18, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2117, 18, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2118, 18, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2119, 18, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2120, 18, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2121, 18, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2122, 19, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2123, 19, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2124, 19, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2125, 19, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2126, 19, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2127, 19, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2128, 19, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2129, 19, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2130, 19, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2131, 19, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2132, 19, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2133, 19, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2134, 19, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2135, 19, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2136, 19, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2137, 19, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2138, 19, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2139, 19, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2140, 19, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2141, 19, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2142, 19, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2143, 19, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2144, 19, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2145, 19, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2146, 19, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2147, 19, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2148, 19, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2149, 19, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2150, 19, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2151, 19, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2152, 19, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2153, 19, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2154, 19, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2155, 19, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2156, 19, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2157, 19, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2158, 19, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2159, 19, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2160, 19, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2161, 19, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2162, 19, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2163, 19, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2164, 19, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2165, 19, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2166, 19, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2167, 19, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2168, 19, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2169, 19, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2170, 19, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2171, 19, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2172, 19, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2173, 19, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2174, 19, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2175, 19, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2176, 19, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2177, 19, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2178, 19, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2179, 19, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2180, 19, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2181, 19, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2182, 19, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2183, 19, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2184, 19, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2185, 19, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2186, 19, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2187, 19, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2188, 19, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2189, 19, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2190, 19, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2191, 19, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2192, 19, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2193, 19, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2194, 19, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2195, 19, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2196, 19, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2197, 19, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2198, 19, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2199, 19, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2200, 19, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2201, 19, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2202, 19, 80, 47500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2203, 19, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2204, 19, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2205, 19, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2206, 19, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2207, 19, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2208, 19, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2209, 19, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2210, 19, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2211, 19, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2212, 19, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2213, 19, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2214, 19, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2215, 19, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2216, 19, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2217, 19, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2218, 19, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2219, 19, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2220, 19, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2221, 19, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2222, 19, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2223, 20, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2224, 20, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2225, 20, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2226, 20, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2227, 20, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2228, 20, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2229, 20, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2230, 20, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2231, 20, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2232, 20, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2233, 20, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2234, 20, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2235, 20, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2236, 20, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2237, 20, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2238, 20, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2239, 20, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2240, 20, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2241, 20, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2242, 20, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2243, 20, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2244, 20, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2245, 20, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2246, 20, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2247, 20, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2248, 20, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2249, 20, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2250, 20, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2251, 20, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2252, 20, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2253, 20, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2254, 20, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2255, 20, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2256, 20, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2257, 20, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2258, 20, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2259, 20, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2260, 20, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2261, 20, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2262, 20, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2263, 20, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2264, 20, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2265, 20, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2266, 20, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2267, 20, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2268, 20, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2269, 20, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2270, 20, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2271, 20, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2272, 20, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2273, 20, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2274, 20, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2275, 20, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2276, 20, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2277, 20, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2278, 20, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2279, 20, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2280, 20, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2281, 20, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2282, 20, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2283, 20, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2284, 20, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2285, 20, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2286, 20, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2287, 20, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2288, 20, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2289, 20, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2290, 20, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2291, 20, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2292, 20, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2293, 20, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2294, 20, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2295, 20, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2296, 20, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2297, 20, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2298, 20, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2299, 20, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2300, 20, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2301, 20, 78, 46500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2302, 20, 79, 47000)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2303, 20, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2304, 20, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2305, 20, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2306, 20, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2307, 20, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2308, 20, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2309, 20, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2310, 20, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2311, 20, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2312, 20, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2313, 20, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2314, 20, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2315, 20, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2316, 20, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2317, 20, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2318, 20, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2319, 20, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2320, 20, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2321, 20, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2322, 20, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2323, 20, 100, 100000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2324, 21, 0, 500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2325, 21, 1, 750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2326, 21, 2, 1000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2327, 21, 3, 1250)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2328, 21, 4, 1500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2329, 21, 5, 1750)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2330, 21, 6, 2000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2331, 21, 7, 2200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2332, 21, 8, 2400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2333, 21, 9, 2600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2334, 21, 10, 2800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2335, 21, 11, 3000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2336, 21, 12, 3200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2337, 21, 13, 3400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2338, 21, 14, 3600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2339, 21, 15, 3800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2340, 21, 16, 4000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2341, 21, 17, 4200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2342, 21, 18, 4400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2343, 21, 19, 4600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2344, 21, 20, 4800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2345, 21, 21, 5000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2346, 21, 22, 5100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2347, 21, 23, 5200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2348, 21, 24, 5300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2349, 21, 25, 5400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2350, 21, 26, 5500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2351, 21, 27, 5600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2352, 21, 28, 5700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2353, 21, 29, 5800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2354, 21, 30, 5900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2355, 21, 31, 6000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2356, 21, 32, 6100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2357, 21, 33, 6200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2358, 21, 34, 6300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2359, 21, 35, 6400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2360, 21, 36, 6500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2361, 21, 37, 6600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2362, 21, 38, 6700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2363, 21, 39, 6800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2364, 21, 40, 6900)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2365, 21, 41, 7000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2366, 21, 42, 7100)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2367, 21, 43, 7200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2368, 21, 44, 7300)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2369, 21, 45, 7400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2370, 21, 46, 7500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2371, 21, 47, 7600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2372, 21, 48, 7700)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2373, 21, 49, 8000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2374, 21, 50, 9200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2375, 21, 51, 10400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2376, 21, 52, 11600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2377, 21, 53, 12800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2378, 21, 54, 14000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2379, 21, 55, 15200)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2380, 21, 56, 16400)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2381, 21, 57, 17600)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2382, 21, 58, 18800)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2383, 21, 59, 20000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2384, 21, 60, 21500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2385, 21, 61, 23000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2386, 21, 62, 24500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2387, 21, 63, 26000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2388, 21, 64, 27500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2389, 21, 65, 29000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2390, 21, 66, 30500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2391, 21, 67, 32000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2392, 21, 68, 34000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2393, 21, 69, 36000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2394, 21, 70, 38000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2395, 21, 71, 40000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2396, 21, 72, 42000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2397, 21, 73, 44000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2398, 21, 74, 44500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2399, 21, 75, 45000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2400, 21, 76, 45500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2401, 21, 77, 46000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2402, 21, 78, 46500)
GO
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2403, 21, 79, 47000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2404, 21, 80, 47500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2405, 21, 81, 48000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2406, 21, 82, 48500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2407, 21, 83, 49000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2408, 21, 84, 49500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2409, 21, 85, 50000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2410, 21, 86, 50500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2411, 21, 87, 51000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2412, 21, 88, 51500)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2413, 21, 89, 52000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2414, 21, 90, 53000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2415, 21, 91, 54000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2416, 21, 92, 55000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2417, 21, 93, 56000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2418, 21, 94, 57000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2419, 21, 95, 58000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2420, 21, 96, 59000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2421, 21, 97, 60000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2422, 21, 98, 65000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2423, 21, 99, 70000)
INSERT [dbo].[SkillXPRequirement] ([SkillXPRequirementID], [SkillID], [Rank], [XP]) VALUES (2424, 21, 100, 100000)
SET IDENTITY_INSERT [dbo].[SkillXPRequirement] OFF
INSERT [dbo].[StructureBlueprints] ([StructureBlueprintID], [StructureCategoryID], [Name], [Description], [Resref], [IsActive], [IsTerritoryFlag], [IsUseable], [ItemStorageCount], [MaxStructuresCount], [MaxBuildDistance], [ResearchSlots], [RPPerSecond], [Level]) VALUES (1, 1, N'Basic Territory Flag', N'', N'terr_flag_1', 1, 1, 0, 0, 20, 10, 0, 0, 1)
INSERT [dbo].[StructureBlueprints] ([StructureBlueprintID], [StructureCategoryID], [Name], [Description], [Resref], [IsActive], [IsTerritoryFlag], [IsUseable], [ItemStorageCount], [MaxStructuresCount], [MaxBuildDistance], [ResearchSlots], [RPPerSecond], [Level]) VALUES (2, 1, N'Large Territory Flag', N'', N'terr_flag_2', 1, 1, 0, 0, 40, 20, 0, 0, 20)
SET IDENTITY_INSERT [dbo].[StructureCategories] ON 

INSERT [dbo].[StructureCategories] ([StructureCategoryID], [Name], [Description], [IsActive], [IsTerritoryFlagCategory]) VALUES (1, N'Territory Flags', N'', 1, 1)
SET IDENTITY_INSERT [dbo].[StructureCategories] OFF
SET IDENTITY_INSERT [dbo].[StructureComponents] ON 

INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (1, 1, N'elm_wood', 15)
INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (2, 1, N'nails', 5)
INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (3, 2, N'elm_wood', 30)
INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (4, 2, N'ash_wood', 5)
INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (5, 2, N'nails', 15)
INSERT [dbo].[StructureComponents] ([StructureComponentID], [StructureBlueprintID], [Resref], [Quantity]) VALUES (6, 2, N'copper_ore', 10)
SET IDENTITY_INSERT [dbo].[StructureComponents] OFF
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (0, N'None', 1, 0)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (1, N'Can Use Structures', 1, 1)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (2, N'Can Build Structures', 1, 1)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (3, N'Can Raze Structures', 1, 1)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (4, N'Can Move Structures', 1, 1)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (5, N'Can Rotate Structures', 1, 1)
INSERT [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID], [Name], [IsActive], [IsSelectable]) VALUES (6, N'Can Access Persistent Storage', 1, 1)
/****** Object:  Index [uq_Abilities_FeatID]    Script Date: 3/12/2018 12:25:32 AM ******/
ALTER TABLE [dbo].[Abilities] ADD  CONSTRAINT [uq_Abilities_FeatID] UNIQUE NONCLUSTERED 
(
	[FeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0)) FOR [FeatID]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ('') FOR [JavaScriptName]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0)) FOR [BaseManaCost]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0.0)) FOR [BaseCastingTime]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0)) FOR [IsQueuedWeaponSkill]
GO
ALTER TABLE [dbo].[Abilities] ADD  DEFAULT ((0)) FOR [SPPrice]
GO
ALTER TABLE [dbo].[AbilityCategories] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[AbilityCategories] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AbilityCooldownCategories] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[AbilityCooldownCategories] ADD  DEFAULT ((0.0)) FOR [BaseCooldownTime]
GO
ALTER TABLE [dbo].[Attributes] ADD  DEFAULT ((0)) FOR [NWNValue]
GO
ALTER TABLE [dbo].[Attributes] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ChatChannelsDomain] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[ChatLog] ADD  DEFAULT ('') FOR [SenderAccountName]
GO
ALTER TABLE [dbo].[ChatLog] ADD  DEFAULT ('') FOR [SenderCDKey]
GO
ALTER TABLE [dbo].[ChatLog] ADD  DEFAULT ('') FOR [Message]
GO
ALTER TABLE [dbo].[ChatLog] ADD  DEFAULT (getutcdate()) FOR [DateSent]
GO
ALTER TABLE [dbo].[ClientLogEvents] ADD  DEFAULT (getutcdate()) FOR [DateOfEvent]
GO
ALTER TABLE [dbo].[ConstructionSiteComponents] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Creatures] ADD  DEFAULT ((0.0)) FOR [DifficultyRating]
GO
ALTER TABLE [dbo].[Creatures] ADD  DEFAULT ((0.0)) FOR [XPModifier]
GO
ALTER TABLE [dbo].[Downloads] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Downloads] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Downloads] ADD  DEFAULT ('') FOR [Url]
GO
ALTER TABLE [dbo].[Downloads] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [AC]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [ItemTypeID]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [RecommendedLevel]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [LoggingBonus]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [MiningBonus]
GO
ALTER TABLE [dbo].[ItemTypes] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[PCKeyItems] ADD  CONSTRAINT [df_PCKeyItems_AcquiredDate]  DEFAULT (getutcdate()) FOR [AcquiredDate]
GO
ALTER TABLE [dbo].[PCLearnedAbilities] ADD  DEFAULT (getutcdate()) FOR [AcquiredDate]
GO
ALTER TABLE [dbo].[PCRegionalFame] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[PCSkills] ADD  DEFAULT ((0)) FOR [XP]
GO
ALTER TABLE [dbo].[PCSkills] ADD  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[PCSkills] ADD  DEFAULT ((0)) FOR [IsLocked]
GO
ALTER TABLE [dbo].[PCTerritoryFlags] ADD  CONSTRAINT [df_PCTerritoryFlags_BuildPrivacySettingID]  DEFAULT ((1)) FOR [BuildPrivacySettingID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructures] ADD  CONSTRAINT [df_PCTerritoryFlagsStructures_CreateDate]  DEFAULT (getutcdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues] ADD  DEFAULT (getutcdate()) FOR [StartDateTime]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues] ADD  DEFAULT ((0)) FOR [IsCanceled]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  CONSTRAINT [df_PlayerCharacters_CreateTimestamp]  DEFAULT (getutcdate()) FOR [CreateTimestamp]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [MaxMana]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [CurrentMana]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [CurrentManaTick]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [RevivalStoneCount]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ('') FOR [RespawnAreaTag]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0.0)) FOR [RespawnLocationX]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0.0)) FOR [RespawnLocationY]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0.0)) FOR [RespawnLocationZ]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0.0)) FOR [RespawnLocationOrientation]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT (dateadd(hour,(72),getutcdate())) FOR [DateSanctuaryEnds]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [IsSanctuaryOverrideEnabled]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [STRBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [DEXBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [CONBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [INTBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [WISBase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [CHABase]
GO
ALTER TABLE [dbo].[PlayerCharacters] ADD  DEFAULT ((0)) FOR [TotalSPAcquired]
GO
ALTER TABLE [dbo].[Quests] ADD  DEFAULT ((0)) FOR [AllowRewardSelection]
GO
ALTER TABLE [dbo].[Quests] ADD  DEFAULT ((0)) FOR [IsRepeatable]
GO
ALTER TABLE [dbo].[Quests] ADD  DEFAULT ((0)) FOR [RemoveStartKeyItemAfterCompletion]
GO
ALTER TABLE [dbo].[QuestStates] ADD  DEFAULT ((0)) FOR [IsFinalState]
GO
ALTER TABLE [dbo].[ResearchBlueprints] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ResearchBlueprints] ADD  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[ResearchBlueprints] ADD  DEFAULT ((0)) FOR [ResearchPoints]
GO
ALTER TABLE [dbo].[ResearchBlueprints] ADD  DEFAULT ((0)) FOR [SkillRequired]
GO
ALTER TABLE [dbo].[ServerConfiguration] ADD  DEFAULT ('') FOR [ServerName]
GO
ALTER TABLE [dbo].[ServerConfiguration] ADD  DEFAULT ('') FOR [MessageOfTheDay]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SkillCategories] ADD  DEFAULT ((0)) FOR [Sequence]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((0)) FOR [MaxRank]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ('') FOR [Primary]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ('') FOR [Secondary]
GO
ALTER TABLE [dbo].[Skills] ADD  DEFAULT ('') FOR [Tertiary]
GO
ALTER TABLE [dbo].[SpawnTableCreatures] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SpawnTableCreatures] ADD  DEFAULT ((0)) FOR [Weight]
GO
ALTER TABLE [dbo].[SpawnTableCreatures] ADD  DEFAULT ((0)) FOR [MaxNumberInArea]
GO
ALTER TABLE [dbo].[SpawnTableCreatures] ADD  DEFAULT ((0)) FOR [DifficultyRating]
GO
ALTER TABLE [dbo].[StructureBlueprints] ADD  DEFAULT ((0)) FOR [ResearchSlots]
GO
ALTER TABLE [dbo].[StructureBlueprints] ADD  DEFAULT ((0)) FOR [RPPerSecond]
GO
ALTER TABLE [dbo].[StructureBlueprints] ADD  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[StructureComponents] ADD  DEFAULT ('') FOR [Resref]
GO
ALTER TABLE [dbo].[StructureComponents] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit] ADD  DEFAULT ('') FOR [DMName]
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit] ADD  DEFAULT (getutcdate()) FOR [DateBuilt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((3)) FOR [RoleID]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getutcdate()) FOR [DateRegistered]
GO
ALTER TABLE [dbo].[Abilities]  WITH CHECK ADD  CONSTRAINT [fk_Abilities_AbilityCategoryID] FOREIGN KEY([AbilityCategoryID])
REFERENCES [dbo].[AbilityCategories] ([AbilityCategoryID])
GO
ALTER TABLE [dbo].[Abilities] CHECK CONSTRAINT [fk_Abilities_AbilityCategoryID]
GO
ALTER TABLE [dbo].[Abilities]  WITH CHECK ADD  CONSTRAINT [fk_Abilities_AbilityCooldownCategoryID] FOREIGN KEY([AbilityCooldownCategoryID])
REFERENCES [dbo].[AbilityCooldownCategories] ([AbilityCooldownCategoryID])
GO
ALTER TABLE [dbo].[Abilities] CHECK CONSTRAINT [fk_Abilities_AbilityCooldownCategoryID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_ChatChannelID] FOREIGN KEY([ChatChannelID])
REFERENCES [dbo].[ChatChannelsDomain] ([ChatChannelID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_ChatChannelID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_ReceiverPlayerID] FOREIGN KEY([ReceiverPlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_ReceiverPlayerID]
GO
ALTER TABLE [dbo].[ChatLog]  WITH CHECK ADD  CONSTRAINT [fk_ChatLog_SenderPlayerID] FOREIGN KEY([SenderPlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ChatLog] CHECK CONSTRAINT [fk_ChatLog_SenderPlayerID]
GO
ALTER TABLE [dbo].[ClientLogEvents]  WITH CHECK ADD  CONSTRAINT [FK_ClientLogEvents_ClientLogEventTypeID] FOREIGN KEY([ClientLogEventTypeID])
REFERENCES [dbo].[ClientLogEventTypesDomain] ([ClientLogEventTypeID])
GO
ALTER TABLE [dbo].[ClientLogEvents] CHECK CONSTRAINT [FK_ClientLogEvents_ClientLogEventTypeID]
GO
ALTER TABLE [dbo].[ClientLogEvents]  WITH CHECK ADD  CONSTRAINT [FK_ClientLogEvents_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ClientLogEvents] CHECK CONSTRAINT [FK_ClientLogEvents_PlayerID]
GO
ALTER TABLE [dbo].[ConstructionSiteComponents]  WITH CHECK ADD  CONSTRAINT [FK_ConstructionSiteComponents_ConstructionSiteID] FOREIGN KEY([ConstructionSiteID])
REFERENCES [dbo].[ConstructionSites] ([ConstructionSiteID])
GO
ALTER TABLE [dbo].[ConstructionSiteComponents] CHECK CONSTRAINT [FK_ConstructionSiteComponents_ConstructionSiteID]
GO
ALTER TABLE [dbo].[ConstructionSiteComponents]  WITH CHECK ADD  CONSTRAINT [FK_ConstructionSiteComponents_StructureComponentID] FOREIGN KEY([StructureComponentID])
REFERENCES [dbo].[StructureComponents] ([StructureComponentID])
GO
ALTER TABLE [dbo].[ConstructionSiteComponents] CHECK CONSTRAINT [FK_ConstructionSiteComponents_StructureComponentID]
GO
ALTER TABLE [dbo].[ConstructionSites]  WITH CHECK ADD  CONSTRAINT [fk_ConstructionSites_PCTerritoryFlagID] FOREIGN KEY([PCTerritoryFlagID])
REFERENCES [dbo].[PCTerritoryFlags] ([PCTerritoryFlagID])
GO
ALTER TABLE [dbo].[ConstructionSites] CHECK CONSTRAINT [fk_ConstructionSites_PCTerritoryFlagID]
GO
ALTER TABLE [dbo].[ConstructionSites]  WITH CHECK ADD  CONSTRAINT [fk_ConstructionSites_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[ConstructionSites] CHECK CONSTRAINT [fk_ConstructionSites_PlayerID]
GO
ALTER TABLE [dbo].[ConstructionSites]  WITH CHECK ADD  CONSTRAINT [fk_ConstructionSites_StructureBlueprintID] FOREIGN KEY([StructureBlueprintID])
REFERENCES [dbo].[StructureBlueprints] ([StructureBlueprintID])
GO
ALTER TABLE [dbo].[ConstructionSites] CHECK CONSTRAINT [fk_ConstructionSites_StructureBlueprintID]
GO
ALTER TABLE [dbo].[CraftBlueprintComponents]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprintComponents_CraftBlueprintID] FOREIGN KEY([CraftBlueprintID])
REFERENCES [dbo].[CraftBlueprints] ([CraftBlueprintID])
GO
ALTER TABLE [dbo].[CraftBlueprintComponents] CHECK CONSTRAINT [fk_CraftBlueprintComponents_CraftBlueprintID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_CraftCategoryID] FOREIGN KEY([CraftCategoryID])
REFERENCES [dbo].[CraftBlueprintCategories] ([CraftBlueprintCategoryID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_CraftCategoryID]
GO
ALTER TABLE [dbo].[CraftBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_CraftBlueprints_CraftID] FOREIGN KEY([CraftID])
REFERENCES [dbo].[Crafts] ([CraftID])
GO
ALTER TABLE [dbo].[CraftBlueprints] CHECK CONSTRAINT [fk_CraftBlueprints_CraftID]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_ItemType] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[ItemTypes] ([ItemTypeID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_ItemType]
GO
ALTER TABLE [dbo].[KeyItems]  WITH CHECK ADD  CONSTRAINT [fk_KeyItems_KeyItemCategoryID] FOREIGN KEY([KeyItemCategoryID])
REFERENCES [dbo].[KeyItemCategories] ([KeyItemCategoryID])
GO
ALTER TABLE [dbo].[KeyItems] CHECK CONSTRAINT [fk_KeyItems_KeyItemCategoryID]
GO
ALTER TABLE [dbo].[LootTableItems]  WITH CHECK ADD  CONSTRAINT [fk_LootTableItems_LootTableID] FOREIGN KEY([LootTableID])
REFERENCES [dbo].[LootTables] ([LootTableID])
GO
ALTER TABLE [dbo].[LootTableItems] CHECK CONSTRAINT [fk_LootTableItems_LootTableID]
GO
ALTER TABLE [dbo].[PCAbilityCooldowns]  WITH CHECK ADD  CONSTRAINT [fk_PCAbilityCooldowns_AbilityCooldownCategoryID] FOREIGN KEY([AbilityCooldownCategoryID])
REFERENCES [dbo].[AbilityCooldownCategories] ([AbilityCooldownCategoryID])
GO
ALTER TABLE [dbo].[PCAbilityCooldowns] CHECK CONSTRAINT [fk_PCAbilityCooldowns_AbilityCooldownCategoryID]
GO
ALTER TABLE [dbo].[PCAbilityCooldowns]  WITH CHECK ADD  CONSTRAINT [fk_PCAbilityCooldowns_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCAbilityCooldowns] CHECK CONSTRAINT [fk_PCAbilityCooldowns_PlayerID]
GO
ALTER TABLE [dbo].[PCBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_PCBlueprints_CraftBlueprintID] FOREIGN KEY([CraftBlueprintID])
REFERENCES [dbo].[CraftBlueprints] ([CraftBlueprintID])
GO
ALTER TABLE [dbo].[PCBlueprints] CHECK CONSTRAINT [fk_PCBlueprints_CraftBlueprintID]
GO
ALTER TABLE [dbo].[PCBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_PCBlueprints_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCBlueprints] CHECK CONSTRAINT [fk_PCBlueprints_PlayerID]
GO
ALTER TABLE [dbo].[PCCorpseItems]  WITH CHECK ADD  CONSTRAINT [fk_PCCorpseItems_PCCorpseID] FOREIGN KEY([PCCorpseID])
REFERENCES [dbo].[PCCorpses] ([PCCorpseID])
GO
ALTER TABLE [dbo].[PCCorpseItems] CHECK CONSTRAINT [fk_PCCorpseItems_PCCorpseID]
GO
ALTER TABLE [dbo].[PCCustomEffects]  WITH CHECK ADD  CONSTRAINT [fk_PCCustomEffects_CustomEffectID] FOREIGN KEY([CustomEffectID])
REFERENCES [dbo].[CustomEffects] ([CustomEffectID])
GO
ALTER TABLE [dbo].[PCCustomEffects] CHECK CONSTRAINT [fk_PCCustomEffects_CustomEffectID]
GO
ALTER TABLE [dbo].[PCCustomEffects]  WITH CHECK ADD  CONSTRAINT [fk_PCCustomEffects_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCCustomEffects] CHECK CONSTRAINT [fk_PCCustomEffects_PlayerID]
GO
ALTER TABLE [dbo].[PCKeyItems]  WITH CHECK ADD  CONSTRAINT [fk_PCKeyItems_KeyItemID] FOREIGN KEY([KeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[PCKeyItems] CHECK CONSTRAINT [fk_PCKeyItems_KeyItemID]
GO
ALTER TABLE [dbo].[PCKeyItems]  WITH CHECK ADD  CONSTRAINT [fk_PCKeyItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCKeyItems] CHECK CONSTRAINT [fk_PCKeyItems_PlayerID]
GO
ALTER TABLE [dbo].[PCLearnedAbilities]  WITH CHECK ADD  CONSTRAINT [fk_PCLearnedAbilities_AbilityID] FOREIGN KEY([AbilityID])
REFERENCES [dbo].[Abilities] ([AbilityID])
GO
ALTER TABLE [dbo].[PCLearnedAbilities] CHECK CONSTRAINT [fk_PCLearnedAbilities_AbilityID]
GO
ALTER TABLE [dbo].[PCLearnedAbilities]  WITH CHECK ADD  CONSTRAINT [fk_PCLearnedAbilities_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCLearnedAbilities] CHECK CONSTRAINT [fk_PCLearnedAbilities_PlayerID]
GO
ALTER TABLE [dbo].[PCMigrationItems]  WITH CHECK ADD  CONSTRAINT [fk_PCMigrationItems_BaseItemTypeID] FOREIGN KEY([BaseItemTypeID])
REFERENCES [dbo].[BaseItemTypes] ([BaseItemTypeID])
GO
ALTER TABLE [dbo].[PCMigrationItems] CHECK CONSTRAINT [fk_PCMigrationItems_BaseItemTypeID]
GO
ALTER TABLE [dbo].[PCMigrationItems]  WITH CHECK ADD  CONSTRAINT [fk_PCMigrationItems_PCMigrationID] FOREIGN KEY([PCMigrationID])
REFERENCES [dbo].[PCMigrations] ([PCMigrationID])
GO
ALTER TABLE [dbo].[PCMigrationItems] CHECK CONSTRAINT [fk_PCMigrationItems_PCMigrationID]
GO
ALTER TABLE [dbo].[PCOutfits]  WITH CHECK ADD  CONSTRAINT [fk_PCOutfits_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCOutfits] CHECK CONSTRAINT [fk_PCOutfits_PlayerID]
GO
ALTER TABLE [dbo].[PCOverflowItems]  WITH CHECK ADD  CONSTRAINT [fk_PCOverflowItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCOverflowItems] CHECK CONSTRAINT [fk_PCOverflowItems_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_NPCGroupID] FOREIGN KEY([NPCGroupID])
REFERENCES [dbo].[NPCGroups] ([NPCGroupID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_NPCGroupID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_PCQuestStatusID] FOREIGN KEY([PCQuestStatusID])
REFERENCES [dbo].[PCQuestStatus] ([PCQuestStatusID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_PCQuestStatusID]
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestKillTargetProgress_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCQuestKillTargetProgress] CHECK CONSTRAINT [FK_PCQuestKillTargetProgress_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_CurrentQuestStateID] FOREIGN KEY([CurrentQuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_CurrentQuestStateID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_PlayerID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_QuestID]
GO
ALTER TABLE [dbo].[PCQuestStatus]  WITH CHECK ADD  CONSTRAINT [FK_PCQuestStatus_SelectedRewardID] FOREIGN KEY([SelectedItemRewardID])
REFERENCES [dbo].[QuestRewardItems] ([QuestRewardItemID])
GO
ALTER TABLE [dbo].[PCQuestStatus] CHECK CONSTRAINT [FK_PCQuestStatus_SelectedRewardID]
GO
ALTER TABLE [dbo].[PCRegionalFame]  WITH CHECK ADD  CONSTRAINT [FK_PCRegionalFame_FameRegionID] FOREIGN KEY([FameRegionID])
REFERENCES [dbo].[FameRegions] ([FameRegionID])
GO
ALTER TABLE [dbo].[PCRegionalFame] CHECK CONSTRAINT [FK_PCRegionalFame_FameRegionID]
GO
ALTER TABLE [dbo].[PCRegionalFame]  WITH CHECK ADD  CONSTRAINT [FK_PCRegionalFame_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCRegionalFame] CHECK CONSTRAINT [FK_PCRegionalFame_PlayerID]
GO
ALTER TABLE [dbo].[PCSearchSiteItems]  WITH CHECK ADD  CONSTRAINT [fk_PCSearchSiteItems_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSearchSiteItems] CHECK CONSTRAINT [fk_PCSearchSiteItems_PlayerID]
GO
ALTER TABLE [dbo].[PCSearchSites]  WITH CHECK ADD  CONSTRAINT [fk_PCSearchSites_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSearchSites] CHECK CONSTRAINT [fk_PCSearchSites_PlayerID]
GO
ALTER TABLE [dbo].[PCSkills]  WITH CHECK ADD  CONSTRAINT [FK_PCSkills_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCSkills] CHECK CONSTRAINT [FK_PCSkills_PlayerID]
GO
ALTER TABLE [dbo].[PCSkills]  WITH CHECK ADD  CONSTRAINT [FK_PCSkills_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[PCSkills] CHECK CONSTRAINT [FK_PCSkills_SkillID]
GO
ALTER TABLE [dbo].[PCTerritoryFlags]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlags_BuildPrivacySettingID] FOREIGN KEY([BuildPrivacySettingID])
REFERENCES [dbo].[BuildPrivacyDomain] ([BuildPrivacyTypeID])
GO
ALTER TABLE [dbo].[PCTerritoryFlags] CHECK CONSTRAINT [fk_PCTerritoryFlags_BuildPrivacySettingID]
GO
ALTER TABLE [dbo].[PCTerritoryFlags]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlags_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCTerritoryFlags] CHECK CONSTRAINT [fk_PCTerritoryFlags_PlayerID]
GO
ALTER TABLE [dbo].[PCTerritoryFlags]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlags_StructureBlueprintID] FOREIGN KEY([StructureBlueprintID])
REFERENCES [dbo].[StructureBlueprints] ([StructureBlueprintID])
GO
ALTER TABLE [dbo].[PCTerritoryFlags] CHECK CONSTRAINT [fk_PCTerritoryFlags_StructureBlueprintID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsPermissions_PCTerritoryFlagID] FOREIGN KEY([PCTerritoryFlagID])
REFERENCES [dbo].[PCTerritoryFlags] ([PCTerritoryFlagID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions] CHECK CONSTRAINT [fk_PCTerritoryFlagsPermissions_PCTerritoryFlagID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsPermissions_PlayerID] FOREIGN KEY([PlayerID])
REFERENCES [dbo].[PlayerCharacters] ([PlayerID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions] CHECK CONSTRAINT [fk_PCTerritoryFlagsPermissions_PlayerID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsPermissions_TerritoryFlagPermissionID] FOREIGN KEY([TerritoryFlagPermissionID])
REFERENCES [dbo].[TerritoryFlagPermissions] ([TerritoryFlagPermissionID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsPermissions] CHECK CONSTRAINT [fk_PCTerritoryFlagsPermissions_TerritoryFlagPermissionID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructures]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsStructures_PCTerritoryFlagID] FOREIGN KEY([PCTerritoryFlagID])
REFERENCES [dbo].[PCTerritoryFlags] ([PCTerritoryFlagID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructures] CHECK CONSTRAINT [fk_PCTerritoryFlagsStructures_PCTerritoryFlagID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructures]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsStructures_StructureBlueprintID] FOREIGN KEY([StructureBlueprintID])
REFERENCES [dbo].[StructureBlueprints] ([StructureBlueprintID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructures] CHECK CONSTRAINT [fk_PCTerritoryFlagsStructures_StructureBlueprintID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresItems]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsStructuresItems_PCStructureID] FOREIGN KEY([PCStructureID])
REFERENCES [dbo].[PCTerritoryFlagsStructures] ([PCTerritoryFlagStructureID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresItems] CHECK CONSTRAINT [fk_PCTerritoryFlagsStructuresItems_PCStructureID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsStructuresResearchQueues_PCStructureID] FOREIGN KEY([PCStructureID])
REFERENCES [dbo].[PCTerritoryFlagsStructures] ([PCTerritoryFlagStructureID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues] CHECK CONSTRAINT [fk_PCTerritoryFlagsStructuresResearchQueues_PCStructureID]
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues]  WITH CHECK ADD  CONSTRAINT [fk_PCTerritoryFlagsStructuresResearchQueues_ResearchBlueprintID] FOREIGN KEY([ResearchBlueprintID])
REFERENCES [dbo].[ResearchBlueprints] ([ResearchBlueprintID])
GO
ALTER TABLE [dbo].[PCTerritoryFlagsStructuresResearchQueues] CHECK CONSTRAINT [fk_PCTerritoryFlagsStructuresResearchQueues_ResearchBlueprintID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_NPCGroupID] FOREIGN KEY([NPCGroupID])
REFERENCES [dbo].[NPCGroups] ([NPCGroupID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_NPCGroupID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_QuestID]
GO
ALTER TABLE [dbo].[QuestKillTargetList]  WITH CHECK ADD  CONSTRAINT [FK_QuestKillTargetList_QuestStateID] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestKillTargetList] CHECK CONSTRAINT [FK_QuestKillTargetList_QuestStateID]
GO
ALTER TABLE [dbo].[QuestPrerequisites]  WITH CHECK ADD  CONSTRAINT [FK_QuestPrerequisites_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestPrerequisites] CHECK CONSTRAINT [FK_QuestPrerequisites_QuestID]
GO
ALTER TABLE [dbo].[QuestPrerequisites]  WITH CHECK ADD  CONSTRAINT [FK_QuestPrerequisites_RequiredQuestID] FOREIGN KEY([RequiredQuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestPrerequisites] CHECK CONSTRAINT [FK_QuestPrerequisites_RequiredQuestID]
GO
ALTER TABLE [dbo].[QuestRequiredItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredItemList] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestRequiredItemList] CHECK CONSTRAINT [FK_QuestRequiredItemList]
GO
ALTER TABLE [dbo].[QuestRequiredItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredItemList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRequiredItemList] CHECK CONSTRAINT [FK_QuestRequiredItemList_QuestID]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList] FOREIGN KEY([QuestStateID])
REFERENCES [dbo].[QuestStates] ([QuestStateID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList_KeyItemID] FOREIGN KEY([KeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList_KeyItemID]
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList]  WITH CHECK ADD  CONSTRAINT [FK_QuestRequiredKeyItemList_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRequiredKeyItemList] CHECK CONSTRAINT [FK_QuestRequiredKeyItemList_QuestID]
GO
ALTER TABLE [dbo].[QuestRewardItems]  WITH CHECK ADD  CONSTRAINT [FK_QuestRewards_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestRewardItems] CHECK CONSTRAINT [FK_QuestRewards_QuestID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_FameRegionID] FOREIGN KEY([FameRegionID])
REFERENCES [dbo].[FameRegions] ([FameRegionID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_FameRegionID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_RewardKeyItemID] FOREIGN KEY([RewardKeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_RewardKeyItemID]
GO
ALTER TABLE [dbo].[Quests]  WITH CHECK ADD  CONSTRAINT [FK_Quests_TemporaryKeyItemID] FOREIGN KEY([StartKeyItemID])
REFERENCES [dbo].[KeyItems] ([KeyItemID])
GO
ALTER TABLE [dbo].[Quests] CHECK CONSTRAINT [FK_Quests_TemporaryKeyItemID]
GO
ALTER TABLE [dbo].[QuestStates]  WITH CHECK ADD  CONSTRAINT [FK_QuestStates_QuestID] FOREIGN KEY([QuestID])
REFERENCES [dbo].[Quests] ([QuestID])
GO
ALTER TABLE [dbo].[QuestStates] CHECK CONSTRAINT [FK_QuestStates_QuestID]
GO
ALTER TABLE [dbo].[QuestStates]  WITH CHECK ADD  CONSTRAINT [FK_QuestStates_QuestTypeID] FOREIGN KEY([QuestTypeID])
REFERENCES [dbo].[QuestTypeDomain] ([QuestTypeID])
GO
ALTER TABLE [dbo].[QuestStates] CHECK CONSTRAINT [FK_QuestStates_QuestTypeID]
GO
ALTER TABLE [dbo].[ResearchBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_ResearchBlueprints_BlueprintID] FOREIGN KEY([CraftBlueprintID])
REFERENCES [dbo].[CraftBlueprints] ([CraftBlueprintID])
GO
ALTER TABLE [dbo].[ResearchBlueprints] CHECK CONSTRAINT [fk_ResearchBlueprints_BlueprintID]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Primary] FOREIGN KEY([Primary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Primary]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Secondary] FOREIGN KEY([Secondary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Secondary]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_SkillCategoryID] FOREIGN KEY([SkillCategoryID])
REFERENCES [dbo].[SkillCategories] ([SkillCategoryID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_SkillCategoryID]
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD  CONSTRAINT [FK_Skills_Tertiary] FOREIGN KEY([Tertiary])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[Skills] CHECK CONSTRAINT [FK_Skills_Tertiary]
GO
ALTER TABLE [dbo].[SkillXPRequirement]  WITH CHECK ADD  CONSTRAINT [FK_SkillXPRequirement_SkillID] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([SkillID])
GO
ALTER TABLE [dbo].[SkillXPRequirement] CHECK CONSTRAINT [FK_SkillXPRequirement_SkillID]
GO
ALTER TABLE [dbo].[SpawnTableCreatures]  WITH CHECK ADD  CONSTRAINT [fk_SpawnTableCreatures_LootTableID] FOREIGN KEY([LootTableID])
REFERENCES [dbo].[LootTables] ([LootTableID])
GO
ALTER TABLE [dbo].[SpawnTableCreatures] CHECK CONSTRAINT [fk_SpawnTableCreatures_LootTableID]
GO
ALTER TABLE [dbo].[SpawnTableCreatures]  WITH CHECK ADD  CONSTRAINT [fk_SpawnTableCreatures_SpawnTableID] FOREIGN KEY([SpawnTableID])
REFERENCES [dbo].[SpawnTables] ([SpawnTableID])
GO
ALTER TABLE [dbo].[SpawnTableCreatures] CHECK CONSTRAINT [fk_SpawnTableCreatures_SpawnTableID]
GO
ALTER TABLE [dbo].[StorageItems]  WITH CHECK ADD  CONSTRAINT [fk_StorageItems_StorageContainerID] FOREIGN KEY([StorageContainerID])
REFERENCES [dbo].[StorageContainers] ([StorageContainerID])
GO
ALTER TABLE [dbo].[StorageItems] CHECK CONSTRAINT [fk_StorageItems_StorageContainerID]
GO
ALTER TABLE [dbo].[StructureBlueprints]  WITH CHECK ADD  CONSTRAINT [fk_StructureBlueprints_StructureCategoryID] FOREIGN KEY([StructureCategoryID])
REFERENCES [dbo].[StructureCategories] ([StructureCategoryID])
GO
ALTER TABLE [dbo].[StructureBlueprints] CHECK CONSTRAINT [fk_StructureBlueprints_StructureCategoryID]
GO
ALTER TABLE [dbo].[StructureComponents]  WITH CHECK ADD  CONSTRAINT [FK_StructureComponents_StructureBlueprintID] FOREIGN KEY([StructureBlueprintID])
REFERENCES [dbo].[StructureBlueprints] ([StructureBlueprintID])
GO
ALTER TABLE [dbo].[StructureComponents] CHECK CONSTRAINT [FK_StructureComponents_StructureBlueprintID]
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit]  WITH CHECK ADD  CONSTRAINT [FK_StructureQuickBuildAudit_PCTerritoryFlagID] FOREIGN KEY([PCTerritoryFlagID])
REFERENCES [dbo].[PCTerritoryFlags] ([PCTerritoryFlagID])
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit] CHECK CONSTRAINT [FK_StructureQuickBuildAudit_PCTerritoryFlagID]
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit]  WITH CHECK ADD  CONSTRAINT [FK_StructureQuickBuildAudit_PCTerritoryFlagStructureID] FOREIGN KEY([PCTerritoryFlagStructureID])
REFERENCES [dbo].[PCTerritoryFlagsStructures] ([PCTerritoryFlagStructureID])
GO
ALTER TABLE [dbo].[StructureQuickBuildAudit] CHECK CONSTRAINT [FK_StructureQuickBuildAudit_PCTerritoryFlagStructureID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Users_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[DMRoleDomain] ([DMRoleDomainID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_Users_RoleID]
GO
USE [master]
GO
ALTER DATABASE [freescape] SET  READ_WRITE 
GO
