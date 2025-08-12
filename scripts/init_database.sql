/*
=================================================================
Create Database and Schemas
=================================================================
Script purpose:
    This script creates a new adatbase named 'Datawarehouse' after checking if it already exists,
    If thee database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    withinthe database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'Datawarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this scripts.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
if exists (select 1 from sys.databases where name = 'Datawarehouse')
begin
  alter database Datawarehouse set SINGLE_USER with rollback immediate;
  drop database Datawarehouse;
end;
go 

-- Create the 'Datawarehouse' database
create database Datawarehouse;
go 

use Datawarehouse;
go 

-- Create Schemas
create schema bronze;
go

create schema silver;
go

create schema gold;
go
