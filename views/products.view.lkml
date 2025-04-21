view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }
  dimension: shop {
    type: string
    sql: CASE WHEN ${department} = 'Men' and ${category} = 'Accessories' then 'Men Accessories'
      WHEN ${department} = 'Men' and ${category} = 'Active' then 'Men Active'
      WHEN ${department} = 'Men' and ${category} = 'Blazers & Jackets' then 'Men Blazers & Jackets'
      WHEN ${department} = 'Men' and ${category} = 'Clothing Sets' then 'Men Clothing Sets'
      WHEN ${department} = 'Men' and ${category} = 'Dresses' then 'Men Dresses'
      WHEN ${department} = 'Men' and ${category} = 'Jeans' then 'Men Jeans'
      ELSE ${department}
      END
      ;;
  }

  dimension: sbu {
    type: string
    sql: case
      when ${brand} = 'Champion' THEN 'Men Accessories Champion'
      WHEN ${brand} = 'Calvin Klein' THEN 'Men Active Calvin Klein'
      ELSE ${brand} END;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }
  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }
  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
