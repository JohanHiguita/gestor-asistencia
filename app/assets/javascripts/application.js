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

  //Alertas:
  $(".alert").fadeIn(500).css("opacity", "0.85").delay(4000).slideUp(1000);
  $(".alerts").on('click','.alert', function(){$(this.remove())});


  // toggle behavior of sidebar
  $("#sidebarToggle, .btn-sidebar").on("click", function () {
  	//alert("P");
  	$( "ul.sidebar" ).toggleClass("toggled");
  	$( "body" ).toggleClass("sidebar-toggled");
  	$(".chevron-sidebar").toggleClass("fa-chevron-left");
  	$(".chevron-sidebar").toggleClass("fa-chevron-right");
  });

  // Show students when changes schools select
  $('.select_school_session').change(function(){
  	var school_id = $('.select_school_session option:selected').val();
    $.ajax({
     url: "/class_sessions/find/students_selection",
     type: "GET",
     data: {school_id: school_id}
   })
  });

  
  // Suggest value to code of school depends on level
  if($('#school_level').val() == "pri"){
    $('input#school_code').val("PRI-");
  }else{
    $('input#school_code').val("SEC-");
  }

  $('#school_level').change(function(){
    if($('#school_level').val() == "pri"){
     $('input#school_code').val("PRI-");
   }else{
    $('input#school_code').val("SEC-");
  }
  $('input#school_code').focus();
  });

  // $(".btn-download").on("click", function()  {
  //   $("#generate-assistance-modal").modal('hide');
  //   alert("Oe");

  // });

  // $( ".form-download" ).submit(function( event ) {
  //   $("#generate-assistance-modal").modal('hide');
  //   alert( "Handler for .submit() called." );
  //   event.preventDefault();
  // });

  


});


