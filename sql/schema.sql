CREATE SCHEMA IF NOT EXISTS dw;

CREATE TABLE dw.dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id VARCHAR(50) UNIQUE,
    customer_name VARCHAR(255),
    gender VARCHAR(20),
    age INT,
    customer_segment VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    customer_loyalty_score NUMERIC(10,2),
    total_orders_by_customer INT,
    account_creation_date DATE
);


CREATE TABLE dw.dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id VARCHAR(50) UNIQUE,
    product_name VARCHAR(255),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    brand VARCHAR(100),
    product_rating_avg NUMERIC(10,2),
    product_reviews_count INT,
    stock_quantity INT
);



CREATE TABLE dw.dim_date (
    date_key SERIAL PRIMARY KEY,
    order_date TIMESTAMP,
    order_year INT,
    order_month INT,
    order_day INT,
    order_hour INT,
    order_minute INT,
    order_second INT,
    is_weekend BOOLEAN
);


CREATE TABLE dw.dim_payment (
    payment_key SERIAL PRIMARY KEY,
    payment_method VARCHAR(100),
    payment_status VARCHAR(50),
    installment_plan VARCHAR(50)
);


CREATE TABLE dw.dim_shipping (
    shipping_key SERIAL PRIMARY KEY,
    shipping_method VARCHAR(100),
    warehouse_location VARCHAR(100),
    shipping_country VARCHAR(100),
    delivery_status VARCHAR(100),
    delivery_days INT
);



CREATE TABLE dw.dim_marketing (
    marketing_key SERIAL PRIMARY KEY,
    campaign_source VARCHAR(100),
    traffic_source VARCHAR(100),
    coupon_used VARCHAR(20),
    coupon_code VARCHAR(100)
);



CREATE TABLE dw.fact_sales (
    sales_key BIGSERIAL PRIMARY KEY,

    customer_key INT REFERENCES dw.dim_customer(customer_key),
    product_key INT REFERENCES dw.dim_product(product_key),
    date_key INT REFERENCES dw.dim_date(date_key),
    payment_key INT REFERENCES dw.dim_payment(payment_key),
    shipping_key INT REFERENCES dw.dim_shipping(shipping_key),
    marketing_key INT REFERENCES dw.dim_marketing(marketing_key),

    quantity INT,
    unit_price_usd NUMERIC(12,2),
    discount_amount_usd NUMERIC(12,2),
    total_price_usd NUMERIC(12,2),
    cost_usd NUMERIC(12,2),
    profit_usd NUMERIC(12,2),
    profit_margin_percent NUMERIC(10,2),
    tax_usd NUMERIC(12,2),
    shipping_cost_usd NUMERIC(12,2)
);



CREATE INDEX idx_fact_customer
ON dw.fact_sales(customer_key);

CREATE INDEX idx_fact_product
ON dw.fact_sales(product_key);

CREATE INDEX idx_fact_date
ON dw.fact_sales(date_key);



SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'dw';