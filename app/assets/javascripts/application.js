// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require bootstrap-sprockets
//= require_tree .
//= require popper



 $(function(){
    $('#user_profile_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#preview").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
    });
  });
  
  
  
  $('#post_post_images_post_images').on('change', function (e) {
    if(e.target.files.length > 5){
      alert('一度に投稿できるのは五枚までです。');
      $('#post_post_images_post_images').val = "";
      for( let i = 0; i < 5; i++) {
        $(`#preview_${i}`).attr('src', "");
      }
    }else{
      let reader = new Array(5);
      for( let i = 0; i < 5; i++) {
        $(`#preview_${i}`).attr('src', "");
      }

      for(let i = 0; i < e.target.files.length; i++) {
        reader[i] = new FileReader();
        reader[i].onload = finisher(i,e); 
        reader[i].readAsDataURL(e.target.files[i]);
        function finisher(i,e){
          return function(e){
          $(`#preview_${i}`).attr('src', e.target.result);
          }
        }
      }
   }
});
