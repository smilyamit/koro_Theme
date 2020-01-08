<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */


/**
 * Smarty reverse_array modifier plugin
 *
 * Type:     modifier<br>
 * Name:     reverse_array<br>
 * Purpose:  reverse arrays
 * @author   Noel McGran
 * @param array
 * @return array
 */
function smarty_modifier_piran_rtrim($str, $char = ' ')
{
  $pos=strpos($str,$char);    
  if ($pos!==false)
  {
      //$char was found, so return everything up to it.
      return substr($str,0,$pos);
  }
  else
  {
      //this will return the original string if $char is not found.  if you wish to return a blank string when not found, just change $str to ''
      return $str;
  }
}

/* vim: set expandtab: */

?>
