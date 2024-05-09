view: documentlogs {
  sql_table_name: public.documentlogs ;;
  drill_fields: [documentlogid]

  dimension: documentlogid {
    primary_key: yes
    type: string
    sql: ${TABLE}."documentlogid" ;;
  }
  dimension_group: documentclosedon {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."documentclosedon" ;;
  }
  dimension: documentid {
    type: string
    sql: ${TABLE}."documentid" ;;
  }
  dimension: documentname {
    type: string
    sql: ${TABLE}."documentname" ;;
  }
  dimension_group: documentopenedon {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."documentopenedon" ;;
  }
  dimension: documenttype {
    type: string
    sql: ${TABLE}."documenttype" ;;
  }
  dimension: query {
    type: string
    sql: ${TABLE}."query" ;;
  }
  dimension: route {
    type: string
    sql: ${TABLE}."route" ;;
  }
  dimension: searchid {
    type: string
    sql: ${TABLE}."searchid" ;;
  }
  dimension: successfeedback {
    type: yesno
    sql: ${TABLE}."successfeedback" ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}."username" ;;
  }
  measure: count {
    type: count
    drill_fields: [documentlogid, documentname, username]
  }
}
