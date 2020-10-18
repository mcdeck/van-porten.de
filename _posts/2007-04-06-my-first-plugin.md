---

title: My first "Plugin"
date: 2007-04-06 00:55:00.000000000 +02:00
type: post
parent_id: '0'
published: true
status: publish
categories: []
tags: []
author: Oliver van Porten
redirect_from:
  - /2007/04/my-first-plugin/

excerpt: In this post we look at my first wordpress plugin
---
As you might have noticed I'm still struggeling with my theme choice. I'll be switching themes a lot soon but wanted to get started on integrating plugins (like, for instance, [Link Indication](http://sw-guide.de/wordpress/link-indication-plugin/) ). Some of those require adding CSS code though. I stumbeled upon one guide on how to preserve your CSS changes througout themes [HERE](http://www.pearsonified.com/2007/02/how_to_protect_css_mods_for_any_wordpress_theme.php) but that still required you to modify the template and that I did not want to do.

So I came up with this, my first, wordpress plugin. It allows you to add Custom CSS code to the "wp_head" action hook. This will basically preserve your precious CSS in the database while you can go on changing themes as you please .. at least as long as the theme author calls "the_head()" at some point, but that he (or she for that matter) should do in any case.

So now, here is a quick Copy & Paste version.

Simply save the file as "mcd_custom_css.php" into your plugin folder and active. Some kind of release coming tomorrow, though I doubt anyone will actually use this much.

``` php
<?php
/*
Plugin Name: Custom CSS Loader
Plugin URI: TBA
Description: A brief description of the plugin.
Version: 0.1
Author: Oliver van Porten
Author URI: http://www.van-porten.de
*/
?>
<?php
/* 
 Copyright 2007 Oliver van Porten  (email : info@van-porten.de)

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/                  
?>
<?php

function __mcd_custom_css_install() {
    add_option("mcd_custom_css", "");
}

function mcd_custom_css_header() {
    echo '<style type="text/css">';
    echo get_option( "mcd_custom_css" );
    echo '</style>';
}

function mcd_custom_css_add_admin_pages() {
    add_options_page( "Custom CSS Settings", "Custom CSS", 8, "mcd_cust_css_admin", "mcd_custom_css_settings" );
}

function mcd_custom_css_settings() {

    if( isset($_POST['custom_css']) ) {
        update_option( "mcd_custom_css", $_POST['custom_css'] );
    }

    echo <<<eot
 <div class="wrap">
 <h2>Custom CSS Editor</h2>
 {$message}
 <form name="form1" method="post" action="options-general.php?page=mcd_cust_css_admin">
 <fieldset class="options">
 <legend>Update your CSS Code</legend>
 <p>Insert your custom CSS into the box below. <em>DO NOT ADD &lt;script ..&gt; .. &lt;/script&gt;!</em></p>
 <textarea name="custom_css" rows="10" cols="25" style="width: 100%;">
EOT;
echo get_option( "mcd_custom_css" );
    echo <<<eot
</textarea>
 </fieldset>
 <p class="submit">
 <input type="submit" name="Submit" value="Save &raquo;" />
 </p>
 </form>
 </div>
EOT;
}

add_action('wp_head', 'mcd_custom_css_header');
add_action('activate_mcd_custom_css.php', '__mcd_custom_css_install');
add_action('admin_menu', 'mcd_custom_css_add_admin_pages');

?>
```

_Note to self: Always proof-read what you post!_