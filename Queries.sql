Create database shopping_behavior;
Use shopping_behavior;

SELECT COUNT(*) FROM customers;

SELECT * FROM customers LIMIT 10;

# Questions:
-- Q1. How does purchase amount differ across customer segments (New / Returning / Loyal)?
SELECT customer_segment, COUNT(*) AS customer_count, AVG(purchase_amount) AS avg_purchase, SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY customer_segment
ORDER BY avg_purchase DESC;

-- Q2. Which season generates the highest revenue, and how does it vary by segment?
SELECT season, customer_segment, SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY season, customer_segment
ORDER BY season, total_revenue DESC;

-- Q3. Does discount usage differ between Loyal and New customers?
SELECT customer_segment,
  SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS discount_usage_pct
FROM customers
GROUP BY customer_segment;

-- Q4. What's the payment method preference by customer segment?
SELECT customer_segment, payment_method, COUNT(*) AS customer_count
FROM customers
GROUP BY customer_segment, payment_method
ORDER BY customer_segment, customer_count DESC;

-- Q5. Which top 5 locations have the highest concentration of Loyal customers?
SELECT location, COUNT(*) AS loyal_customer_count
FROM customers
WHERE customer_segment = 'Loyal'
GROUP BY location
ORDER BY loyal_customer_count DESC
LIMIT 5;

-- Q6. Is there a link between review rating and customer segment?
SELECT customer_segment, AVG(review_rating) AS avg_review_rating
FROM customers
GROUP BY customer_segment
ORDER BY avg_review_rating DESC;

-- Q7. How does purchase frequency (in days) relate to average purchase amount?
SELECT purchase_frequency_days, AVG(purchase_amount) AS avg_purchase, COUNT(*) AS customer_count
FROM customers
GROUP BY purchase_frequency_days
ORDER BY purchase_frequency_days;

-- Q8. Which product categories are most purchased by Loyal customers vs New customers?
SELECT customer_segment, category, COUNT(*) AS purchase_count
FROM customers
GROUP BY customer_segment, category
ORDER BY customer_segment, purchase_count DESC;

-- Q9. Are subscribers more likely to be repeat buyers than non-subscribers?
SELECT subscription_status,
  SUM(CASE WHEN is_repeat_buyer IN ('True', '1') THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS repeat_buyer_pct
FROM customers
GROUP BY subscription_status;

-- Q10. What's the revenue contribution of each age group, broken down by customer segment?
SELECT age_group, customer_segment, SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY age_group, customer_segment
ORDER BY age_group, total_revenue DESC;
