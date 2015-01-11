<?php

require 'wp-blog-header.php';

global $wpdb;


$str_json = str_replace('\"', '"', $_POST['data']);

$json_data = json_decode($str_json, true, 10);
var_dump($json_data);


/*
$json_data = array(

    'data' => array(

        'group_data' => array(

            'group_name' => 'Test',

            'biology' => array(

                array(

                    'bmeasurement_timee' => 1,
                    'bmeasurement_date' => 2,
                    'bsurface_temperature' => 3,
                    'bseawater_depth' => 4,
                    'bseawater_visibility' => 5,
                    'bseawater_salinity' => 6,
                    'bplankton_sample' => 7,
                    'bplankton_notes' => 8,
                    'bseawater_color' => 9
                )

            ),

            'ecology' => array(

                array(

                    'emeasurement_time' => 1,
                    'emeasurement_date' => 2,
                    'otter_count' => 3,
                    'seawater_ph' => 4,
                )

            ),

            'navigation_data' => array(

                array(

                    'nmeasurement_time' => 1,
                    'nmeasurement_date' => 2,
                    'bearing_1' => 3,
                    'bearing1_degrees' => 4,
                    'bearing_2' => 5,
                    'bearing2_degrees' => 6,
                    'bearing_3' => 'Cocoanut Grove',
                    'bearing3_degrees' => 8,
                    'gps_latitude_degrees' => 9,
                    'gps_latitude_min' => 10,
                    'gps_latitude_sec' => 11,
                    'gps_longitude_degrees' => 12,
                    'gps_longitude_min' => 13,
                    'gps_longitude_sec' => 14,
                    'nweather_observation' => 'heavy fog',
                    'nwind_speed' => 16,
                    'ndepth' => 17
                )

            )

        )

    ),

    'id' => 3482
);
*/

$json_data['id'] = 3482;

//echo var_export($json_data);

$data = get_field('group_data', $json_data['id']);
$data[] = $json_data['data']['group_data'];

update_field('group_data', $data, $json_data['id']);

echo json_encode(['success' => 'true', 'message' => 'Insert successful.']);

?>
