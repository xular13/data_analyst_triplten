# Storytelling with Data: Project

What is causing the high number of returned orders at the Superstore? In this project, we will be preparing an analysis for the CEO of the Superstore to help them understand what is causing customers to return their orders and how to reduce the volume of returned orders.

## 1. What is Causing Returns?

In this section, we will be building worksheets analyzing different views on return rates.

HINT: Make sure the `Returns` table is LEFT JOIN’ed onto the `Orders` table. You should see both “Yes” _and_ “null” values in the `Returned` column.

1. Make the `Returned` field into a calculated field where the null values are `0` and the `Yes` values are `1`. Note that the average of this field is the _return rate_, while the _total returns_ are the count or sum of returns.
2. Now, let’s try to find some root causes for returned orders. Build at least one worksheet for each of the following:
   1. A scatterplot showing the correlation between total sales and total returns. Aggregate by product subcategory. Do sales always correlate positively with returns?
   2. A bar chart showing the return rate by product category.
   3. The return rate by customer. To find customers who are more prone to making returns, add a filter to remove customers with only 1 order.
   4. A map showing the return rate by some geographic measure (state, city, etc.) to see if there is a geographic concentration to returned orders.
   5. The return rate by some measure of time (month, week, etc.) to see if there is a seasonal effect to returned orders.
   6. Two different kinds of composite charts showing the return rate for a mix of multiple factors (date/geography/product category/etc.).
3. In the next section, you will be making a dashboard showing your findings. Document the requirements for the design of a dashboard to get the salient features you found in this analysis.

## 2. Building a Dashboard for Monitoring Returns

In this section:

1. Create a low-fidelity mock-up of your dashboard.
   - Make at least 3 variations of pen-and-paper sketches.
   - Scan or take photos of them to submit.
   - Choose your favorite option: This is the one you'll be making in Tableau.
2. Create a template for the dashboard using empty containers to match your mock-ups.
   - Take a screenshot… You'll submit this along with the rest of the project files.
3. Add your worksheets to the dashboard template.
   - Finalize the dashboards with relevant markers, images, and titles as needed. Submit your mock-up, template, and finalized dashboard.

## 3. Presenting Your Analysis and Dashboard

1. Construct your story arc for your presentation:
   1. Create a draft of your story **using only captions** for each Story Point. Create a duplicate of your draft story (captions only) to submit. The draft Story should include:
      - A summary of your analysis of returns
        - How should returns be measured? Is the return rate, the total cost of returns, or the total number of returns a better measure? When is one better than the other?
        - What are the key root causes of returns?
      - An overview of each component of your Dashboard
        - Explain what is contained in each chart and how the chart should be interpreted.
      - A demonstration of how the Dashboard should be used
        - Demonstrate how to interpret the Dashboard and how to use filters to identify root causes.
        - Describe actions that can be taken after using the Dashboard to identify the root causes.
      - A conclusion with proposed next steps (e.g., implementation of Dashboard).
2. Add content to your Story Points:
   - Use the worksheets you already created and create new worksheets you might need to support your Story Arc.
   - Construct Dashboards to create presentation-style slides.
   - Save a version of your completed Tableau Story.
3. Deliver your presentation:
   - Prepare a **3 to 5 minute presentation of your Tableau Story**.
   - You can either use screen recording software to record a 3 to 5 minute presentation of your Tableau Story or submit the presentation in PDF format.
