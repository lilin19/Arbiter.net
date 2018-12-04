
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/30/2018 16:11:10
-- Generated from EDMX file: C:\Users\tg\source\repos\Arbiter.net\KenosisBase\Model\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Kenosis];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PoolMsg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Msgs] DROP CONSTRAINT [FK_PoolMsg];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Pools]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pools];
GO
IF OBJECT_ID(N'[dbo].[Msgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Msgs];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Username] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pools'
CREATE TABLE [dbo].[Pools] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [OwnerId] nvarchar(max)  NOT NULL,
    [Users] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Msgs'
CREATE TABLE [dbo].[Msgs] (
    [Id] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [UserId] nvarchar(max)  NOT NULL,
    [Time] datetime  NOT NULL,
    [PoolId] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id], [Username] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id], [Username] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pools'
ALTER TABLE [dbo].[Pools]
ADD CONSTRAINT [PK_Pools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [PK_Msgs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PoolId] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [FK_PoolMsg]
    FOREIGN KEY ([PoolId])
    REFERENCES [dbo].[Pools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PoolMsg'
CREATE INDEX [IX_FK_PoolMsg]
ON [dbo].[Msgs]
    ([PoolId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------