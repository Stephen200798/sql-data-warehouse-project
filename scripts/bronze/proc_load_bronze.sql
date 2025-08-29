/*
=======================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
=======================================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

Parameters:
    None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
=======================================================================================
*/
create or alter procedure bronze.load_bronze as 
BEGIN
	Declare @start_time Datetime, @end_time Datetime, @batch_start_time Datetime, @batch_end_time Datetime;
	BEGIN TRY
		set @batch_start_time = GETDATE();
		Print '==========================================';
		Print 'Loading Bronze Layer';
		Print '==========================================';

		Print '------------------------------------------';
		Print 'Loading CRM Tables';
		Print '------------------------------------------';

		set @start_time = GETDATE();
		Print '>> Truncatng Table: bronze.crm_cust_info'
		truncate table bronze.crm_cust_info;

		Print '>> Inserting Data Into: bronze.crm_cust_info'
		bulk insert bronze.crm_cust_info 
		from 'C:\sql\dwh_project\datasets\source_crm\cust_info.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock 
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------'

		set @start_time = GETDATE();
		Print '>> Truncatng Table: bronze.crm_prd_info'
		truncate table bronze.crm_prd_info;

		Print '>> Inseting Data Into: bronze.crm_prd_info'
		bulk insert bronze.crm_prd_info
		from 'C:\sql\dwh_project\datasets\source_crm\prd_info.csv'
		with ( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------'

		set @start_time = GETDATE();
		Print '>> Truncatng Table: bronze.crm_sales_details'
		truncate table bronze.crm_sales_details;

		Print '>> Inserting Data Into: bronze.crm_sales_details'
		bulk insert bronze.crm_sales_details
		from 'C:\sql\dwh_project\datasets\source_crm\sales_details.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------'

		Print '------------------------------------------';
		Print 'Loading ERP Tables';
		Print '------------------------------------------';

		set @start_time = GETDATE();
		Print '>> Truncatng Table: bronze.erp_cust_az12'
		truncate table bronze.erp_cust_az12;

		Print '>> Inserting Data Into: bronze.erp_cust_az12'
		bulk insert bronze.erp_cust_az12
		from 'C:\sql\dwh_project\datasets\source_erp\CUST_AZ12.csv'
		with (
			firstrow = 2, 
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------'

		set @start_time = GETDATE();
		Print '>> Truncatng Table: bronze.erp_loc_a101'
		truncate table bronze.erp_loc_a101;

		Print '>> Inserting Data Into: bronze.erp_loc_a101'
		bulk insert bronze.erp_loc_a101
		from 'C:\sql\dwh_project\datasets\source_erp\LOC_A101.csv'
		with ( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------'

		set @start_time = getdate();
		Print '>> Truncatng Table: bronze.erp_px_cat_g1v2'
		truncate table bronze.erp_px_cat_g1v2;

		Print '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\sql\dwh_project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		Print '>> Load Duration: ' + Cast(Datediff(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		Print '>>--------------------------------------------------------';

		set @batch_end_time = GETDATE();
		Print '======================================='
		Print 'Loading Bronze Layer is Completed'
		Print ' - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		Print '======================================='
	END TRY
	BEGIN CATCH
		Print '================================================'
		Print 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		Print 'Error Message' + ERROR_MESSAGE();
		Print 'Error Message' + CAST (ERROR_MESSAGE() AS NVARCHAR);
		Print 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		Print '================================================'
	END CATCH
END
