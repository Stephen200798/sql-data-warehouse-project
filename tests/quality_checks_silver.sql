-- Check for Nulls or duplicates in primary key
-- Expectation: No Result
select 
cst_id,
count(*)
from bronze.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null

-- Check for Unwanted Spaces
-- Expectation: No Results
Select cst_firstname
from bronze.crm_cust_info
where cst_firstname != trim(cst_firstname)

-- Check for Nulls or Negative Numbers 
-- Expectation: No Results
select prd_cost 
from silver.crm_prd_info
where prd_cost < 0 or prd_cost is null

-- Data Standardization & Consistency
select distinct cst_gndr
from bronze.crm_cust_info

-- Check for Invalid Date Orders
select *
from bronze.crm_prd_info
where prd_end_dt < prd_start_dt

-- Check for Invalid Date Orders
select 
nullif(sls_order_dt, 0) sls_order_dt
from bronze.crm_sales_details
where sls_order_dt <= 0 
or len(sls_order_dt) != 8
or sls_order_dt > 20500101
or sls_order_dt < 19000101

-- Check for invalid Date Orders
select
*
from bronze.crm_sales_details
where sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt

-- Check Data Consistency: Between Sales, Quantity, and Price
-- >> Sales = Quantity * Price 
-- >> Values must not be NULL, zero, or negative 
select distinct
sls_sales,
sls_quantity,
sls_price
from bronze.crm_sales_details
where sls_sales != sls_quantity * sls_price
or sls_sales is null or sls_quantity is null or sls_price is null
or sls_sales <= 0 or sls_quantity <= 0 or sls_price <= 0
order by sls_sales,sls_quantity,sls_price
