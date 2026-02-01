-- 1. Daily Revenue
SELECT 
  order_date,
  SUM(quantity * price) AS daily_revenue
FROM orders
WHERE delivery_status = 'Delivered'
GROUP BY order_date
ORDER BY order_date;


-- 2. Total Orders vs Delivered Orders
SELECT
  COUNT(*) AS total_orders,
  SUM(CASE WHEN delivery_status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_orders
FROM orders;


-- 3. Return Rate
SELECT
  COUNT(*) AS total_orders,
  SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) AS returned_orders,
  ROUND(
    (SUM(CASE WHEN returned = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS return_rate_percent
FROM orders;


-- 4. Delivery Issues
SELECT
  delivery_status,
  COUNT(*) AS count
FROM orders
GROUP BY delivery_status;


-- 5. Support Tickets by Issue Type
SELECT
  issue_type,
  COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY issue_type;


-- 6. Average Resolution Time
SELECT
  AVG(resolution_days) AS avg_resolution_days
FROM support_tickets
WHERE resolution_days IS NOT NULL;
