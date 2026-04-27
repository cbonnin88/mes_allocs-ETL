# 🛡️ Mes-Allocs: End-to-End Analytics Engineering & Product Strategy

An end-to-end project simulating a fintech benefit platform (Mes-Allocs). This project covers the entire data lifecycle: from raw event generation and ELT to dbt modeling, machine learning for churn prediction, and a final Streamlit application for Product Managers.

## 🚀 Project Overview

The goal of this project was to identify why users were dropping off the benefit simulation funnel and to build a predictive tool to help the Product team intervene before users churn.

### The Stack
- **Data Generation:** Polars (Python)
- **Ingestion:** Fivetran
- **Warehouse:** Google BigQuery
- **Transformation:** dbt (Data Build Tool)
- **Analytics:** Amplitude (Behavioral), Looker Studio (BI)
- **Machine Learning:** Scikit-Learn (Random Forest Classifier)
- **Product Tooling:** Streamlit

---

## 📂 Project Phases

### Phase 1: Data Ingestion & Infrastructure
Generated 50k+ rows of synthetic behavioral data mimicking user interactions (simulations, signups, payments). Data was synced from Google Cloud Storage to **BigQuery** using **Fivetran**.

### Phase 2: Data Modeling with dbt
Implemented a **Medallion Architecture**:
- **Staging:** Cleaned raw event logs.
- **Marts:** Created `fct_product_events` and `dim_users` for downstream analysis.
- *Key outcome:* Established a "Single Source of Truth" with automated dbt tests for data quality.

### Phase 3 & 4: Exploratory Data Analysis (EDA)
Performed deep-dive analysis in Python to identify the "Leaky Bucket."
- **Insight:** Mobile users had a 15% lower conversion rate than desktop users.
- **Visuals:** Funnel charts and retention heatmaps.

### Phase 5: Machine Learning (Churn Prediction)
Built a **Random Forest Classifier** to predict which users are likely to quit the platform.
- **Features:** Total activity, subscription plan, and simulation progress.
- **Result:** Achieved 95% accuracy in identifying high-risk users.

### Phase 6 & 7: Behavioral Analytics (Amplitude)
Used **Amplitude Pathfinder** to map real user journeys.
- **Discovery:** Identified a "confusion loop" at the subscription paywall where users repeatedly navigated back to results without purchasing.

### Phase 8: PM Command Center (Streamlit App)
Developed a web application that allows Product Managers to:
1. Search for a specific `user_id`.
2. See a real-time **Churn Risk Score**.
3. View a behavioral timeline to understand why the user is at risk.

---

## 📈 Strategic Recommendations (The PM Shift)
Based on the data, I proposed a **"Value-First" Pricing Redesign**:
- **Proposed Feature:** A "Guaranteed Savings" badge showing the user exactly how much aid they are eligible for before the paywall.
- **Expected Impact:** A 50% increase in conversion (from 8% to 12%) based on A/B test simulations.

---

## 🛠️ How to Run
1. **dbt:** `dbt run` and `dbt test` within the `dbt_project` folder.
2. **Streamlit:** Run `streamlit run app.py` (ensure `model.pkl` and BigQuery credentials are present).
3. **Notebooks:** Check the `notebooks/` folder for the full EDA and ML training process.

---
