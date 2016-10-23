$(function() {

  $('#sprinkles-show').on("click", function(e) { 
    e.preventDefault();
    $('#sprinkles-form').removeClass('hide');
    $('#story-form').addClass('hide')
  });

  $('#story-show').on("click", function(e) { 
    e.preventDefault();
    $('#sprinkles-form').addClass('hide');
    $('#story-form').removeClass('hide')
  });

});