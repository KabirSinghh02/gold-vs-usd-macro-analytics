# 📈 Gold vs. US Dollar: Macroeconomic Impact & Historical Analysis (2010–2026)

## 📌 Executive Project Summary
An end-to-end data engineering and interactive business intelligence project analyzing the 16-year historical relationship between **Gold Prices**, the **US Dollar Index (DXY)**, market volatility (**VIX**), **US Inflation Rates**, and **Federal Reserve Interest Rate** policies. 

This project bridges data extraction, Advanced SQL data warehousing & analytical querying, and dynamic Power BI dashboarding with interactive DAX narrative insights.

---

## 🛠️ Data Pipeline & Workflow

### 1. Data Cleaning & Transformation (Excel / Power Query)
* Cleaned multi-year macroeconomic time-series data, handled null values, and standardized date structures.
* Engineered a dedicated **Global World Events Dataset** to map key geopolitical and monetary policy crises (e.g., COVID-19, Russia-Ukraine War, FED Aggressive Hikes, US Banking Crisis, Inflation Surges).

### 2. Database Engineering & SQL Analysis (MySQL)
* Created and optimized `Gold_Project` database and relational tables.
* Cleaned raw date strings into standard SQL `DATE` format using `STR_TO_DATE()`.
* Performed deep-dive exploratory data analysis (EDA):
  * **Window Functions (`LAG()`):** Calculated daily gains/losses and day-over-day price velocity.
  * **Conditional Logic (`CASE WHEN`):** Segmented market regimes (High Panic vs. Normal Market via VIX > 25/35, Strong vs. Weak Dollar via DXY > 100, High vs. Low Interest Rate environments).
  * **Volatility Calculations:** Evaluated yearly percentage volatility ranges `((MAX - MIN) / MIN) * 100`.

---

## 📊 Dashboard Architecture & Interactive Features

The Power BI Dashboard features a **Dark Gold Executive Theme** divided across 3 specialized report pages:

### 1️⃣ Page 1: Global Impact Analysis
* **Core Battle Line Chart:** Gold Price vs. Dollar Index historical trend overlay (2010–2026).
* **Global Event Slicers:** Interactive multi-select event buttons (Brexit, COVID-19, Middle East Conflict, Taper Tantrum, etc.).
* **Dynamic DAX Narrative Insights:** Real-time updating textual market commentary that recalculates based on selected event slicers to explain exact macro impacts.

### 2️⃣ Page 2: Economic Drivers (Inflation & Volatility)
* **Market Fear Gauge:** Correlation scatter plots and trendlines between Gold Price and VIX Index spikes.
* **Inflation Impact:** Dual-axis visualization comparing Gold price movements against US Inflation Rate points.

### 3️⃣ Page 3: FED & Market Performance
* **Monetary Policy Analysis:** Historical Gold price growth plotted against Federal Reserve interest rate hike/cut cycles.
* **Regime Comparison:** Detailed breakdown of Zero-Interest Rate Policies (ZIRP) vs. Aggressive Rate Hike environments.

---

## 🔑 Key Strategic Insights
* **Inverse Correlation:** Strong Dollar regimes ($DXY > 100$) historical pressure on Gold, while VIX spikes ($VIX > 25$) consistently drive safe-haven demand toward Gold.
* **Peak Valuation:** Gold reached a record high of **$5.4K** within the analyzed timeframe against an average of **$1.71K**.
* **FED Policy Sensitivity:** Aggressive rate hikes initially slow momentum, but long-term inflationary pressures override rate impacts.

---

## 💻 Tech Stack & Tools
* **Database & Querying:** MySQL Workbench (DDL, DML, Window Functions, Aggregate Queries, CASE Statements)
* **Data Transformation:** Microsoft Excel, Power Query
* **Business Intelligence:** Power BI Desktop (DAX Expressions, Custom Tooltips, Dynamic Text Narratives, Interactive Slicers)
* **Version Control:** Git & GitHub

---

## 🗂️ SQL Query Samples

```sql
-- 1. Daily Gain/Loss Velocity using LAG Window Function
SELECT 
    Date, 
    GOLD_PRICE,
    LAG(GOLD_PRICE) OVER (ORDER BY Date) AS Previous_Day_Price,
    ROUND(GOLD_PRICE - LAG(GOLD_PRICE) OVER (ORDER BY Date), 2) AS Daily_Gain
FROM Gold_Analysis
ORDER BY Daily_Gain DESC
LIMIT 10;

-- 2. Market Panic & Regime Segmentation
SELECT 
    CASE 
        WHEN VIX > 25 THEN 'High Panic' 
        ELSE 'Normal Market' 
    END AS Market_Mood,
    ROUND(AVG(GOLD_PRICE), 2) AS Avg_Gold
FROM Gold_Analysis
GROUP BY Market_Mood;
