
view: sql_runner_query {
  derived_table: {
    sql: -- raw sql results do not include filled-in values for 'documentlogs.successfeedback'
      
      
      --SELECT
      --(CASE WHEN successfeedback THEN 'yes'WHEN successfeedback IS NULL THEN 'no-feedback'ELSE 'no'END) AS successfeedback_text, documentlogs."successfeedback"
      --COUNT(*) as "count"
      --FROM "public"."documentlogs" 
      --ORDER BY successfeedback_text, successfeedback FETCH NEXT 500 ROWS ONLY;
      
      WITH cte AS (
        SELECT
          CASE WHEN "successfeedback" THEN 'yes'
               WHEN "successfeedback" IS NULL THEN 'no-feedback'
               ELSE 'no'
          END AS "successfeedback_text",
          "successfeedback"
        FROM
          "public"."documentlogs"
      )
      SELECT
        successfeedback_text,
        COUNT(*) AS count
      FROM
        cte
      GROUP BY
        "successfeedback_text"
      ORDER BY
        "successfeedback_text"
      FETCH NEXT 500 ROWS ONLY ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: successfeedback_text {
    type: string
    sql: ${TABLE}."successfeedback_text" ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}."count" ;;
  }

  set: detail {
    fields: [
        successfeedback_text,
	count_
    ]
  }
}
