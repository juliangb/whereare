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