<?php

require 'wp-blog-header.php';

global $wpdb;

$json_data = json_decode($_POST['data']);

$post_id = $wpdb->get_var("SELECT id FROM $wpdb->posts, $wpdb->postmeta WHERE wp_postmeta.post_id = wp_posts.ID");

foreach($json_data as $field)
{
    update_post_meta($post_id, $field['meta_key'], $field['meta_value']);
}

echo json_encode(['success' => true, 'message' => 'Insert successful.']);

?>
