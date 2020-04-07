$(function(){
    var $btn = $('#toggle-btn');
    var $side = $('#side');
    $btn.on( 'click', function() {
        if ( ! $side.hasClass('open') ) {
          $side.addClass('open');
        } else {
          $side.removeClass('open');
        }
      });
});