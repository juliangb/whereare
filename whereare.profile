<?php

/**
 * Implements hook_views_api().
 */
function whereare_views_api() {
  return array('api' => 3.0);
}

/**
 * Implements hook_block_info_alter().
 */
function whereare_block_info_alter(&$blocks, $theme, $code_blocks) {
  if (isset($blocks['system']['help'])) {
    $blocks['system']['help']['status'] = 0;
    $blocks['system']['help']['region'] = BLOCK_REGION_NONE;
    $blocks['system']['help']['weight'] = 1;
    $blocks['system']['help']['visibility'] = BLOCK_VISIBILITY_LISTED;
    //$blocks['system']['help']['pages'] = '<front>';
  }
  if (isset($blocks['views']['plans-block_1'])) {
    $blocks['views']['plans-block_1']['status'] = 1;
    $blocks['views']['plans-block_1']['region'] = 'help';
    $blocks['views']['plans-block_1']['weight'] = 1;
    $blocks['views']['plans-block_1']['visibility'] = BLOCK_VISIBILITY_LISTED;
    //$blocks['views']['plans-block_1']['pages'] = '<front>';
  }
}

/**
 * Function to allow nodes to be created on installation.
 */
function whereare_createnode($type, $title, $date) {
  $node = new stdClass();
  $node->title = $title;
  $node->type = $type;
  node_object_prepare($node); // Sets some defaults. Invokes hook_prepare() and hook_node_prepare().
  $node->language = LANGUAGE_NONE; // Or e.g. 'en' if locale is enabled
  $node->uid = 1; 
  $node->status = 1; //(1 or 0): published or not
  $node->promote = 0; //(1 or 0): promoted to front page
  $node->comment = 1; // 0 = comments disabled, 1 = read only, 2 = read/write

  /*$entity->field_my_date[LANGUAGE_NONE][0] = array(
     'value' => date_format($date, 'Y-m-d'),
     'timezone' => 'UTC',
     'timezone_db' => 'UTC',
  );*/
  
  $node = node_submit($node); // Prepare node for saving
  node_save($node);
}