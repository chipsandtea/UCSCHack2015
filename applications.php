<?php

require 'wp-blog-header.php';
global $wpdb;

$data = array();

$result = $wpdb->get_results(
	"
	SELECT post_title, ID
        FROM   wp_posts
        WHERE post_type LIKE  'registration55' AND post_title != ''
        ORDER BY post_date DESC
        LIMIT 0, 100
	"
);

foreach ($result as $application)
{
    $data[] = ['school' => $application->post_title, 'id' => $application->ID];
}

echo json_encode($data);

?>
