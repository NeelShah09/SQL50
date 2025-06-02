WITH latest_change_dates AS (
    SELECT product_id, new_price, change_date FROM (
        SELECT product_id, new_price,
            change_date,
            RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) r
        FROM products
        WHERE change_date <= '2019-08-16'
    ) WHERE r = 1
)
SELECT pid.product_id, COALESCE(lcd.new_price,10) price
FROM (SELECT DISTINCT product_id FROM products) pid
LEFT JOIN latest_change_dates lcd
ON pid.product_id = lcd.product_id