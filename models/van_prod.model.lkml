connection: "vo-prod"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: van_prod_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: van_prod_default_datagroup

explore: applicationusagelogs {}

explore: documentlogs {}

explore: searchlogs {}
