# Walmart Data Analysis: End-to-End SQL + Python Project
# Project Overview

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis and PostgreSQL for advanced querying and business intelligence.

The project demonstrates structured problem-solving techniques to answer key business questions and is ideal for data analysts looking to develop skills in:

Data manipulation

SQL querying (PostgreSQL)

Data cleaning & transformation

Data pipeline creation

# Project Steps
# 1️⃣ Set Up the Environment

# Tools Used:

Visual Studio Code (VS Code)

Python

PostgreSQL

# Goal:
Create a structured workspace and organize project folders for smooth development and data handling.

# 2️⃣ Set Up Kaggle API

API Setup:

Obtain your Kaggle API token from your Kaggle profile settings.

Download the kaggle.json file.

# Configure Kaggle:

Place the downloaded kaggle.json file in your local .kaggle folder.

Use the command:

kaggle datasets download -d <dataset-path>
# 3️⃣ Download Walmart Sales Data

Data Source: Kaggle Walmart Sales Dataset

Storage: Save the dataset in the data/ folder for easy access.

# 4️⃣ Install Required Libraries and Load Data

Install required Python libraries:

pip install pandas numpy sqlalchemy psycopg2

Libraries Used:

pandas

numpy

sqlalchemy

psycopg2

Load the dataset into a Pandas DataFrame for initial analysis and transformation.

# 5️⃣ Explore the Data

Goal: Understand structure and detect issues.

Used:

.info()

.describe()

.head()

Null value checks

Data type inspection

# 6️⃣ Data Cleaning

Removed duplicate records

Handled missing values

Fixed inconsistent data types

Converted date columns to datetime format

Formatted currency values

Validated cleaned dataset

# 7️⃣ Feature Engineering

Created new calculated columns such as:

total_price = unit_price * quantity

This improved SQL aggregation and revenue analysis.

# 8️⃣ Load Data into PostgreSQL

Established PostgreSQL connection using SQLAlchemy

Created tables automatically

Inserted cleaned data into PostgreSQL

Verified successful loading using SQL queries

# 9️⃣ SQL Analysis – Business Problem Solving

Wrote and executed complex PostgreSQL queries to solve:

Revenue trends across branches and categories

Best-selling product categories

Sales performance by time, city, and payment method

Peak sales period analysis

Profit margin analysis by branch and category

Year-over-year revenue comparison using window functions

Advanced SQL concepts used:

CTEs

Window Functions (RANK, LAG)

Aggregations

Date functions

Joins

# 🔟 Project Publishing and Documentation

Published project on GitHub including:

README.md

Jupyter Notebooks

SQL query scripts

Instructions to download dataset

Requirements

Python 3.8+

PostgreSQL

Kaggle API Key

Python Libraries:

pandas

numpy

sqlalchemy

psycopg2

# Getting Started

1.Clone the repository:

git clone <repo-url>

2. Install dependencies:

pip install -r requirements.txt

3. Set up Kaggle API → Download dataset → Load into PostgreSQL → Run analysis.

# Project Structure
|-- data/                 
|-- sql_queries/          
|-- notebooks/            
|-- README.md             
|-- requirements.txt      
|-- main.py               


# Results and Insights
Sales Insights

Identified highest-performing branches

Ranked top revenue-generating categories

Analyzed preferred payment methods

Profitability

Determined most profitable categories

Compared branch-level profit performance

Customer Behavior

Identified peak shopping hours

Analyzed rating trends

Determined busiest transaction days

# Future Enhancements

Integration with Power BI or Tableau dashboards

Additional datasets for deeper insights

Automation of data pipeline for scheduled processing

# License

This project is licensed under the MIT License.

# Acknowledgments

Data Source: Kaggle Walmart Sales Dataset
Inspired by real-world retail business analytics use cases.
