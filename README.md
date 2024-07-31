# Fabric Cost Analyzer

This Cost Analyzer notebook will allow you to track the true cost per query of a Fabric Warehouse or Lakehouse Query based on the amount of Capacity Units (CUs) consumed and will help you estimate the capacity size you will need to run these queries.

Due to the ability of Fabric Warehouse and Lakehouse SQL Endpoints to [burst up to 12X the workspace capacity](https://learn.microsoft.com/en-us/fabric/data-warehouse/burstable-capacity#sku-guardrails), it is important to understand this behavior on a per query basis to choose the appropriate [Fabric Capacity F SKU](https://azure.microsoft.com/en-us/pricing/details/microsoft-fabric/) that you can use to calculate your Fabric TCO.

This notebook accomplishes this by using [Semantic Link](https://learn.microsoft.com/en-us/fabric/data-science/semantic-link-overview) to query data from the [Capacity Metrics App](https://learn.microsoft.com/en-us/fabric/enterprise/metrics-app) and correlates it to query information from [Query Insights](https://learn.microsoft.com/en-us/fabric/data-warehouse/query-insights). However, due to Capacity Metrics information only being available via DAX queries against the semantic model, this approach may take up to 3-4+ hours to run for 2-3 days of queries. Logging has been added to estimate how long the notebook will take to run.

## Download [`Fabric Cost Analyzer`](fabric_cost_analyzer.ipynb)

Use the link above to download a copy of this notebook. From the same workspace as the Capacity Metrics App navigate to New > Import item > Import notebook to import the notebook.

## Pre-requisites

Below are the pre-requisites to running this notebook:

1. An Azure contributor will need to create an isolated Fabric capacity for the POC in the Azure portal. Creating the capacity will make this user the Capacity Admin.
2. Install the Capacity Metrics App in a new Fabric workspace and configure that workspace to use the isolated capacity.
3. The Capacity Admin will need to get the capacity ID from the Admin Portal.
4. Create and attach a Fabric Spark environment that includes the semantic-link pypi library.
5. Create and attach a Lakehouse to this notebook.
6. All Warehouse and Lakehouse Query runs need to be done on Lakehouses or Warehouses in this workspace. If not, you need to create shortcuts to those tables in other workspaces within the Lakehouse attached to this notebook.
7. Replace the parameters in cell 4 with the appropriate values.

## Acknowledgement

These notebooks build on top of the great work from Fabric CAT PM [Bradley Schacht](https://github.com/bradleyschacht) from [this blog](https://bradleyschacht.com/using-sempy-to-get-sql-query-cu-cost-from-the-fabric-capacity-metrics-app), Microsoft CSA [Kristian Bubalo](https://github.com/PBI-Guy) from [this blog](https://pbi-guy.com/2024/04/24/how-to-extract-data-from-the-fabric-metrics-app-part-2/) and [notebook](https://github.com/PBI-Guy/blog/tree/main/Extract%20data%20from%20the%20Fabric%20Metrics%20App) for extracting data from the Power BI metrics app using `semantic link` and Microsoft MVP [Sandeep Pawar](https://fabric.guru/) for checking if a table is V-Ordered.
