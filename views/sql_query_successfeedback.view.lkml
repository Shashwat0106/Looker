
view: sql_query_successfeedback {
  derived_table: {
    sql: SELECT
          successfeedback,
          COUNT(*)
      FROM
          public.documentlogs
      GROUP BY
          successfeedback
      ORDER BY
          successfeedback
      FETCH NEXT 500 ROWS ONLY ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: successfeedback {
    type: string
    sql: ${TABLE}."successfeedback" ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}."count" ;;
  }

  set: detail {
    fields: [
        successfeedback,
	count_
    ]
  }
}
