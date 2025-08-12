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
- **ERP System** → CSV export  
- **CRM System** → CSV export  

These CSV files are ingested into the data warehouse through ETL scripts.

## 🏗 Architecture
The project follows a **Star Schema** model:
- **Fact Tables**: Store business process measurements (e.g., sales, orders)
- **Dimension Tables**: Contain descriptive attributes for analysis (e.g., customers, products, time)

Architecture Diagram:  


<img width="923" height="638" alt="Screenshot 2025-08-12 094718" src="https://github.com/user-attachments/assets/f68b2513-b057-4633-ac91-c7db5adb891f" />


*(Diagram created in draw.io)*

