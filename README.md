# Customer Behavior Analytics

An end-to-end analysis of 3,900 retail customers using **Python, MySQL and Power BI**, built to understand what shopping behaviors are linked to customer loyalty and repeat purchases.

<img width="912" height="510" alt="image" src="https://github.com/user-attachments/assets/4ac5a1bc-c251-42bd-98a5-645dcd117fb1" />

---

## Problem Statement

A fashion & apparel retailer runs both online and in-store operations across multiple locations and product categories. While overall sales are steady, the company has noticed that customer loyalty varies widely — some customers purchase frequently and consistently, while a large share buy once and never return. Leadership suspects this gap is tied to *how* customers shop rather than *what* they buy: their preferred payment method, shipping choice, whether they used a discount, and the season they shopped in.

The retention and marketing teams want to move from broad, one-size-fits-all promotions toward targeted retention strategies — identifying which customer segments are most likely to churn after one purchase, which shopping behaviors correlate with becoming a loyal repeat buyer, and which locations, seasons, or product categories deserve focused marketing spend.

You are tasked with analyzing the customer shopping dataset to answer:

**What shopping behaviors and preferences distinguish loyal, repeat customers from one-time buyers, and how can this be used to design targeted retention and marketing strategies?**


**Dataset**

- Public customer shopping behavior dataset (Kaggle)
- 3,900 rows, 18 columns
- Columns include age, gender, item and category purchased, purchase amount (USD), location, season, review rating, subscription status, shipping type, discount applied, previous purchases, payment method, and purchase frequency

---

**Tools Used**

| Tool | Used for |
|---|---|
| Python (pandas, Jupyter) | Data cleaning and feature engineering |
| MySQL | Business analysis with SQL queries |
| Power BI | Interactive dashboard (KPI cards, charts, slicers) |

---

**Project Steps**

### 1. Python: data cleaning and feature engineering
- Filled 37 missing review ratings using the median rating of each product category
- Standardized column names (lowercase, underscores)
- Dropped `promo_code_used` after confirming it duplicates `discount_applied`
- Created new columns:
  . `age_group`: Young Adult (up to 25), Adult (26-35), Middle-aged (36-50), Senior (51+)
  . `purchase_frequency_days`: converts text frequency (Weekly, Monthly...) into days
  .`is_repeat_buyer`: True when a customer has more than 5 previous purchases
  . `customer_segment`: New (0-1 previous purchases), Returning (2-5), Loyal (6+)
- Saved the cleaned file for SQL and Power BI

### 2. SQL: 10 business questions
All queries are in [Queries.sql](Queries.sql).

1. How does purchase amount differ across customer segments (New / Returning / Loyal)?
2. Which season generates the highest revenue, and how does it vary by segment?
3. Does discount usage differ between Loyal and New customers?
4. What is the payment method preference by customer segment?
5. Which top 5 locations have the highest concentration of Loyal customers?
6. Is there a link between review rating and customer segment?
7. How does purchase frequency (in days) relate to average purchase amount?
8. Which product categories are most purchased by Loyal customers vs New customers?
9. Are subscribers more likely to be repeat buyers than non-subscribers?
10. What is the revenue contribution of each age group, broken down by customer segment?

### 3. Power BI: interactive dashboard
- **5 KPI cards:** Total Customers, Total Revenue, Avg Purchase Amount, Avg Review Rating, Subscription Rate
- **6 visuals:** Revenue by Category, Revenue by Season, Customer Segments, Revenue by Age Group, Top 5 Locations, Payment Method
- **5 slicers:** Gender, Season, Category, Shipping Type, Subscription Status.

---

## Key Insights

- **Total revenue is $233K** across 3,900 customers, with an average purchase of **$59.76** and an average review rating of **3.75**.
- **Clothing is the top category** at $104K (about 45% of revenue), followed by Accessories ($74K), Footwear ($36K) and Outerwear ($19K).
- **Seniors (51+) bring the most revenue** at $88K, followed by Middle-aged ($66K), Adults ($44K) and Young Adults ($35K).
- **Revenue is spread evenly across seasons**, from $55.8K in Summer to $60.0K in Fall, so no single season dominates.
- **89% of customers are "Loyal"** (6+ previous purchases), while only 2% are "New" and 9% are "Returning".
- **Loyal customers use discounts more** (43.4%) than New customers (37.3%).
- **Subscribers are slightly more likely to be repeat buyers** (91.0% vs 88.4% for non-subscribers). Only 27% of customers are subscribed.
- **Spending per purchase is almost the same across segments:** New $58.47, Returning $61.11, Loyal $59.66.
- **Payment methods are evenly split** (PayPal 677, Credit Card 671, Cash 670, Debit Card 636, Venmo 634, Bank Transfer 612), so payment choice does not separate loyal customers from others.
- **Top 5 locations by revenue:** Montana ($5.8K), Illinois ($5.6K), California ($5.6K), Idaho ($5.6K) and Nevada ($5.5K).

---

## Recommendations

1. **Grow the subscription base.** Only 27% of customers subscribe, yet subscribers show a higher repeat rate. A subscriber push is a low-risk retention test.
2. **Use targeted discounts, not blanket promotions.** Loyal customers already use discounts more, so offers should reward repeat purchases instead of being sent to everyone.
3. **Focus category marketing on Clothing and Accessories**, which bring about 76% of revenue, and test bundles to lift Footwear and Outerwear.
4. **Build campaigns around Seniors and Middle-aged customers**, who bring about 66% of revenue, and test ways to engage Young Adults.
5. **Prioritize Montana, Illinois and Idaho** for local campaigns, since they lead on both revenue and loyal customer count.

---

## Limitations

- Every customer in the dataset has at least 1 previous purchase, so there are no true one-time buyers. "New" here means 0-1 previous purchases, and that group is small (83 customers). This makes churn-style comparisons weak.
- The dataset has no date column, so trends over time cannot be analyzed.
- Differences between segments (discount use, ratings, spend) are small, so the recommendations above should be treated as hypotheses to test, not proven causes.

---

## Files in This Repository

| File | What it is |
|---|---|
| `customer_shopping_behavior.csv` | Original dataset |
| `customer_shopping_behavior_cleaned.csv` | Cleaned dataset after Python processing |
| `Customer_behavior.ipynb` | Python notebook (cleaning and feature engineering) |
| `Queries.sql` | 10 SQL business questions |
| `Customer_Behavior_Dashboard.pbix` | Power BI dashboard file |
| `dashboard.png` | Dashboard screenshot |

---

## Credits

Based on a public dataset and inspired by a YouTube tutorial by **Amlan Mohanty** ([GitHub](https://github.com/amlanmohanty1)). Extended with a new problem statement focused on loyalty and retention, a new set of 10 SQL questions, new derived columns (`is_repeat_buyer`, `customer_segment`, fixed-bin `age_group`), and a redesigned Power BI dashboard.

---

## Author

**Nivetha Karuppasamy**
Chennai, Tamil Nadu
[LinkedIn](https://www.linkedin.com/in/nivetha-karuppasamy) | nivethakaruppasamy02@gmail.com

