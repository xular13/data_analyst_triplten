# Objectives

* Identify trends in revenue and profit over time.
* Predict future revenue and profit using time-series forecasting techniques.
* Uncover the most profitable categories, segments, regions, and countries.
* Investigate the impact of seasonality and yearly trends on profit margins.

## 2 Methodology

### 2.1 Data Preparation

#### 1. Data Collection:
* Identify and gather data from all relevant tables within your database.
* Specify the date ranges for your analysis.

#### 2. Data Cleaning:
* Examine data quality - address missing values, inconsistencies, and outliers.
* Transform and format the data as needed for analysis (e.g., calculate derived fields).

### 2.2 Exploratory Analysis

#### 3. Descriptive Statistics:
* Calculate summary statistics (mean, median, standard deviation) for revenue, profit, margins, and other relevant variables.

#### 4. Visualization:
Create visualizations to uncover patterns and relationships:
* Line charts for revenue and profit trends.
* Bar charts for comparing profitability across categories, segments, etc.
* Scatterplots to explore potential correlations.

### 2.3 In-Depth Analysis

#### 5. Trend Analysis:
* Calculate profit: `fact sales montly.sold.quantity * fact gross price.gross price * fact pre discount.pre invoice discount pct - fact sales montly.sold.quantity* fact manufacturing cost.manufacturing cost`
* Analyze the trends for seasonality or other cyclical patterns for profit and revenue.

#### 6. Profitability Analysis:
* Calculate margin: `fact sales montly.sold.quantity * fact gross price.gross price - fact sales montly.sold.quantity* fact manufacturing cost.manufacturing cost`
* Isolate the most profitable categories, segments, regions, and countries. Consider Pareto analysis for prioritization.
* Examine margin fluctuation over time (due to seasonality or year-on-year change).

#### 7. Correlation Analysis:
* Calculate correlation coefficients to explore potential relationships between revenue, profit, and other related variables.

### 2.4 Predictive Modeling

#### 8. Model Selection:
* Research suitable time-series forecasting models (e.g., ARIMA, SARIMA, Prophet, LSTM).

#### 9. Model Development and Training:
* Divide your data into training, validation and testing sets.
* Train the selected models on the training set.

#### 10. Model Evaluation:
* Evaluate models performance on the validation set using metrics like MAE, RMSE, or MAPE.
* Iterate on model selection and tuning to optimize accuracy.
* Choose the best model.

## Tools

* Python, SQL, Tableau


# Database Documentation

Please find the description of all of the tables in the database below.

1. **dim_customer** - contains customer-related data

| column        | column description                                                                   | parameters                                            | dtype  | connections with other tables                                                                                                                                            | Note                                                                                                                                        |
| ------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| customer_code | unique identifier of Customer. Is assigned depending on platform, channel and market | Ex: 90026205                                          | int64  | 1. fact_pre_discount (dim_customer.customer_code=fact_pre_discount.customer_code)<br>2. fact_sales_monthly (dim_customer.customer_code=fact_sales_monthly.customer_code) | One customer can have several customer_codes, since code is assigned to a customer based on the customer name, platform, channel and region |
| customer      | Company name of the customer                                                         | Ex: ‘Amazon ’                                         | string |                                                                                                                                                                          |                                                                                                                                             |
| platform      | platform, through which the sale’s been done                                         | 2 values:<br>'Brick & Mortar'<br>'E-Commerce'         | string |                                                                                                                                                                          | customer should have one platform                                                                                                           |
| channel       | channel of sale                                                                      | 3 values:<br>'Direct',<br>'Distributor'<br>'Retailer' | string |                                                                                                                                                                          | customer may have several channels                                                                                                          |
| market        | Country of the customer’s office                                                     | Ex: ‘Japan’                                           | string |                                                                                                                                                                          |                                                                                                                                             |
| sub_zone      | Abbreviation of the Region                                                           | Ex: ‘LATAM’                                           | string |                                                                                                                                                                          | For one market there should be one sub_zone                                                                                                 |
| region        | Region of the customer’s office                                                      | Ex: ‘ EU’                                             | string |                                                                                                                                                                          | For one market there should be one region                                                                                                   |

2. **dim_product** - contains product-related data

