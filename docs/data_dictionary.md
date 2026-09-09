# Data Dictionary

## OLTP source model

| Table | Key fields | Purpose |
|---|---|---|
| `locations` | `location_id` | City, country and region attributes for users. |
| `users` | `user_id`, `location_id` | Synthetic customer profile and signup information. |
| `banks` | `bank_id` | Bank name, type and country. |
| `accounts` | `account_id`, `user_id`, `bank_id` | Account type, currency, opening date and status. |
| `merchants` | `merchant_id` | Merchant name, category, channel and country. |
| `transactions` | `transaction_id`, `account_id`, `merchant_id` | Transaction date, amount, payment method and recurring flag. |

## Data warehouse model

The warehouse uses a snowflake design centered on `fact_transaction`.

| Table | Role |
|---|---|
| `fact_transaction` | One row per spending transaction; contains amount, transaction count and recurring-spend indicator. |
| `dim_date` | Calendar attributes used for time-based analysis. |
| `dim_user` | User attributes linked to `dim_location`. |
| `dim_location` | City, country and region hierarchy. |
| `dim_account` | Account attributes linked to `dim_bank`. |
| `dim_bank` | Bank descriptive attributes. |
| `dim_merchant` | Merchant attributes linked to merchant category. |
| `dim_merchant_category` | Merchant category linked to a broader spending sector. |
| `dim_sector` | High-level spending sectors. |
| `dim_payment_method` | Payment method descriptors. |
