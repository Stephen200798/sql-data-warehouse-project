# Data Warehouse and Analytics Project

Welcome to the **Data Warehouse and Analytics Project** repository! 🚀  
This project showcases the end-to-end development of a modern data warehouse using SQL Server — from raw data ingestion to generating business insights via reporting. Designed as a portfolio project, it demonstrates best practices in data engineering, modeling, and analysis.

---

## 🏗️ Data Architecture

The project follows the **Medallion Architecture** pattern with three data layers:  
![Data Architecture](docs/data_architecture.png)

1. **Bronze Layer** – Raw data ingested from CRM and ERP systems (CSV format)  
2. **Silver Layer** – Cleansed, standardized, and integrated data  
3. **Gold Layer** – Star-schema model optimized for reporting and analytics

---

## 📖 Project Overview

This project includes:

- 🏗️ **Data Architecture** – Modern warehouse design using SQL Server  
- ⚙️ **ETL Pipelines** – SSIS-based workflows to extract, clean, and load data  
- 🧱 **Data Modeling** – Fact and dimension tables optimized for analysis  
- 📊 **Analytics & Reporting** – SQL-based KPIs and Power BI dashboards

🎯 Ideal for those interested in:
- SQL Development  
- Data Engineering  
- ETL Workflow Design  
- Dimensional Modeling  
- Business Intelligence  

---

## 🚀 Project Requirements

### 💼 Data Engineering

#### Objective  
Develop a modern SQL Server-based data warehouse to consolidate sales data from CRM and ERP sources for analytics and decision-making.

#### Key Specs

- **Data Sources**: CSV-based ERP & CRM datasets  
- **ETL**: SSIS pipelines across Bronze → Silver → Gold  
- **Data Quality**: Deduplication, formatting, and validation  
- **Modeling**: Star schema with FactSales and supporting dimensions  
- **Scope**: Most recent data only (no historization)  
- **Documentation**: Clear model documentation for analytics teams

---

### 📊 Analytics & Reporting

#### Objective  
Deliver SQL and Power BI-based insights covering:

- 🧑‍🤝‍🧑 Customer behavior  
- 📦 Product performance  
- 📈 Sales trends  

These metrics empower business teams with actionable intelligence.

For more, check: [docs/requirements.md](docs/requirements.md)

---

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/ # Raw CSV datasets (ERP and CRM)
├── docs/ # Architecture & model documentation
│ ├── data_architecture.drawio # Architecture diagrams
│ ├── data_flow.drawio # ETL & data flow diagrams
│ ├── data_catalog.md # Dataset field descriptions
│ ├── naming-conventions.md # Naming guidelines
│
├── scripts/ # SQL scripts for ETL pipelines
│ ├── bronze/ # Raw data ingestion
│ ├── silver/ # Cleaning & transformations
│ ├── gold/ # Star schema creation
│
├── tests/ # Data quality checks
├── README.md # Project overview
├── LICENSE # License file (MIT)
└── requirements.txt # Dependencies and setup notes

---

## 🛠️ Tools & Resources

- [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)  
- [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)  
- [Power BI Desktop](https://powerbi.microsoft.com/)  
- [GitHub](https://github.com/) – Version control  
- [Draw.io](https://www.drawio.com/) – Diagrams and architecture  
- [Notion](https://www.notion.com/) – Project organization (optional)

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and share this project with proper credit.

---

## 🌟 About Me

Hi there! I'm **Stephen Akinfe**, a data enthusiast passionate about transforming raw data into meaningful insights through scalable data infrastructure, ETL pipelines, and analytics solutions.

📍 Connect with me:  
- [LinkedIn](https://www.linkedin.com/in/stephen-akinfe-6692632b3)  
- [GitHub](https://github.com/Stephen200798)

Let's build with data! 🚀
