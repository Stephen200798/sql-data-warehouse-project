/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS
select 
	row_number() over(order by cst_id) as customer_id,
	a.cst_id as customer_number,
	a.cst_key as customer_key,
	a.cst_firstname as firstname,
	a.cst_lastname as lastname,
	case when a.cst_gndr != 'n/a' then a.cst_gndr
		 else coalesce(b.gen, 'n/a')
	end as gender,
	a.cst_marital_status as marital_status,
	c.cntry as country,
	b.bdate as birthdate,
	a.cst_create_date as create_date
from silver.crm_cust_info a
left join silver.erp_cust_az12 b
on a.cst_key = b.cid
left join silver.erp_loc_a101 c
on a.cst_key = c.cid
GO

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_products AS
select 
	row_number() over(order by a.prd_start_dt, a.prd_key) as product_number,
	a.prd_id as product_id,
	a.prd_key as product_key,
	a.prd_nm as product_name,
	a.cat_id as category_id,
	b.cat as category,
	b.subcat as subcategory,
	b.maintenance,
	a.prd_cost as cost,
	a.prd_line as product_line,
	a.prd_start_dt as start_date
from silver.crm_prd_info a
left join silver.erp_px_cat_g1v2 b
on a.cat_id = b.id
where prd_end_dt is null -- Filter out all historical data
GO

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

CREATE VIEW gold.fact_sales AS
select 
	a.sls_ord_num as order_number,
	b.product_number,
	c.customer_id,
	a.sls_order_dt as order_date,
	a.sls_ship_dt as shipping_date,
	a.sls_due_dt as due_date,
	a.sls_sales as sales_amount,
	a.sls_quantity as quantity,
	a.sls_price as price
from silver.crm_sales_details a
left join gold.dim_products b
on a.sls_prd_key = b.product_key
left join gold.dim_customers c
on a.sls_cust_id = c.customer_number
GO
