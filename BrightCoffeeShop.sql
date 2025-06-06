SELECT
  *
FROM
  "BRIGHT"."COFFEE"."SHOP"
LIMIT
  10;
--------------------performance by categogory and produc---------------------------------------
--understanding performance by category--
SELECT DISTINCT PRODUCT_CATEGORY, SUM (TOTAL_AMOUNT) AS REVENUE
FROM "BRIGHT"."COFFEE"."SHOP"
GROUP BY ALL
ORDER BY REVENUE DESC;

--understanding product type performance in relation to i'ts category--
--seeing which products are best sellers--
SELECT PRODUCT_CATEGORY, PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
GROUP BY PRODUCT_CATEGORY, PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--seeing that Coffe is the best selling category, looking at the product type performence in the category--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Coffee'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"

--2nd best performing category and performance of products in the Tea category--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Tea'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--3rd best performing category and product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Bakery'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--4rth best performing category and product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Drinking Chocolate'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--5th category and it's product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Coffee beans'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--6th category and its product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Branded'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--7th category and product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Loose Tea'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--8th category and product perfomance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Flavours'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

--9th category and it's product performance--
SELECT PRODUCT_CATEGORY,PRODUCT_TYPE,SUM(TOTAL_AMOUNT) AS REVENUE_PER_PRODUCT
FROM "BRIGHT"."COFFEE"."SHOP"
WHERE PRODUCT_CATEGORY= 'Packaged Chocolate'
GROUP BY PRODUCT_CATEGORY,PRODUCT_TYPE
ORDER BY REVENUE_PER_PRODUCT DESC;

----location performance----
SELECT DISTINCT STORE_LOCATION, SUM (TOTAL_AMOUNT) AS REVENUE_PER_STORE
FROM "BRIGHT"."COFFEE"."SHOP"
GROUP BY ALL
ORDER BY REVENUE_PER_STORE DESC;

--understanding the distribution of  products amoung the stores and comparing it to revenue---
SELECT DISTINCT STORE_LOCATION,COUNT(TRANSACTION_QTY) AS QUANTITY_DISTRIBUTION, SUM(TOTAL_AMOUNT) AS REVENUE_PER_STORE
FROM "BRIGHT"."COFFEE"."SHOP"
GROUP BY ALL
ORDER BY REVENUE_PER_STORE DESC;

--------time buckets----
SELECT  TRANSACTION_DATE,
        TO_CHAR(TO_DATE(TRANSACTION_DATE), 'YYYYMM') AS MONTH_ID,
        COUNT(TRANSACTION_ID) AS NUMBER_OF_SALES,
        COUNT(PRODUCT_ID) AS UNIQUE_PRODUCT_SOLD,
        STORE_ID,
        TOTAL_AMOUNT,
        PRODUCT_CATEGORY,
        PRODUCT_DETAIL,
        PRODUCT_TYPE,
        STORE_LOCATION,
        TRANSACTION_TIME,
       CASE
          WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
          WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'AFternoon'
          WHEN TRANSACTION_TIME BETWEEN '17:00:00' AND '18:59:00' THEN 'Evening'
ELSE 'Night'
END AS TIME_BUSKET
FROM "BRIGHT"."COFFEE"."SHOP"
GROUP BY ALL
ORDER BY TRANSACTION_DATE DESC;
