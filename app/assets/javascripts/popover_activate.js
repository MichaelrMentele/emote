$(window).load(function () { 
  $('[data-toggle="popover"]').popover().click(function(e) {
    e.preventDefault();
  })
})