<?php

require 'wp-blog-header.php';

global $wpdb;

//$json_data = json_decode($_POST['data']);
$json_data = array(

    'data' => array(

        'group_data' => array(

            'group_name' => 'Test',

            'biology' => array(

                array(

                    'bmeasurement_time' => 1,
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
                    'bearing_3' => 7,
                    'bearing3_degrees' => 8,
                    'gps_latitude_degrees' => 9,
                    'gps_latitude_min' => 10,
                    'gps_latitude_sec' => 11,
                    'gps_longitude_degrees' => 12,
                    'gps_longitude_min' => 13,
                    'gps_longitude_sec' => 14,
                    'nweather_observation' => 15,
                    'nwind_speed' => 16,
                    'ndepth' => 17
                )

            )

        )

    ),

    'id' => 3482
);

$data = get_field('group_data', $json_data['id']);
$data[] = $json_data['data']['group_data'];


//update_field('group_data', $json_data['data'], $json_data['id']);
update_field('group_data', $data, $json_data['id']);

//foreach($json_data['data']['group_data'] as $field => $value)
//{
//    if($field == 'biology' || $field == 'ecology' || $field == 'navigation')
//    {
//        update_sub_field($field, $value, $json_data['id']);
//    }
//}


//$fields = get_fields($json_data['id']);
//var_dump($fields);

//update_field('group_data', $json_data['data'], $json_data['id']);


//if(have_rows('group_data', $json_data['id']))
//{
//    while (have_rows('group_data')) : the_row();
//
//        // Your loop code
//        echo the_sub_field('group_name');
//
//    endwhile;
//
//} else {
//
//    die(json_encode(['success' => false, 'message' => 'Invalid school ID.']));
//
//}

//$post_id = $wpdb->get_var("SELECT id FROM wp_posts, wp_postmeta WHERE wp_postmeta.post_id = wp_posts.ID AND wp_posts.ID = " . $_POST['data']['id']);
//
//
//foreach($json_data as $field)
//{
//    update_post_meta($post_id, $field['meta_key'], $field['meta_value']);
//}

//echo json_encode(['success' => true, 'message' => 'Update successful.']);

?>
