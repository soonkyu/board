<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <img src="/resources/img/avata.jpg" style="width:70%;" class="w3-round"><br><br>
    <h4><b style="font-size: 25px">Welcome My Hole</b></h4>
    <p class="w3-text-grey">Create by Web꼬맹이</p>
  </div>
  <div class="w3-bar-block">
    <a href="/#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>IT공부</a> 
    <a href="/#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>내 일상속이야기</a> 
    <a href="/#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
  </div>
  <div class="w3-panel w3-large">
    <i class="fa fa-facebook-official w3-hover-opacity" style="font-size:  30px;"></i>
    <i class="fa fa-instagram w3-hover-opacity" style="font-size:  30px;"></i>
    <i class="fa fa-twitter w3-hover-opacity" style="font-size:  30px;"></i>
    <i class="fa fa-linkedin w3-hover-opacity" style="font-size:  30px;"></i>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>