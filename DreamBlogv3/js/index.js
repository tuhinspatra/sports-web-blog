var $item = $('.carousel .item'); 
var $wHeight = $(window).height();
$item.eq(0).addClass('active');
$item.height($wHeight); 
$item.addClass('full-screen');
$('p.lead').each(function(){
  $(this).css({'text-shadow':'0px 0px 8px black','font-size':'180%'});
});

//collapse .right-head for small screens
function collap()
{
  var $wWidth = $(window).width();
  $instr = '<li><a href="login.php">Login</a></li>\
          <li><a href="signup.php">Sign Up</a></li>\
          <li class="active"><a href="#">About Us</a></li>';
  if($wWidth < 500)
  {
    $str = '<span class="dropdown"><button class="btn btn-warning dropdown-toggle" data-toggle="dropdown">\
    <span class="glyphicon glyphicon-menu-hamburger"></span>&nbsp;<span class="glyphicon glyphicon-chevron-down"></span></button>\
    <ul class="dropdown-menu">'+$instr+'</ul></span>';
    $('.right-head').html($str);
    $('.right-head li').css('display','block');
  }
  else
  {
    $str = '<ul class="masthead-nav">' + $instr + '</ul>';
    $('.right-head').html($str);
    $('.right-head li').css('display','inline');

  }
}
collap();
$('.carousel img').each(function() {
  var $src = $(this).attr('src');
  var $color = $(this).attr('data-color');
  $(this).parent().css({
    'background-image' : 'url(' + $src + ')',
    'background-color' : $color
  });
  $(this).remove();
});

$(window).on('resize', function (){
  collap();
  $wHeight = $(window).height();
  $item.height($wHeight);

});

$('.carousel').carousel({
  interval: 6000,
  pause: "false"
});
