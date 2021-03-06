<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>

/*Hide menu by default*/
$("#menu").hide();

/*When menu button is clicked, toggle the menu*/
$("#menu-btn").click(function(){
  $("#menu").slideToggle();
});

</script>
<style>

html, body{ margin: 0; padding: 0; font-family: 'Helvetica Neue'; background: #4a437a; }

/*Menu toggle button*/
#menu-btn{ 
  position: absolute; left: 1em; top: 1em;
  width: 3em;
  padding: 1.5em;
  border-radius: 100%;
  transition: all .2s ease-out;
}
  /*Cursor on toggle button hover*/
  #menu-btn:hover{ cursor: pointer; }
  /*Changing color of hamburger lines on hover*/
  #menu-btn:hover .menu-line{ background-color: #999999; }

  #menu-btn:active{ box-shadow: 0 0 5px black; background-color: #524a88; }

  /*Styles for the hamburger lines*/
  .menu-btn-line{ 
    height: .5em; 
    background-color: #00FFCA; 
    margin-bottom: .5em; 
  }
  /*No margin-bottom for last hamburger line.*/
  .menu-btn-line:last-child{ margin-bottom: 0; }

/*List container*/
#menu{ 
  position: absolute; 
  top: 7em; left: 1em; 
  border: .5em solid #00FFCA; 
  width: 10em;
  padding: 1em;
}
  /*List*/
  #menu ul{ padding: 0; margin: 0; }
    /*List items*/
    #menu ul li{ 
      list-style-type: none; 
      left: 0; 
      padding: .5em;
      color: #00FFCA;
      transition: all .3s ease-out;
    }
    /*Subscribe link*/
    #menu ul li:last-child{
      margin-top: .5em;
      padding-top: 1em;
      border-top: 1px solid #00FFCA;
    } 
      /*Cursor and text undelrine on hover*/
      #menu ul li:hover{
        cursor: pointer;
        text-decoration: underline;
      }
      /*Background and text colour change on click*/
      #menu ul li:active{
        background-color: #00FFCA;
        color: rgba(52, 73, 94,1.0);
      }

</style>
</head>
<body>

<!--Hamburger menu toggle button-->
  <div id="menu-btn">
      <div class="menu-btn-line"></div>
      <div class="menu-btn-line"></div>
      <div class="menu-btn-line"></div>
  </div>
  
  <!--Menu-->
  <nav id="menu">
      <ul>
          <li>What we do</li>
          <li>About us</li>
          <li>Data sets</li>
          <li>Share your data</li>
          <li>Latest news</li>
          <li>Contact</li>
          <li>Subscribe</li>
      </ul>
  </nav>

</body>
</html>