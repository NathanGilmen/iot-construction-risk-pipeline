# 🏗️ IoT Sensor ETL Pipeline & Operational Risk Analytics

[![Python](https://img.shields.io/badge/Python-3.10+-blue.svg)](https://www.python.org/)
[![SQL](https://img.shields.io/badge/SQL-PostgreSQL%20%2F%20BigQuery-orange.svg)]()
[![Airflow](https://img.shields.io/badge/Orchestration-Apache%20Airflow-green.svg)](https://airflow.apache.org/)

## 📌 Executive Summary
This project implements an end-to-end data engineering pipeline designed to ingest, transform, and analyze IoT telemetry data collected from construction sites. 

By integrating IoT sensor data with relational databases, the pipeline automates risk detection (e.g., equipment overheating, structural load stress, unauthorized zone access) to support data-driven decision-making and operational safety.

---

## 🛠️ Tech Stack & Architecture

* **Programming & Data Manipulation:** Python (`pandas`, `numpy`, `SQLAlchemy`)
* **Database & Cloud Warehousing:** PostgreSQL (Relational Staging), Google Cloud Platform (`BigQuery`)
* **Data Modeling:** Dimensional Modeling (Star Schema - Fact & Dimension Tables)
* **Workflow Orchestration:** Apache Airflow (`DAGs`, Automated Schedulers)
* **Advanced Analytics:** SQL (`Window Functions`, `CTEs`, Aggregations)

---

## 📐 Data Architecture & Pipeline Workflow

```text
[IoT Sensors / CSV Telemetry] 
          │
          ▼
[Extract & Transform (Python / Pandas)] ──► [PostgreSQL Staging Database]
          │
          ▼
[Load & Storage (GCP BigQuery Data Warehouse)]
          │
          ▼
[Data Modeling (Star Schema)] ──► [SQL Risk Analytics / Business Reports]
---

## 📊 Key SQL Analytics & Business Insights

The analytical layer enables real-time monitoring and reporting. Key metrics calculated include:
1. **Anomaly Detection:** Identification of telemetry spikes exceeding safety thresholds using `Window Functions` (`AVG() OVER (PARTITION BY ...)`).
2. **Equipment Downtime Risk:** Rolling sum analysis of stress indicators over 24-hour windows using SQL `CTEs`.
3. **Zone Risk Scoring:** Aggregated operational risk levels across site locations.

---

## 🚀 Repository Structure

```text
iot-construction-risk-pipeline/
├── sql/
│   └── risk_analysis_queries.sql     # Advanced SQL queries (CTEs, Window Functions)
├── scripts/
│   └── extract_transform.py          # Python ETL script using Pandas & SQLAlchemy
└── README.md                         # Main documentation
## 👤 Author
* **Nathan de Souza Gilmen e Silva** - [LinkedIn](https://linkedin.com/in/nathan-gilmen-7b493b119)
