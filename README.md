# BrightTV Viewership Analysis

> ## Understanding User Behaviour & Growth Opportunities prepared for the CEO
> ----

## 📌 Overview of the Case Study

BrightTV is a streaming/TV platform looking to grow its subscription base. As the data analyst, the brief was to:

1. Profile **who** is watching, **where** they live, and **when** they watch.
2. Identify **what drives consumption** (channels, time-of-day, demographics).
3. Diagnose **low-consumption days** and propose content fixes.
4. Recommend **growth initiatives** to expand the subscriber base and lift ARPU.

The dataset covered **session-level viewership from January – April 2016** across **21 channels**, totalling **10,000 sessions** from **4,386 unique viewers** (~1,523 viewing hours).

---

## 🛠️ Tools Used

| Stage | Tool | Purpose |
|-------|------|---------|
| **Planning** | **Miro — Flowchart** | Mapped the end-to-end analytics workflow (raw data → cleaning → modelling → insights → reporting). |
| **Planning** | **Miro — Gantt Chart** | Project timeline, task ownership, and milestone tracking across the 1-week schedule. |
| **Data Ingestion** | **Excel → CSV** | Source workbook exported to CSV for ingestion into the ETL pipeline. |
| **ETL / Data Processing** | **SQL** | Cleaning (null handling, duplicates, formatting) and feature engineering (`Age_Bucket`, `Time_Bucket`, `Duration_Bucket`, `Day_Classification`). |
| **Storage** | **Databricks (Lakehouse)** | Centralised storage for cleaned and modelled tables consumed by analytics. |
| **Exploratory Analysis** | **Microsoft Excel/ Power BI** | Pivot tables for cross-tab analysis (age × time, province × channel, etc.). |
| **Dashboarding** | **Microsoft Excel | Interactive dashboard with filters/slicers for stakeholder exploration. |
| **Reporting** | **Microsoft PowerPoint** | Executive case-study deck for the CEO (`BrightTV_Presentation.pptx`). |
| **Publishing** | **GitHub** | Repository with README, diagrams, SQL scripts, dashboard, and deck. |

---

## 🏗️ Architecture & Data Flow

The end-to-end pipeline: **Excel → CSV → SQL ETL → Databricks → Power BI/ PowerPoint → GitHub**.

![Architecture Diagram](BrightTV_Architecture_Diagram.png)

### Column-Level Data Flow

How each raw column from the source Excel was transformed into analytical features:

![Column Data Flow](BrightTV_Column_DataFlow.png)

| Raw Column | Transformation | Output Feature / Insight |
|---|---|---|
| `UserID` | Distinct count | Unique viewers (4,386) |
| `Time` | `CASE` bucketing | `Time_Bucket` (Morning / Afternoon / Evening / Night) |
| `Day_Name` | Weekday vs. weekend | `Day_Classification` + day-of-week trend |
| `Age` | Range bucketing | `Age_Bucket` (Kids → Pensioner) |
| `Gender` | Aggregation | Demographic split (M / F / Unknown) |
| `Province` | Aggregation + ranking | Geographic concentration (Gauteng dominance) |
| `Channel` | Aggregation + ranking | Top channels (sport + music) |
| `duration` | Seconds → minutes, bucketing | `Duration_Bucket` (<5, 5–30, 30+ min) |

---

## 🗓️ Project Timeline (1 Week)

The case study was executed across five phases over a single week:

![Gantt Chart](BrightTV_Gantt_Chart.png)

1. **Planning** — Miro flowchart + Gantt
2. **Data Processing** — SQL cleaning & feature engineering in Databricks
3. **Analysis** — Excel pivots + Power BI modelling
4. **Presentation** — PowerPoint CEO deck
5. **Publishing** — README + GitHub repository upload

---

##  How I Did the Case Study

### 1. Planning (Miro)
Built a **flowchart** of the data pipeline and a **Gantt chart** to schedule the 1-week workstream.

