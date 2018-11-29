
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/26/2018 17:26:34
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

IF OBJECT_ID(N'[dbo].[FK_UserPool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pools] DROP CONSTRAINT [FK_UserPool];
GO
IF OBJECT_ID(N'[dbo].[FK_UserMsg]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Msgs] DROP CONSTRAINT [FK_UserMsg];
GO
IF OBJECT_ID(N'[dbo].[FK_MsgPool]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Msgs] DROP CONSTRAINT [FK_MsgPool];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Msgs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Msgs];
GO
IF OBJECT_ID(N'[dbo].[Pools]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pools];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Msgs'
CREATE TABLE [dbo].[Msgs] (
    [Id] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Time] datetime  NOT NULL,
    [PoolId] nvarchar(max)  NOT NULL,
    [UserId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pools'
CREATE TABLE [dbo].[Pools] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [UserId] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserPool'
CREATE TABLE [dbo].[UserPool] (
    [Users_Id] nvarchar(max)  NOT NULL,
    [Pools_Id] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [PK_Msgs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pools'
ALTER TABLE [dbo].[Pools]
ADD CONSTRAINT [PK_Pools]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Users_Id], [Pools_Id] in table 'UserPool'
ALTER TABLE [dbo].[UserPool]
ADD CONSTRAINT [PK_UserPool]
    PRIMARY KEY CLUSTERED ([Users_Id], [Pools_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [FK_UserMsg]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserMsg'
CREATE INDEX [IX_FK_UserMsg]
ON [dbo].[Msgs]
    ([UserId]);
GO

-- Creating foreign key on [PoolId] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [FK_MsgPool]
    FOREIGN KEY ([PoolId])
    REFERENCES [dbo].[Pools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MsgPool'
CREATE INDEX [IX_FK_MsgPool]
ON [dbo].[Msgs]
    ([PoolId]);
GO

-- Creating foreign key on [Users_Id] in table 'UserPool'
ALTER TABLE [dbo].[UserPool]
ADD CONSTRAINT [FK_UserPool_User]
    FOREIGN KEY ([Users_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Pools_Id] in table 'UserPool'
ALTER TABLE [dbo].[UserPool]
ADD CONSTRAINT [FK_UserPool_Pool]
    FOREIGN KEY ([Pools_Id])
    REFERENCES [dbo].[Pools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPool_Pool'
CREATE INDEX [IX_FK_UserPool_Pool]
ON [dbo].[UserPool]
    ([Pools_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------