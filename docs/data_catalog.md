# 📦 Data Warehouse Catalog

This repository documents the dimensional model used in the Sales Data Warehouse, including fact and dimension tables with descriptions, data types, and purposes.

---

 Table: dim_products

Purpose:  
Stores master data about products including classification, cost, and availability. Used to analyze product performance and support filtering in BI tools.

| Column Name      | Data Type | Description                                                                  |
|------------------|-----------|------------------------------------------------------------------------------|
|  product_number  | INT       | Business identifier for the product, used in transactions                    |
|  product_id      | NVARCHAR  | Product identifier from source system or ERP                                 |
|  product_key     | INT       | Surrogate key for the product dimension                                      |
|  product_name    | NVARCHAR  | Name or title of the product                                                 |
|  category_id     | NVARCHAR  | ID representing the category the product belongs to                          |
|  category        | NVARCHAR  | Broad classification such as Apparel, Electronics                            |
|  subcategory     | NVARCHAR  | Subdivision under the main product category                                  |
|  maintenance     | NVARCHAR  | Indicator or notes on product maintenance status                             |
|   cost           | INT       | Cost to produce or purchase the product                                      |
|  product_line    | NVARCHAR  | Logical grouping or tier of the product                                      |
|  start_date      | DATE      | Date the product became active or was introduced                             |

---

Table: dim_customers

Purpose: 
Contains demographic and onboarding details about customers. Enables segmentation, trend analysis, and joining with sales transactions.

| Column Name        | Data Type | Description                                                                |
|--------------------|-----------|----------------------------------------------------------------------------|
|  customer_id       | INT       | Business/system ID used in transactions                                    |
|  customer_number   | NVARCHAR  | External-facing customer reference or CRM ID                               |
|  customer_key      | INT       | Surrogate key for customer dimension                                       |
|  firstname         | NVARCHAR  | Customer’s first name                                                      |
|  lastname          | NVARCHAR  | Customer’s last name                                                       |
|  gender            | NVARCHAR  | Gender identity of the customer                                            |
| marital_status     | NVARCHAR  | Marital status (e.g., Married, Single)                                     |
|  country           | NVARCHAR  | Country of residence                                                       |
|  birthdate         | DATE      | Customer’s date of birth                                                   |
|  create_date       | DATE      | Date when customer profile was created in the system                       |

---

Table: fact_sales

Purpose:  
Stores transactional sales data, including quantities and values. Connects customer and product dimensions. Enables revenue tracking and performance analytics.

|  Column Name     | Data Type | Description                                                               |
|------------------|-----------|---------------------------------------------------------------------------|
|  order_number    | NVARCHAR  | Unique identifier for each sales transaction                              |
|  product_number  | INT       | References dim_product.product_number                                     |
|  customer_id     | INT       | References dim_customer.customer_id                                       |
|  order_date      | DATE      | Date when the order was placed                                            |
|  shipping_date   | DATE      | Date when the order was shipped                                           |
|  due_date        | DATE      | Expected delivery or payment due date                                     |
|  sales_amount    | INT       | Total revenue from the transaction (quantity × price)                     |
|   quantity       | INT       | Number of units sold                                                      |
|    price         | INT       | Price per unit at time of transaction                                     |

---

## 📌 Notes

- Surrogate keys (*_key) are used as primary keys in dimension tables.
- Business/natural keys (product_number, customer_id) are used in the fact table.
- All DATE fields follow standard SQL DATE format.
- No decimal or float values are used — all monetary fields are stored as integers.
