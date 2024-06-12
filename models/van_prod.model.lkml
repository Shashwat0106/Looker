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
explore: success {}

explore: searchlogs {
  sql_always_where:${username}!='admin'  ;;
  join: documentlogs {
    type: left_outer
    sql_on: ${searchlogs.searchid}=${documentlogs.searchid} ;;
    relationship: one_to_many
  }
}
