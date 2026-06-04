# Database Design

## Database

ecommerce_warehouse

## Schema

dw

## Fact Table

fact_sales

Purpose:
Stores transactional sales metrics.

## Dimension Tables

### dim_customer
Stores customer information.

### dim_product
Stores product information.

### dim_date
Stores date attributes.

### dim_payment
Stores payment attributes.

### dim_shipping
Stores shipping attributes.

### dim_marketing
Stores marketing attributes.

## Modeling Technique

Star Schema

## Fact Table Grain

One row per product transaction within an order.