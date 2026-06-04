# Data Modeling

## Objective

Design a dimensional data model for analytical reporting and business intelligence.

The raw dataset contains transactional, customer, product, payment, shipping, and marketing information. To support scalable analytics and dashboarding, a star schema design will be implemented.

---

# Modeling Approach

The dimensional model consists of:

* One Fact Table
* Multiple Dimension Tables

This design improves:

* Query performance
* Reporting simplicity
* Dashboard development
* Scalability

---

# Business Entities Identified

The following business entities were identified from the dataset:

1. Orders
2. Customers
3. Products
4. Payments
5. Shipping
6. Marketing
7. Dates

---

# Selected Modeling Technique

Star Schema

The star schema is widely used in data warehouses because it simplifies analytical queries and Power BI reporting.

Fact table records business events.

Dimension tables provide descriptive business context.

# Fact Table

## fact_sales

The fact_sales table stores transactional metrics.

Measures:

* quantity
* unit_price_usd
* discount_amount_usd
* total_price_usd
* cost_usd
* profit_usd
* profit_margin_percent
* tax_usd
* shipping_cost_usd

Foreign Keys:

* customer_key
* product_key
* date_key
* payment_key
* shipping_key
* marketing_key

Grain:

One row per product sold within an order transaction.



# Dimension Table

## dim_customer

Purpose:

Stores customer demographic and segmentation information.

Attributes:

* customer_id
* customer_name
* gender
* age
* customer_segment
* country
* city
* customer_loyalty_score
* total_orders_by_customer
* account_creation_date

# Dimension Table

## dim_product

Purpose:

Stores product information.

Attributes:

* product_id
* product_name
* category
* sub_category
* brand
* product_rating_avg
* product_reviews_count
* stock_quantity


## dim_date
date_key
order_date
order_year
order_month
order_day
order_hour
order_minute
order_second
is_weekend


## dim_payment
payment_key
payment_method
payment_status
installment_plan


## dim_shippinng
shipping_key
shipping_method
warehouse_location
delivery_status
delivery_days
shipping_country


## dim_marketing
marketing_key
campaign_source
traffic_source
coupon_used
coupon_code