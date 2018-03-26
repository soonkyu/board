<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
  <!-- Header -->
  
  <header id="portfolio">
    <a href="#"><img src="/resources/img/avata.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
    <h1><b>IT 타파</b></h1>
    <div class="w3-bar w3-bottombar w3-white w3-padding-16">
      <button class="w3-bar-item w3-button w3-black" onclick="javascript:location.href='/'" id="resent">Resent</button>
      <button class="w3-bar-item w3-button w3-hide-small" onclick="brdTypeView(this.id)" id="java"><i class="fa fa-language w3-margin-right"></i>JAVA</button>
      <button class="w3-bar-item w3-button w3-hide-small" onclick="brdTypeView(this.id)" id="network"><i class="fa fa-sitemap w3-margin-right"></i>Network</button>
      <button class="w3-bar-item w3-button w3-hide-small" onclick="brdTypeView(this.id)" id="database"><i class="fa fa-database w3-margin-right"></i>DataBase</button>
      <button class="w3-bar-item w3-button w3-hide-small" onclick="brdTypeView(this.id)" id="spring"><i class="fa fa-leaf w3-margin-right"></i>SPRING</button>
      <button class="w3-bar-item w3-button w3-hide-small" onclick="brdTypeView(this.id)" id="mydiary"><i class="fa fa-book w3-margin-right"></i>MY Diary</button>
      <button class="w3-bar-item w3-button w3-hide-large w3-hide-medium" onclick="myFunction()">&#9776;</button>
    </div>
    </div>
    
    <div id="mobilebar" class="w3-bar-block w3-red w3-hide w3-hide-large w3-hide-medium ">
  	  <button class="w3-bar-item w3-button w3-white" onclick="brdTypeView(this.id)" id="java"> <i class="fa fa-language w3-margin-right"></i>JAVA</button>
      <button class="w3-bar-item w3-button w3-white" onclick="brdTypeView(this.id)" id="network"> <i class="fa fa-sitemap w3-margin-right"></i>Network</button>
      <button class="w3-bar-item w3-button w3-white" onclick="brdTypeView(this.id)" id="database"> <i class="fa fa-database w3-margin-right"></i>DataBase</button>
      <button class="w3-bar-item w3-button w3-white" onclick="brdTypeView(this.id)" id="spring"> <i class="fa fa-leaf w3-margin-right"></i>SPRING</button>
      <button class="w3-bar-item w3-button w3-white" onclick="brdTypeView(this.id)" id="mydiary"> <i class="fa fa-book w3-margin-right"></i>MY Diary</button>
	</div>
  </header>
  
  