### 2. Data Processing (SQL on Databricks)
- **Cleaning:** removed duplicate sessions, handled NULL gender/province values, standardised timestamps and durations.
- **Feature engineering:**
  - `Age_Bucket` → Kids, Youth, Young Adults, Adults, Matured, Pensioner, Old.
  - `Time_Bucket` → Early Morning, Morning, Late Morning, Afternoon, Evening, Night.
  - `Duration_Bucket` → 30 min, 1 hr, 2h30m, 4h30, 5h+.
- **Aggregation:** rolled session data up by user, channel, day, province for downstream analysis.

### 3. Exploratory Analysis (Excel)
Pivoted the data across **age, gender, province, channel, day-of-week, and time-of-day**, cross-tabulating dimensions to surface behavioural patterns.

### 4. Dashboarding (Power BI)
Interactive dashboard with slicers for **province, age group, gender, and channel** — KPI cards, bar/column charts, province map, and day-of-week trend line.

### 5. Reporting (PowerPoint)
Synthesised everything into a **CEO-ready deck**: dataset → user trends → consumption drivers → low-day fixes → growth initiatives → summary.

---

## 📊 Dataset Overview

| Metric | Value |
|---|---|
| Sessions analysed | **10,000** |
| Unique viewers | **4,386** |
| Channels | **21** |
| Total viewing hours | **1,523** |
| Average session length | **9.1 min** |
| Period | Jan – Apr 2016 |

> **Short-form viewing dominates** — 92% of sessions end within 30 minutes.

---

## Key Insights Found

### 1. Who Is Watching — Heavily Skewed Audience
- **Gender:** Male **8,761** · Female **977** · Unknown **262** → only **~9% female**.
- **Age:** Young Adults **4,148 (41%)** and Adults **2,635 (26%)** dominate.
- The base is **young, male, and concentrated** — repeatable, but narrow.

### 2. Where Viewers Live — Metro-Concentrated
- **Gauteng** alone = **37%** of sessions.
- Gauteng + Western Cape + KZN = **~65%** of viewing.
- Northern Cape, Free State, North West combined = **<9%** — major untapped territory.

### 3. When They Watch — Weekly & Daily Rhythm
- **Friday** peak (1,675); **Monday** trough (957) — Monday is **43% below Friday**.
- **Afternoon + Night** generate **~50%** of all sessions.

### 4. What Drives Consumption
- **Live sport** (SuperSport Live, ICC Cricket, SS Blitz) + **music** (Channel O, Trace TV) = **~60%** of viewing.
- Young adults + males in metro provinces = **83%** of the active base.

### 5. Low-Consumption Days — Content Fixes
- Monday-night re-runs of weekend SuperSport & cricket classics.
- Kids prime-time block (Cartoon Network / Boomerang) after-school.
- Music takeover Tuesdays (Channel O / Trace).
- Telenovela bingeing (Africa Magic) in morning low-traffic windows.

---

## Growth Recommendations (CVM Initiatives)

1. **Win female viewers** — only 9% of sessions are female; launch lifestyle / telenovela bundles.
2. **Crack non-metro provinces** — data-light streaming bundles via mobile partnerships.
3. **Long-form retention** — push series & sport packages to lift average watch time beyond 30 min.
4. **Referral & family plans** — convert young-adult metro users into household subscriptions.
5. **Sport tent-pole calendar** — pre-emptive marketing around cricket & football events.
6. **Re-engage Mondays** — loyalty rewards & exclusive premieres on the weakest day.

---

## ✅ Summary — What Was Done & What Was Found

**What was done:**
- Planned the project in **Miro** (flowchart + Gantt).
- Ingested Excel → CSV and processed 10,000 sessions through a **SQL ETL pipeline on Databricks**.
- Explored and pivoted the data in **Excel**.
- Built an interactive **Power BI** dashboard.
- Delivered a CEO-ready **PowerPoint** case study.
- Published the full project to **GitHub**.

**What was found — A focused, data-led path to subscription growth:**
- **Defend the core:** live sport + music for young metro males.
- **Expand the base:** women, rural provinces, and family households.
- **Lift watch time:** long-form bundles to break the 30-minute ceiling.
- **Smooth the week:** programming + rewards to lift Mondays.
