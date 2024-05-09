view: searchlogs {
  sql_table_name: public.searchlogs ;;

  dimension: query {
    type: string
    sql: ${TABLE}."query" ;;
  }
  dimension: route {
    type: string
    sql: ${TABLE}."route" ;;
  }
  dimension: searchid {
    primary_key: yes
    type: string
    sql: ${TABLE}."searchid" ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."timestamp" ;;
  }
  dimension: troubleshooting {
    type: string
    sql: ${TABLE}."troubleshooting" ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }
  measure: count {
    type: count
    drill_fields: [username]
  }
  measure: average {
    type : average
    drill_fields: [username]
  }
}
