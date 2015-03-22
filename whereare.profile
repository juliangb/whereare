<?php

/**
 * Implements hook_form_install_configure_form_alter().
 */
function whereare_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = 'Where Are Julian & Debbie?';
}

/**
 * Implements hook_views_api().
 */
function whereare_views_api() {
  return array('api' => 3.0);
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