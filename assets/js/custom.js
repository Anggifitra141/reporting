/**
 *
 * You can write your JS code here, DO NOT touch the default style file
 * because it will make it harder for you to update.
 * 
 */

"use strict";
$('.access_cleansing_ltdbb, .access_cleansing_ltkl, .access_master_data, .access_ltdbb, .access_ltkl, .access_qris, .access_dana_float, .access_sipesat, .access_lkpbu, .access_lkpbu_302, .access_lkpbu_303, .access_lkpbu_304, .access_lkpbu_306, .access_lkpbu_309_310_311, .access_lkpbu_312, .access_lkpbu_313, .access_gangguan_system, .access_user_group, .access_user, .access_user_activity, .access_archive').hide();
var access_arr = access.split('#');
for (let index = 0; index < access_arr.length; index++) {
  var lkpbu = access_arr[index].split('_');
  if(lkpbu[0] == 'lkpbu'){
    $('.access_lkpbu').show();
  }
  $('.access_'+access_arr[index]).show();
  
  
}
