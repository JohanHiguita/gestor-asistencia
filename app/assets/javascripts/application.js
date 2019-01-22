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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage


//= require sbadmin/jquery.easing.min
//= require sbadmin/jquery.dataTables
//= require sbadmin/dataTables.bootstrap4
//= require sbadmin/sb-admin.min
//= require sbadmin/datatables-demo
$(function() {
  // toggle behavior of sidebar
  $("#sidebarToggle, .btn-sidebar").on("click", function () {
  	//alert("P");
  	$( "ul.sidebar" ).toggleClass("toggled");
  	$( "body" ).toggleClass("sidebar-toggled");
  	$(".chevron-sidebar").toggleClass("fa-chevron-left");
  	$(".chevron-sidebar").toggleClass("fa-chevron-right");
  });


});


