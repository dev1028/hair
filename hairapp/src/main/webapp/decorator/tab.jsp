<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<style>
.tab-wrapper {
  margin: 60px auto;
  width: 70%;
  max-width:500px;
}

.tab-menu li {
  position:relative;
  background-color: #f9f9f9;
  color:#bcbcbc;
  display: inline-block;
  padding: 20px 40px;
  opacity: 0.8;
  cursor:pointer;
  z-index:0;
}

.tab-menu li:hover {
  color:#464646;
}

.tab-menu li.active {
  color:#464646;
  opacity: 1;
}

.tab-menu li.active:hover {
  color:#464646;
}

.tab-content>div {
  background-color: #fff;
  box-sizing:border-box;
  width: 100%;
  padding: 50px;   
  min-height:200px;
}

.line {
  position:absolute;
  width: 0;
  height: 7px;
  background-color: aqua;
  top: 0;
  left: 0;
}

</style>
<script>
$(document).ready(function() {
	  
	  var $wrapper = $('.tab-wrapper'),
	      $allTabs = $wrapper.find('.tab-content > div'),
	      $tabMenu = $wrapper.find('.tab-menu li'),
	      $line = $('<div class="line"></div>').appendTo($tabMenu);
	  
	  $allTabs.not(':first-of-type').hide();  
	  $tabMenu.filter(':first-of-type').find(':first').width('100%')
	  
	  $tabMenu.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $allTabs.each(function(i) {
	    $(this).attr('data-tab', 'tab'+i);
	  });
	  
	  $tabMenu.on('click', function() {
	    
	    var dataTab = $(this).data('tab'),
	        $getWrapper = $(this).closest($wrapper);
	    
	    $getWrapper.find($tabMenu).removeClass('active');
	    $(this).addClass('active');
	    
	    $getWrapper.find('.line').width(0);
	    $(this).find($line).animate({'width':'100%'}, 'fast');
	    $getWrapper.find($allTabs).hide();
	    $getWrapper.find($allTabs).filter('[data-tab='+dataTab+']').show();
	  });

	});//end ready
</script>
</head>
<body>

<div class="tab-wrapper">
  
  <ul class="tab-menu">
    <li class="active">tab #1</li>
    <li>tab #2</li>
    <li>tab #3</li>
  </ul>
  
  <div class="tab-content">
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis exercitationem minima quisquam ex earum sapiente, debitis ipsum quidem optio rerum!</div>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veritatis nostrum, blanditiis, quia maiores nisi. Expedita cupiditate similique magnam, adipisci nesciunt, laborum rem! Excepturi, ad.</div>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, ad esse. Hic at officiis fuga mollitia quod.</div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->



<div class="tab-wrapper">
  
  <ul class="tab-menu">
    <li class="active">tab #1</li>
    <li>tab #2</li>
    <li>tab #3</li>
  </ul>
  
  <div class="tab-content">
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis exercitationem minima quisquam ex earum sapiente, debitis ipsum quidem optio rerum!</div>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veritatis nostrum, blanditiis, quia maiores nisi. Expedita cupiditate similique magnam, adipisci nesciunt, laborum rem! Excepturi, ad.</div>
    <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quis, ad esse. Hic at officiis fuga mollitia quod.</div>
  </div><!-- //tab-content -->
  
</div><!-- //tab-wrapper -->



</body>
</html>