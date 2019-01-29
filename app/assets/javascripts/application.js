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

  $('.select_school_session').change(function(){
  	var school_id = $('.select_school_session option:selected').val();
    $.ajax({
     url: "/class_sessions/find/students_selection",
     type: "GET",
     data: {school_id: school_id}
   })
  });

    // $(".btn-edit-session").on("click", function(){
    
      
    // });


 


});


