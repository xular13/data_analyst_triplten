# Project Description

**DATASETS**

- [instacart_orders.csv](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/instacart_orders.csv)
- [products.csv](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/products.csv)
- [order_products.csv](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/order_products.csv)
- [aisles.csv](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/aisles.csv)
- [departments.csv](https://practicum-content.s3.us-west-1.amazonaws.com/datasets/departments.csv)

Congratulations, you’ve completed the sprint on EDA! It’s time to apply the knowledge and skills you’ve acquired to an analytical case study.

When you’ve finished the project, send your work to the project reviewer on the platform for assessment. They’ll give you feedback within 24 hours. Use their feedback to make changes, and then send the new version back to the project reviewer.

You may get more feedback on the new version. This is completely normal. It’s not uncommon to go through several cycles of feedback and revision.

Your project will be considered complete as soon as the project reviewer approves it.

## Project description

For this project, you’ll work with data from Instacart.

Instacart is a grocery delivery platform where customers can place a grocery order and have it delivered to them, similar to how Uber Eats and Door Dash work. This particular dataset was [publicly released](https://tech.instacart.com/3-million-instacart-orders-open-sourced-d40d29ead6f2) by Instacart in 2017 for a [Kaggle competition](https://www.kaggle.com/c/instacart-market-basket-analysis/overview). Although the original dataset is no longer available on the Instacart website, we’ve created CSV files that contain a modified version of that data. Download these files and use them for your project.

The dataset we've provided for you has been modified from the original. We've reduced the size of the dataset so that your calculations run faster and we’ve introduced missing and duplicate values. We were also careful to preserve the distributions of the original data when we made our changes.

Your mission is to clean up the data and prepare a report that gives insight into the shopping habits of Instacart customers. After answering each question, write a brief explanation of your results in a markdown cell of your Jupyter notebook.

This project will require you to make plots that communicate your results. Make sure that any plots you create have a title, labeled axes, and a legend if necessary; and include `plt.show()` at the end of each cell with a plot.

For more tips about the project, check out this video:
[![EDA Project](https://img.youtube.com/vi/AsTjuzxq3r8/0.jpg)](https://www.youtube.com/watch?v=AsTjuzxq3r8)

## Data dictionary

There are five tables in the dataset, and you’ll need to use all of them to do your data preprocessing and EDA. Below is a data dictionary that lists the columns in each table and describes that data that hold.

- **instacart_orders.csv**: each row corresponds to one order on the Instacart app

  - `order_id`: ID number that uniquely identifies each order
  - `user_id`: ID number that uniquely identifies each customer account
  - `order_number`: the number of times this customer has placed an order
  - `order_dow`: day of the week that the order placed (which day is 0 is uncertain)
  - `order_hour_of_day`: hour of the day that the order was placed
  - `days_since_prior_order`: number of days since this customer placed their previous order

- **products.csv**: each row corresponds to a unique product that customers can buy

  - `product_id`: ID number that uniquely identifies each product
  - `product_name`: name of the product
  - `aisle_id`: ID number that uniquely identifies each grocery aisle category
  - `department_id`: ID number that uniquely identifies each grocery department category

- **order_products.csv**: each row corresponds to one item placed in an order

  - `order_id`: ID number that uniquely identifies each order
  - `product_id`: ID number that uniquely identifies each product
  - `add_to_cart_order`: the sequential order in which each item was placed in the cart
  - `reordered`: 0 if the customer has never ordered this product before, 1 if they have

- **aisles.csv**

  - `aisle_id`: ID number that uniquely identifies each grocery aisle category
  - `aisle`: name of the aisle

- **departments.csv**
  - `department_id`: ID number that uniquely identifies each grocery department category
  - `department`: name of the department

## Instructions for completing the project

**Step 1:** Open the data files (`/datasets/instacart_orders.csv`, `/datasets/products.csv`, `/datasets/aisles.csv`, `/datasets/departments.csv`, and `/datasets/order_products.csv`) and have a look at the general contents of each table. Note that the files have nonstandard formatting, so you'll need to set certain arguments in `pd.read_csv()` to read the data correctly. Take a look at the CSV files to get a sense of what those arguments should be.

Note that `order_products.csv` contains **many** rows of data. When a DataFrame has too many rows, `info()` will not print the non-null counts by default. If you want to to print the non-null counts, include `show_counts=True` when you call `info()`.

**Step 2:** Preprocess the data by doing the following:

- Verify and fix data types (e.g. make sure ID columns are integers)
- Identify and fill in missing values
- Identify and remove duplicate values

Be sure to explain what types of missing and duplicate values you found, how you filled or removed them, why you used those methods, and why you think these missing and duplicate values may have been present in the dataset.

**Step 3:** Once the data is processed and ready for analysis, perform the following analysis:

**[A] Easy (must complete all to pass)**

1. Verify that values in the `order_hour_of_day` and `order_dow` columns in the `orders` table are sensible (i.e. `order_hour_of_day` ranges from 0 to 23 and `order_dow` ranges from 0 to 6).
2. Create a plot that shows how many people place orders for each hour of the day.
3. Create a plot that shows what day of the week people shop for groceries.
4. Create a plot that shows how long people wait until placing their next order, and comment on the minimum and maximum values.

**[B] Medium (must complete all to pass)**

1. Is there a difference in `order_hour_of_day` distributions on Wednesdays and Saturdays? Plot the histograms for both days on the same plot and describe the differences that you see.
2. Plot the distribution for the number of orders that customers place (e.g. how many customers placed only 1 order, how many placed only 2, how many only 3, and so on…)
3. What are the top 20 products that are ordered most frequently (display their id and name)?

**[C] Hard (must complete at least two to pass)**

1. How many items do people typically buy in one order? What does the distribution look like?
2. What are the top 20 items that are reordered most frequently (display their names and product IDs)?
3. For each product, what proportion of its orders are reorders (create a table with columns for the product ID, product name, and reorder proportion)?
4. For each customer, what proportion of their products ordered are reorders?
5. What are the top 20 items that people put in their carts first (display the product IDs, product names, and number of times they were the first item added to the cart)?
