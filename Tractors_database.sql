/*
Created: 2017-12-15
Modified: 2018-01-10
Model: Microsoft SQL Server 2014
Database: MS SQL Server 2014
*/


-- Create tables section -------------------------------------------------

-- Table Producent

CREATE TABLE [Producent]
(
 [Id_producent] Int IDENTITY NOT NULL,
 [Nazwa_producenta] Varchar(50) NOT NULL,
 [Kraj] Varchar(50) NOT NULL,
 [Adres] Varchar(50) NOT NULL,
 [Rok_założenia] Int NOT NULL,
 [Strona_www] Varchar(50) NOT NULL
)
go

-- Add keys for table Producent

ALTER TABLE [Producent] ADD CONSTRAINT [Key1] PRIMARY KEY ([Id_producent])
go

-- Table Model

CREATE TABLE [Model]
(
 [Nr_katalogowy] Int IDENTITY NOT NULL,
 [Nazwa_modelu] Varchar(50) NOT NULL,
 [Cena] Money NOT NULL,
 [Rok_powstania] Int NOT NULL,
 [Miejsce_produkcji] Varchar(50) NOT NULL,
 [Foto] Image NULL,
 [Id_producent] Int NOT NULL
)
go

-- Create indexes for table Model

CREATE INDEX [IX_Relationship1] ON [Model] ([Id_producent])
go

-- Add keys for table Model

ALTER TABLE [Model] ADD CONSTRAINT [Key2] PRIMARY KEY ([Nr_katalogowy])
go

-- Table Silnik

CREATE TABLE [Silnik]
(
 [Id_silnik] Int IDENTITY NOT NULL,
 [Model_silnika] Varchar(50) NOT NULL,
 [Moc] Int NOT NULL,
 [Pojemność] Int NOT NULL,
 [Moment_obrotowy] Int NOT NULL
)
go

-- Add keys for table Silnik

ALTER TABLE [Silnik] ADD CONSTRAINT [Key3] PRIMARY KEY ([Id_silnik])
go

-- Table Skrzynia_biegów

CREATE TABLE [Skrzynia_biegów]
(
 [Id_skrzynia] Int IDENTITY NOT NULL,
 [Liczba_biegów_przód] Tinyint NOT NULL,
 [Liczba_biegów_tył] Tinyint NOT NULL,
 [Maksymalna_prędkość] Tinyint NOT NULL
)
go

-- Add keys for table Skrzynia_biegów

ALTER TABLE [Skrzynia_biegów] ADD CONSTRAINT [Key4] PRIMARY KEY ([Id_skrzynia])
go

-- Table Ogumiene

CREATE TABLE [Ogumiene]
(
 [Id_ogumienie] Int IDENTITY NOT NULL,
 [Średnica] Tinyint NOT NULL,
 [Szerokość] Tinyint NOT NULL,
 [Wysokość_bieżnika] Tinyint NOT NULL
)
go

-- Add keys for table Ogumiene

ALTER TABLE [Ogumiene] ADD CONSTRAINT [Key5] PRIMARY KEY ([Id_ogumienie])
go

-- Table Model_Silnik

CREATE TABLE [Model_Silnik]
(
 [Nr_katalogowy] Int NOT NULL,
 [Id_silnik] Int NOT NULL
)
go

-- Add keys for table Model_Silnik

ALTER TABLE [Model_Silnik] ADD CONSTRAINT [Key7] PRIMARY KEY ([Nr_katalogowy],[Id_silnik])
go

-- Table Model_Ogumienie

CREATE TABLE [Model_Ogumienie]
(
 [Nr_katalogowy] Int NOT NULL,
 [Id_ogumienie] Int NOT NULL
)
go

-- Add keys for table Model_Ogumienie

ALTER TABLE [Model_Ogumienie] ADD CONSTRAINT [Key8] PRIMARY KEY ([Nr_katalogowy],[Id_ogumienie])
go

-- Table Model_Skrzynia_biegów

CREATE TABLE [Model_Skrzynia_biegów]
(
 [Nr_katalogowy] Int NOT NULL,
 [Id_skrzynia] Int NOT NULL
)
go

-- Add keys for table Model_Skrzynia_biegów

ALTER TABLE [Model_Skrzynia_biegów] ADD CONSTRAINT [Key9] PRIMARY KEY ([Nr_katalogowy],[Id_skrzynia])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Model_Silnik] ADD CONSTRAINT [posiada2] FOREIGN KEY ([Nr_katalogowy]) REFERENCES [Model] ([Nr_katalogowy]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model_Silnik] ADD CONSTRAINT [należy2] FOREIGN KEY ([Id_silnik]) REFERENCES [Silnik] ([Id_silnik]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model_Ogumienie] ADD CONSTRAINT [posiada4] FOREIGN KEY ([Nr_katalogowy]) REFERENCES [Model] ([Nr_katalogowy]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model_Ogumienie] ADD CONSTRAINT [należy4] FOREIGN KEY ([Id_ogumienie]) REFERENCES [Ogumiene] ([Id_ogumienie]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model_Skrzynia_biegów] ADD CONSTRAINT [posiada3] FOREIGN KEY ([Nr_katalogowy]) REFERENCES [Model] ([Nr_katalogowy]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model_Skrzynia_biegów] ADD CONSTRAINT [należy3] FOREIGN KEY ([Id_skrzynia]) REFERENCES [Skrzynia_biegów] ([Id_skrzynia]) ON UPDATE NO ACTION ON DELETE NO ACTION
go


ALTER TABLE [Model] ADD CONSTRAINT [posiada] FOREIGN KEY ([Id_producent]) REFERENCES [Producent] ([Id_producent]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




