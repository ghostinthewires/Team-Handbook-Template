## Terraform Functions

We deploy Report Functions and Student Importer Infrastructure using Terraform. This is ran from TeamCity.

The code is stored in this [repo](https://gitlab.com/gl-teamcity/terraform-functions) 

Below I will map out and discuss how it all knits together

### **High Level Structure**

	+---.terraform
	|               
	+---Modules
	|   \---arm_templates
	|       +---asp
	|       |       AppServicePlan.tf
	|       |       create_function.ps1
	|       |       iseb_functions.ps1
	|       |       ngrtngst_functions.ps1
	|       |       ngrt_functions.ps1
	|       |       ngst_functions.ps1
	|       |       student_import_function.ps1
	|       |       
	|       \---servicebus
	|               ServiceBus.tf
	|               
	+---REPORTS
	|   |   main.tf
	|   |   outputs.tf
	|   |   variables.tf
	|   |   
	|   \---environments
	|       +---devci1
	|       |       devci1.tfvars
	|       |       
	|       +---load
	|       |       load.tfvars
	|       |       
	|       +---play1
	|       |       play1.tfvars
	|       |       
	|       +---play2
	|       |       play2.tfvars
	|       |       
	|       +---prod
	|       |       prod.tfvars
	|       |       
	|       +---qa1
	|       |       qa1.tfvars
	|       |       
	|       +---uat1
	|       |       uat1.tfvars
	|       |       
	|       +---uat3
	|       |       uat3.tfvars
	|       |       
	|       +---uat4
	|       |       uat4.tfvars
	|       |       
	|       \---uat5
	|               uat5.tfvars
	|               
	\---STUDENT_IMPORTER
	    |   main.tf
	    |   outputs.tf
	    |   variables.tf
	    |   
	    +---.terraform
	    |               
	    \---environments
	        +---devci1
	       	|       devci1.tfvars
        	|       
        	+---play1
        	|       play1.tfvars
        	|       
        	+---play2
        	|       play2.tfvars
        	|       
        	+---prod
	        |       prod.tfvars
	        |       
	        +---qa1
	        |       qa1.tfvars
       		|       
        	+---uat1
        	|       uat1.tfvars
        	|       
        	+---uat3
        	|       uat3.tfvars
        	|       
        	+---uat4
        	|       uat4.tfvars
        	|       
        	\---uat5
        	        uat5.tfvars


### **main.tf, variables.tf, outputs.tf**

`main.tf` is the primary entrypoint. Resource creation is split into multiple files but all nested module usage should be in the `main.tf` file. `variables.tf` and `outputs.tf` should contain the declarations for variables and outputs, respectively.

### **Nested Modules**

Nested modules should exist under the modules/ subdirectory. Nested modules should be used to split complex behavior into multiple small modules that advanced users can carefully pick and choose.

## **Reports**

## main.tf

For all the function reports, this is the primary entrypoint. From here all resources are either created or a call is made to the nested Modules to create further resources.

### main.tf Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app_ins_name | Application Insights Name | string | - | yes |
| appserviceplan_name | App Service Plan Name | string | - | yes |
| asp_scale_default | App Service Plan Default | string | - | yes |
| asp_scale_max | App Service Plan Maximum | string | - | yes |
| asp_scale_min | App Service Plan Minimum | string | - | yes |
| asp_sku_capacity | App Service Plan Capacity | string | - | yes |
| asp_sku_family | App Service Plan Family | string | - | yes |
| asp_sku_name | App Service Plan Name | string | - | yes |
| asp_sku_size | App Service Plan Size | string | - | yes |
| asp_sku_tier | App Service Plan Tier | string | - | yes |
| client_id | Azure Client ID | string | - | yes |
| client_secret | Azure Client Secret | string | - | yes |
| environment_name | Environment Name | string | - | yes |
| func_blob_name | Function Blob Storage Name | string | - | yes |
| func_blob_replication_type | Function Blob Storage Replication Type | string | - | yes |
| func_blob_tier | Function Blob Storage Tier | string | - | yes |
| hyve_blob | Hyve Data Blob Storage | string | - | yes |
| location | Region Location | string | - | yes |
| resource_group_name | Resource Group Name | string | - | yes |
| select_db | Read Database Connection String | string | - | yes |
| servicebus_name | Service Bus Name | string | - | yes |
| servicebus_sku | Service Bus Sku | string | - | yes |
| subscription_id | Azure Subscription ID | string | - | yes |
| tenant_id | Azure Tenant ID | string | - | yes |
| update_db | Write Database Connection String | string | - | yes |

### main.tf Outputs

| Name | Description |
|------|-------------|
| application_insights_key | App Insights Instrumentation key |
| sb_name | Service Bus name |

## **Student Importer**

## main.tf

For the Student Importer Fucntions, this is the primary entrypoint. From here all resources are either created or a call is made to the nested Modules to create further resources.

### main.tf Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app_ins_name | Application Insights Settings | string | - | yes |
| appserviceplan_name | App Service Plan and functions | string | - | yes |
| asp_scale_default | App Service Plan Default | string | - | yes |
| asp_scale_max | App Service Plan Maximum | string | - | yes |
| asp_scale_min | App Service Plan Minimum | string | - | yes |
| asp_sku_capacity | App Service Plan Capacity | string | - | yes |
| asp_sku_family | App Service Plan Family | string | - | yes |
| asp_sku_name | App Service Plan Name | string | - | yes |
| asp_sku_size | App Service Plan Size | string | - | yes |
| asp_sku_tier | App Service Plan Tier | string | - | yes |
| client_id | Azure Client ID | string | - | yes |
| client_secret | Azure Client Secret | string | - | yes |
| environment_name | Environment Name | string | - | yes |
| func_blob_name | Function Blob Storage Name | string | - | yes |
| func_blob_replication_type | Function Blob Storage Replication | string | - | yes |
| func_blob_tier | Function Blob Storage Tier | string | - | yes |
| location | Region Location | string | - | yes |
| resource_group_name | Resource Group Name | string | - | yes |
| servicebus_name | Service Bus Name | string | - | yes |
| servicebus_sku | Service Bus Sku | string | - | yes |
| sql_database_name | Azure SQL Database Name | string | - | yes |
| sql_server_login | Azure SQL Login Username | string | - | yes |
| sql_server_name | Azure SQL Server Name | string | - | yes |
| sql_server_password | Azure SQL Login Password | string | - | yes |
| sql_server_version | Azure SQL Version | string | - | yes |
| studentimport_blob_name | Student Import File Drop Blob Storage Name | string | - | yes |
| studentimport_blob_replication_type | Student Import File Drop Blob Storage Replication Type | string | - | yes |
| studentimport_blob_tier | Student Import File Drop Blob Storage Tier | string | - | yes |
| stuimp_db_conn | Azure SQL Database Connection String | string | - | yes |
| subscription_id | Azure Subscription ID | string | - | yes |
| tenant_id | Azure Tenant ID | string | - | yes |

### main.tf Outputs

| Name | Description |
|------|-------------|
| application_insights_key | App Insights Instrumentation key |
| studentimporter_primaryKey | Student Import File Drop Blob Storage Primary Connection String |

## **Nested Modules**

## ServiceBus.tf

Creates the Service Bus that the functions subscribe to. When a report is requested in Testwise, it is posted to this queue. The function then picks this up, creates the report and updates the Hyve Database.

This is deployed using a nested ARM Template.

### ServiceBus.tf Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Service Bus Name | string | - | yes |
| rg_name | Resource Group Name | string | - | yes |
| sb_sku | Service Bus Sku | string | - | yes |

### ServiceBus.tf Outputs

| Name | Description |
|------|-------------|
| sb_name | Service Bus Name |

## AppServicePlan.tf

Creates the App Service Plan to host the functions. This is deployed using a nested ARM Template.


### AppServicePlan.tf Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| asp_name | App Service Plan Name | string | - | yes |
| asp_scale_default | App Service Plan Default | string | - | yes |
| asp_scale_max | App Service Plan Maximum | string | - | yes |
| asp_scale_min | App Service Plan Minimum | string | - | yes |
| asp_sku_capacity | App Service Plan Capacity | string | - | yes |
| asp_sku_family | App Service Plan SKU Family | string | - | yes |
| asp_sku_name | App Service Plan SKU Name | string | - | yes |
| asp_sku_size | App Service Plan SKU Size | string | - | yes |
| asp_sku_tier | App Service Plan Tier | string | - | yes |
| rg_name | Resource Group Name | string | - | yes |

### AppServicePlan.tf Outputs

| Name | Description |
|------|-------------|
| asp_name | App Service Plan Name |

## *_functions.ps1 

These files create the functions and set several of the app settings. They're broken down into the various reports i.e. iseb, ngrt etc and collectively call the `create_function.ps1`

These are covered in more depth in [this guide](https://gitlab.com/gl-education-Infra/Team-Handbook/blob/master/engineering/infrastructure/how-to/create-new-report-functions-terraform.md). Detailing how to add additional reporting functions.

## Environments

These files are in the tfvars format i.e. `devci1.tfvars`, `qa1.tfvars` etc. These provide inputs for a lot of the environment specific input variables required in the `main.tf` file

## State

When Terraform builds these resources, a state file is written to the following directory on the TeamCity server `F:\Terraform\State_Files`