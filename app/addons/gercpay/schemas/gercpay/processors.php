<?php

$schema = array(
    'gercpay' => array(
        'processor'        => 'gercpay',
        'processor_script' => 'gercpay.php',
        'admin_template'   => 'gercpay.tpl',
        'callback'         => 'Y',
        'type'             => 'P',
        'position'         => 9,
        'addon'            => 'gercpay',
    )
);

return $schema;