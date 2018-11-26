
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/26/2018 10:49:50
-- Generated from EDMX file: C:\Users\tg\source\repos\Arbiter\KenosisBase\Model\Msg.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Msgs'
CREATE TABLE [dbo].[Msgs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] datetime  NOT NULL,
    [Time] datetime  NOT NULL,
    [Pool_Id] int  NOT NULL
);
GO

-- Creating table 'Pools'
CREATE TABLE [dbo].[Pools] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Msg_Id] int  NOT NULL
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

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Pool_Id] in table 'Msgs'
ALTER TABLE [dbo].[Msgs]
ADD CONSTRAINT [FK_MsgPool]
    FOREIGN KEY ([Pool_Id])
    REFERENCES [dbo].[Pools]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_MsgPool'
CREATE INDEX [IX_FK_MsgPool]
ON [dbo].[Msgs]
    ([Pool_Id]);
GO

-- Creating foreign key on [Msg_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UserMsg]
    FOREIGN KEY ([Msg_Id])
    REFERENCES [dbo].[Msgs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserMsg'
CREATE INDEX [IX_FK_UserMsg]
ON [dbo].[Users]
    ([Msg_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Pools'
ALTER TABLE [dbo].[Pools]
ADD CONSTRAINT [FK_PoolUser]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PoolUser'
CREATE INDEX [IX_FK_PoolUser]
ON [dbo].[Pools]
    ([User_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------