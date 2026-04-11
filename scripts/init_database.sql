/*

==============================================================================================
Script Purpose:
      This Script Creates a new database named 'DataWarehouse' after checking if it already exists.
	  If the database exists, it is dropped and recreated.Additionally, the script sets up theree schemas
	  within the database: 'bronze', 'silver', and 'gold'.


WARNING:
      Running this script will drop the entire 'DataWarehouse' database if it exists.
	  ALL data in the database will be permanently deleted. Procced with caution
	  and ensure you have proper backups before running this script.
*/


USE master;
GO


-- DROP and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

--Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
