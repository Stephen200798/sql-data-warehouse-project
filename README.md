# Data Warehouse Project

## 📌 Overview
The **Data Warehouse Project** is designed to consolidate, transform, and structure data from multiple source systems into a centralized repository for analytics, reporting, and data engineering workflows.  
This project implements a **Star Schema** architecture, making it efficient for analytical queries and business intelligence reporting.

## 🎯 Purpose
- **Analytics**: Provide a single source of truth for data-driven decision-making.
- **Reporting**: Enable standardized and ad-hoc reports.
- **Data Engineering**: Facilitate data processing, transformation, and governance.

## 🛠 Tech Stack
- **Database**: Relational Database (Data Warehouse)
- **ETL Tools**: For data extraction, transformation, and loading
- **BI Tools**: For visualization and reporting
- **Notion**: For project planning and task tracking
- **draw.io**: For creating architecture and process diagrams

## 📂 Data Sources
- **CRM System** → CSV export    
- **ERP System** → CSV export 

These CSV files are ingested into the data warehouse through ETL scripts.

## 🏗 Data Architecture
- **Bronze Layer: Stores raw data as is from the source systems. Data is ingested from CSV files to SQL.
- **Silver Layer: THis layer includes data cleansing, standardization and normalization processes to prepare data for analysis.
- **Gold Layer: The project follows a **Star Schema** model:
- **Fact Tables**: Store business process measurements (e.g., sales, orders)
- **Dimension Tables**: Contain descriptive attributes for analysis (e.g., customers, products, time)


*(Diagram created in draw.io)*

## 📄 License
This project is licensed under the **MIT License** — you are free to use, modify, and distribute this software with proper attribution.

## About Me
As a versatile and analytical professional with a passion for innovation, I seamlessly integrate expertise in mathematics, highly organized and proactive administrative professional with strong experience in data management,
reporting, and stakeholder coordination.

Feel free to connect with me:

LInkedin: www.linkedin.com/in/stephen-akinfe-6692632b3
