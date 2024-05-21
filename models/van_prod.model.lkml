connection: "vo-prod"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: van_prod_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: van_prod_default_datagroup

explore: applicationusagelogs {
  join: searchlogs {
    type: left_outer
    sql_on: ${applicationusagelogs.id} =${searchlogs.searchid} ;;
    relationship: one_to_many
}
}
explore: documentlogs {}
explore: sql_query_successfeedback{}

explore: searchlogs {
  join: documentlogs {
    type: left_outer
    sql_on: ${searchlogs.searchid}=${documentlogs.searchid} ;;
    relationship: one_to_many
  }
}