| column       | column description              | parameters                                                                                                         | dtype  | connections with other tables                                                                                                                                                                                                                                | Note                                                                                                                                        |
| ------------ | ------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- |
| product_code | unique identifier of product.   | Ex: A0118150101                                                                                                    | string | 1.fact_manufacturing_cost (dim_product.product_code=fact_manufacturing_cost.product_code)<br>2. fact_gross_price (fact_gross_price.product_code=dim_product.product_code)<br>3.fact_sales_monthly (fact_sales_monthly.product_code=dim_product.product_code) | One customer can have several customer_codes, since code is assigned to a customer based on the customer name, platform, channel and region |
| division     | Group of the product            | 3 values:<br>'P & A' - Peripherals and Accessories <br>'PC' - type of computer<br>'N & S' - Networking and Storage | string |                                                                                                                                                                                                                                                              |                                                                                                                                             |
| segment      | type of product ( sub-division) | 6 values:<br>'Peripherals', 'Accessories', 'Notebook', 'Desktop',<br>'Storage',<br>'Networking'                    | string |                                                                                                                                                                                                                                                              |                                                                                                                                             |
| category     | category of the product         | Ex: ‘Keyboard’                                                                                                     | string |                                                                                                                                                                                                                                                              |                                                                                                                                             |
| product      | Full product name               | Ex: ‘AQ MB Elite’                                                                                                  | string |                                                                                                                                                                                                                                                              |                                                                                                                                             |
| variant      | variant of the product          | Ex: ‘Standard Grey’                                                                                                | string |                                                                                                                                                                                                                                                              |                                                                                                                                             |

3. **fact_pre_discount** - contains pre-invoice deductions information for each product

| column                   | column description                           | parameters   | dtype   | connections with other tables                                                                                                                                           | Note |
| ------------------------ | -------------------------------------------- | ------------ | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- |
| customer_code            | unique identifier of Customer                | Ex: 90026205 | int64   | 1.dim_customer (dim_customer.customer_code=fact_pre_discount.customer_code)<br>2. fact_sales_monthly (fact_sales_monthly.customer_code=fact_pre_discount.customer_code) |      |
| fiscal_year              | Year when the discount was valid             | Ex: 2018     | int64   |                                                                                                                                                                         |      |
| pre_invoice_discount_pct | discount % per invoice for specific customer | Ex: 0.0824   | float64 |                                                                                                                                                                         |      |

4. **fact_manufacturing_cost** - contains the cost incurred in the production of each product

| column             | column description                    | parameters      | dtype   | connections with other tables                                                                                                                                                                                                                                             | Note |
| ------------------ | ------------------------------------- | --------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- |
| product_code       | unique identifier of product.         | Ex: A0118150101 | int64   | 1. dim_product (dim_product.product_code=fact_manufacturing_cost.product_code)<br>2. fact_gross_price (fact_manufacturing_cost.product_code=fact_gross_price.product_code)<br>3.fact_sales_monthly (fact_sales_monthly.product_code=fact_manufacturing_cost.product_code) |      |
| cost_year          | Year of production                    | Ex: 2018        | int64   |                                                                                                                                                                                                                                                                           |      |
| manufacturing_cost | cost of production of unit of product | Ex: 5.6036      | float64 |                                                                                                                                                                                                                                                                           |      |

5. **fact_gross_price** - contains gross price information for each product

| column       | column description            | parameters      | dtype   | connections with other tables                                                                                                                                                                                                                                      | Note |
| ------------ | ----------------------------- | --------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---- |
| product_code | unique identifier of product. | Ex: A0118150101 | int64   | 1. dim_product (dim_product.product_code=fact_gross_price.product_code)<br>2. fact_manufacturing_cost (fact_manufacturing_cost.product_code=fact_gross_price.product_code)<br>3.fact_sales_monthly (fact_sales_monthly.product_code=fact_gross_price.product_code) |      |
| fiscal_year  | Year of transaction           | Ex: 2018        | int64   |                                                                                                                                                                                                                                                                    |      |
| gross_price  | Final price for the product   | Ex: 15.3952     | float64 |                                                                                                                                                                                                                                                                    |      |

6. **fact_sales_monthly** - contains monthly sales data for each product.

| column        | column description                  | parameters      | dtype   | connections with other tables                                                                                                                                                                                                                                         | Note |
| ------------- | ----------------------------------- | --------------- | ------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---- |
| date          | Date of transaction                 |                 | str     |                                                                                                                                                                                                                                                                       |      |
| product_code  | unique identifier of product.       | Ex: A0118150101 | str     | 1. dim_product (dim_product.product_code=fact_sales_monthly.product_code)<br>2. fact_manufacturing_cost (fact_manufacturing_cost.product_code=fact_sales_monthly.product_code)<br>3. fact_gross_price (fact_sales_monthly.product_code=fact_gross_price.product_code) |      |
| customer_code | unique identifier of Customer       | Ex: 90026205    | float64 | 1.fact_pre_discount (fact_sales_monthly.customer_code=fact_pre_discount.customer_code)<br>2. dim_customer (dim_customer.customer_code=fact_sales_monthly.customer_code)                                                                                               |      |
| sold_quantity | sold items to customer on that date | Ex: 51.0        | float64 |                                                                                                                                                                                                                                                                       |      |
| fiscal_year   | Year of transaction                 | Ex: 2018        | float64 |                                                                                                                                                                                                                                                                       |      |
