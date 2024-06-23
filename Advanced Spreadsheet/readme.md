# Advanced Spreadsheets: Project

You’ve been hired by a consulting company and your task is to help a client analyze the vacation rental market in the Manhattan borough of New York City. The client is interested in investing in several properties but would like some guidance on what types of properties they should be targeting. Your role in the project is to analyze data collected on current Airbnb listings to identify useful insights.

## Part 1 - Explore and filter the data

You can download a copy of the NYC Airbnb dataset using this link: [nyc_airbnb_data](https://docs.google.com/spreadsheets/d/1hDhvD2rLWqTIpC-VM7UiGY5KNV7zBgNqXSTKkg4frL4/edit#gid=1221840239)

Spend 15 minutes reviewing each of the sheets in the spreadsheet (e.g., _data_dictionary_, _listings_, and _calendar_) and get familiar with the data. Search for columns that have useful information and start to identify potential data cleaning challenges.

**Prepare tabs for documentation**

As you revise your analysis and clean your data, it’s important to keep a history of the work you complete. Add a tab for documenting the data cleaning steps and the different versions/updates of your Final Project file.

**Organize the spreadsheet**

- Freeze rows and columns to make scrolling through data easier.
- Resize column widths and wrap text when appropriate.
- Add filters.

**Filter listings**

Many of the listings in the raw data set may not be relevant to your analysis. For example, if a listing has never been rented, should it be included in the analysis?

- Before you start filtering listings, make sure to create a copy of the raw data to keep as a reference.
- Document all the rows you remove so that the client can understand the data cleaning steps you take.
- Airbnb has some listings for longer-term rentals. Since this analysis is focused on vacation rentals, only rentals with a minimum night requirement of 7 days or fewer would be applicable.
- Listings with no reviews from the last 12 months are most likely inactive.

## Part 2 - Which type of properties should be targeted?

There are so many potential vacation rental properties in New York City that it can be overwhelming to determine where to start searching. Your client would like help prioritizing where they should be focusing their research.

**Hint for estimating rental activity**

For analyzing listings, it would be ideal to know how many days each property has been rented. However, this information isn’t published on the Airbnb website.

Since a listing can only receive a review if it has been rented, reviews are a pretty good estimate of how frequently an Airbnb property is rented. Let’s assume `number_of_reviews_ltm` (reviews in the last 12 months) is the best estimate of how often a listing is rented.

- **Which neighborhoods are most attractive for vacation rentals?**
    - Before you can analyze the neighborhood data, you’ll need to clean the data labels:
        - The neighborhood column has an inconsistent mix of uppercase, lowercase, and mixed-case text (e.g., West Village, WEST VILLAGE, west village).
        - Some neighborhoods have an extra space at the end of the text (e.g., “Harlem”, “Harlem “).
        - Create a new column called `neighborhood_clean` that standardizes the capitalization and removes any trailing spaces at the end of the text using text functions.
    - Build a pivot table to determine the top 10 most popular neighborhoods for vacation rentals:
        - Which neighborhoods had the most reviews during the last 12 months?
        - These top neighborhoods will be the focus for the rest of your analysis.

- **Which size properties (i.e., how many bedrooms) are most popular for vacation rentals?**
    - The bedrooms column in the Airbnb listings has a large number of empty cells. The empty cells represent listings with zero bedrooms (i.e., studio apartments). Create a new column called `bedrooms_clean` and use a formula to substitute the empty cells with zeros.
    - Build a pivot table to determine the number of bedrooms that are most popular for rentals.
    - Do different neighborhoods have different preferences for property sizes? Update the pivot table so you can recommend specific property sizes for each of the top 10 neighborhoods.
    - Once the optimal apartment size for a vacation rental is determined, the rest of the project can focus on listings that match your recommendation.
    - **Hint:** Evaluate some of the advanced options for aggregation functions for your pivot table and maybe even add some conditional formatting.

## Part 3 - Calculating occupancy

The Airbnb data set has a _calendar_ sheet with each listing’s availability for 30 days. Since there is a separate row for each combination of listing and date, we’ll need to aggregate the data in a pivot table to calculate the occupancy rate (% of nights that are occupied).

To prepare the data for aggregation in pivot tables, we’ll need to do some data cleaning:

- Calculating occupancy requires the `available` column (which has `t` for True and `f` for False) to be converted into a numeric value. Create a new column called `occupied` where the values are `0` and `1`, respectively, for `t` and `f` (Note: You can either use a formula or copy the column and use _Find and Replace_).
- Your client is interested in understanding whether weekends or weekdays are more popular with guests. You’ll need to add a new column called `day_of_week` and utilize the `WEEKDAY()` function and the `date` column.
- **Optional Challenge:** The `WEEKDAY()` function only returns a number between 1 and 7 that corresponds to Sun-Sat. To make `day_of_week` more readable, you can utilize the `CHOOSE()` formula and some smart formula googling to figure out how to substitute text for numbers.

**What’s the average occupancy for each listing?**
- Create a new pivot table using the clean calendar data. In the _Values_ section of your pivot table, calculate the `AVERAGE()` of the `occupied` column (which has 1s and 0s). This is a useful little trick that will help you find the occupancy percentage. Here’s an explanation of how it works:
    - When you calculate the `SUM()` of the `occupied` column, the value you receive is the same as the count of days that listings were occupied (e.g., if three days are occupied and two days are available, the calculation would be 1+1+1+0+0 = 3).
    - The average of the `occupied` column is the `SUM()` (count of days that were occupied) divided by the total number of rows (total number of days), which is the percent of days that are occupied (e.g., if three days are occupied and two days are available, the calculation would be (1+1+1+0+0)/5 = 60%).
- Update your pivot table by adding the `listing_id` for rows and the average of `occupied` for values. You’ll have the average occupancy rate for each listing.
- **Note**: We’re preparing this data to use in a later stage of the project.

**What’s the average occupancy for each listing?**

- Create another new pivot table using the clean calendar data, add `day_of_week` to your pivot table, and calculate the average occupancy rate for each day separately.
- Create a bar chart to show how average occupancy changes based on the day of the week.

## Part 4 - Estimate revenue for an investment property

Estimating annual revenue requires a representative sample of properties that are similar to the type of property an investor might purchase (e.g., actively rented properties or properties with good reviews).

- Filter only properties that are representative of what the investor might purchase.
    - Superhosts or properties with high review ratings
    - Properties being very actively rented over the last 12 months
    - Super luxury or extremely low-priced listings filtered out

Choose one of the top five neighborhoods and the corresponding property size (e.g., the optimal number of bedrooms you’ve determined from Part 2 of the project) that you’d like to recommend to your investor. To estimate annual revenue, you’ll need to calculate the average price and occupancy rates for a representative sample of listings.

- Add occupancy rates for each property to the _listings_ sheet:
    - Use a `VLOOKUP()` formula to add the average occupancy rate for each listing (from the pivot table you created in Part 3) to the listings tab.
- Create a new pivot table to calculate the average price and occupancy rate for the neighborhood and the number of bedrooms you’ve identified as a good investment.
- If you can calculate the average price and occupancy rate for a property, you can generate an estimate for annual revenue:
    - Price: $300
    - Occupancy Rate: 80%
    - Annual Revenue: 365 days * $300 * 80% = $87,600
- Include the estimated annual income you calculated in your recommendations to the investor. Be sure to document your assumptions so your client can understand how you calculated the estimate.

## Part 5 - (Optional) What attributes are important for a vacation rental?

For the top neighborhoods, your investor would like some insight into what features and attributes might impact how well a property will perform.

- Can superhosts charge higher prices?
- Do hosts that offer instant booking have higher occupancy rates?
- Do buildings with doormen get better review scores for check-in? (harder challenge)
    - There is an `amenities` column that has a long text string with all the different attributes for the property (e.g., microwave, window AC unit, etc.).
    - To identify whether a property has a doorman, you’ll need to construct a formula that returns a True/False value based on whether or not “Building staff” is anywhere in the `amenities` column.
- Can hosts charge higher prices for higher review ratings? (harder challenge)
    - There are many approaches to answering this question, and it’s easy to start down the wrong path and have to restart with a new approach. However, the amount you learn is a reflection of the time you invest.
    - One approach is rounding rating scores to the nearest tenth of a point. This will allow you to convert data that is on a continuous scale to discrete data points that can be used to group properties for a pivot table. For example, instead of having separate groups for properties with review scores of 4.78, 4.81, and 4.82, they will all be grouped as 4.8.

## Part 6 - Documentation and spreadsheet formatting

Organize and document your spreadsheet so it’s polished, professional, and ready to send to your client.

- Create an _Executive Summary_ sheet with an overview of your recommendations and a _Table of Contents_ to easily navigate the spreadsheet tabs.
- Make sure all of the data cleaning steps you’ve completed are documented (especially scenarios where you have deleted rows or used _Find and Replace_).
- Review your spreadsheet to make sure any assumptions in your analysis are clearly documented. For example:
    - Super luxury listings with prices greater than $XXX were filtered from the analysis.
    - Reviews during the last twelve months were used as an estimate for how often a listing was rented in the last year.
    - Properties with fewer than X reviews in the last twelve months were considered inactive rentals.
- Add formats to make your spreadsheet more readable:
    - Use your best judgment on how much formatting adds value without investing too much time (you can spend hours upon hours adjusting formats).
    - Add borders and format cell background colors (but make sure you’re consistent with those colors).
    - Standardize font styles and sizes.
    - Hide unnecessary columns.




