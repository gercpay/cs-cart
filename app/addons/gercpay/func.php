<?php

if (!defined('BOOTSTRAP')) {
    die('Access denied');
}

use Tygh\Registry;

/**
 * Install addon method.
 */
function fn_gercpay_install()
{
    $processors = fn_get_schema('gercpay', 'processors', 'php', true);

    if (!empty($processors)) {
        foreach ($processors as $processor_name => $processor_data) {
            $processor_id = db_get_field(
                'SELECT processor_id FROM ?:payment_processors WHERE admin_template = ?s',
                $processor_data['admin_template']
            );

            if (empty($processor_id)) {
                $processor_id = db_query(
                    'INSERT INTO ?:payment_processors ?e',
                    $processor_data
                );
            } else {
                db_query(
                    'UPDATE ?:payment_processors SET ?u WHERE processor_id = ?i',
                    $processor_data,
                    $processor_id
                );
            }
        }
    }
}

/**
 * Uninstall addon method.
 */
function fn_gercpay_uninstall()
{
    $processors = fn_get_schema('gercpay', 'processors');

    foreach ($processors as $processor_name => $processor_data) {
        $processor_id = db_get_field(
            "SELECT processor_id FROM ?:payment_processors WHERE admin_template = ?s",
            $processor_data['admin_template']
        );

        if (!empty($processor_id)) {
            db_query("DELETE FROM ?:payments WHERE processor_id = ?i", $processor_id);
            db_query("DELETE FROM ?:payment_processors WHERE processor_id = ?i", $processor_id);
        }
    }
}

/**
* @return array|bool|mixed|string|null
*/
function fn_gercpay_get_currencies()
{
    return Registry::get('currencies');
}

/**
* @param $products
* @param $currency_code
* @return array
*/
function fn_gercpay_products_normalize($products, $currency_code)
{
    $gercpay_products = array();

    if (!empty($products) && is_array($products)) {
        $product_name = array();
        $product_price = array();
        $product_count = array();
        foreach ($products as $key => $product) {
            $product_name[] = !empty($product['product_code'])
                ? $product['product'] . ' (' . $product['product_code'] . ')'
                : $product['product'];
            $product_price[] = fn_format_price_by_currency(
                $product['base_price'],
                CART_PRIMARY_CURRENCY,
                $currency_code
            );
            $product_count[] = $product['amount'];
        }
        $gercpay_products['productName']  = $product_name;
        $gercpay_products['productPrice'] = $product_price;
        $gercpay_products['productCount'] = $product_count;
    }

    return $gercpay_products;
}
