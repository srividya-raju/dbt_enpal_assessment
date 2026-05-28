Pipedrive CRM Pipeline in dbt:
<img width="1842" height="727" alt="image" src="https://github.com/user-attachments/assets/37dfb09e-4992-448b-8f6b-c738a4815991" />
This project implements a modern analytics engineering workflow using dbt with 3 layer architecture(staging, intermediate and marts). The pipeline transforms CRM deal change data into clean, analytics-ready dimensional models.

Architecture: 
1) Staging layer: this layer consists of staging models directly sourced from raw ingestion tables in postgres schema. The staging models are materilaized as views.
Actions performed: Column renaming, type casting
2) Intermediate layer: This layer consists of cleaned and business validated intermediate transformations. These models are materialized as tables.
Actions performed: deduplication, enrichment joins, KPI definitions implementation
3) Marts: This layer consists of anlytics ready dimensional and reporting models. These models are materialized as tables.
Actions performed: PI reporting, dimensional modeling

SCD type 2 implementation for users table:
Implementing the dbt snapshot functionality, dim_users table is implemented for tracking historical updates to name and email columns.dim_users table in marts has the updated list of users.

Testing Strategy:
This project includes
Generic tests: not_null, unique, relationships
Singular tests: KPI name validation wrt stg_stages table for deals

Future Enhancements:
Work on more KPIs
Work on implementations for lost deals
Implement incremental materialization when the data volume increases to millions of rows, leading to the dbt module compiling for a long time

