# Walmart Sales Data Analysis

**An end-to-end data analysis solution designed to extract critical business insights from Walmart sales data using Python and SQL.**

## Project Overview

This project analyzes Walmart sales data using Python and MySQL to extract business insights. It covers data cleaning, feature engineering, SQL querying, and visualization.

## Project Pipeline

1. **Environment Setup**: Use VS Code, Python, and MySQL.
2. **Data Download**: Manually download Walmart sales data from Kaggle and store it in the `data/` folder.
3. **Data Processing**: 
  - Install required libraries (`pandas`, `numpy`, `sqlalchemy`, etc.)
  - Load data into Pandas and perform exploratory analysis.
4. **Data Cleaning**: 
  - Remove duplicates
  - Handle missing values
  - Fix data types
  - Format currency.
5. **Feature Engineering**: Create new columns like Total Amount for analysis.
6. **Database Integration**: Load cleaned data into MySQL using SQLAlchemy.
7. **SQL Analysis**: Execute complex queries to analyze revenue trends, sales performance, best-selling categories, and customer behavior.
8. **Project Documentation & Publishing**: Publish the project on GitHub with a `requirements.txt` file.

## Requirements

- **Python**: 3.8+
- **Database**: MySQL
- **Libraries**: `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`

## Results & Insights

- **Sales Insights**: Identify key categories, top-performing branches, and preferred payment methods.
- **Profitability**: Analyze the most profitable products and locations.
- **Customer Behavior**: Understand trends in ratings, payment preferences, and peak shopping hours.