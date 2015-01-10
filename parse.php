<?php

require 'wp-blog-header.php';

global $wpdb;

//$json_data = json_decode($_POST['data']);
$json_data = array(
    'data' => array(
        'group_data' => null
    ),
    'id' => 3482
);



if(have_rows('group_data', $json_data['id']))
{
    while (have_rows('group_data')) : the_row();

        // Your loop code
        echo the_sub_field('group_name');

    endwhile;

} else {

    die(json_encode(['success' => false, 'message' => 'Invalid school ID.']));

}

//$post_id = $wpdb->get_var("SELECT id FROM wp_posts, wp_postmeta WHERE wp_postmeta.post_id = wp_posts.ID AND wp_posts.ID = " . $_POST['data']['id']);
//
//
//foreach($json_data as $field)
//{
//    update_post_meta($post_id, $field['meta_key'], $field['meta_value']);
//}

//echo json_encode(['success' => true, 'message' => 'Update successful.']);

?>
