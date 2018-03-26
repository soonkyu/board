<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<layout:main_layout>
<!-- First Photo Grid-->
	<div id='resent'>
	  <div class="w3-row-padding">
	    <c:forEach begin="1" end="3">
		    <div class="w3-third w3-container w3-margin-bottom">
		      <img src="resources/img/cha_Moomin.png" alt="Norway" style="width:100%" class="w3-hover-opacity">
		      <div class="w3-container w3-white" style="text-align: center;">
		        <p ><b>최 순 규</b></p>
		        <p>최근 파일들로 test 중</p>
		      </div>
		    </div>
	    </c:forEach>
	  </div>
	  <!-- Second Photo Grid-->
	  <div class="w3-row-padding">
	  	<c:forEach begin="1" end="3">
		    <div class="w3-third w3-container w3-margin-bottom">
		      <img src="resources/img/cha_Snorkmaiden.png" alt="Norway" style="width:100%" class="w3-hover-opacity">
		      <div class="w3-container w3-white" style="text-align: center;">
		        <p><b>이 정 윤</b></p>
		        <p>최근 파일들로 test 중</p>
		      </div>
		    </div>
	    </c:forEach>
	  </div>
	</div>
  <!-- Images of Me -->
  <div class="w3-row-padding w3-padding-16" id="about">
    <div class="w3-col m6">
      <img src="resources/img/myImg.png" alt="Me" style="width:100%">
    </div>
    <div class="w3-col m6">
      <img src="resources/img/myImgTwo.png" alt="Me" style="width:100%">
    </div>
  </div>

<div class="w3-container w3-padding-large" style="margin-bottom:32px">
     <span style="font-size:150px;line-height:0.6em;opacity:0.2;position:  relative;left: 31%;top: 50px;">❝</span>
    <h4 style="text-align:  center;">
    <b> my story is coming soon~~ </b>
    </h4>
    <p style="text-align:  center;font-size:  22px;">
    0000/00/00 을 시작으로 내 이야기는 펼쳐진다.<br>하염없이 흘러가는 시간을 잠깐이나마 붙잡아보기를 희망하며,<br>오늘도 끄적 끄적 한 자 한 자 적어본다.
    </p>
     <span style="font-size:150px;line-height:0.6em;opacity:0.2;position:  relative;left: 60%;top: 50px;">❞</span>
    <hr>
    
    
    <h4 style="text-align: center;font-size: 25px;margin-top: 52px;margin-bottom: 33px;">보유 기술  학습 진행 상황</h4>
    <!-- Progress bars / Skills -->
    <p>JAVA</p>
    <div class="w3-grey">
      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:10%">10%</div>
    </div>
    <p>SPRING</p>
    <div class="w3-grey">
      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:10%">10%</div>
    </div>
    <p>DATABASE</p>
    <div class="w3-grey">
      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:10%">10%</div>
    </div>
    <p>NETWORK</p>
    <div class="w3-grey">
      <div class="w3-container w3-dark-grey w3-padding w3-center" style="width:10%">10%</div>
    </div>
    <hr>

  </div>
  
  <!-- Contact Section -->
  <div class="w3-container w3-padding-large w3-grey">
    <h4 id="contact"><b>Contact Me</b></h4>
    <div class="w3-row-padding w3-center w3-padding-24" style="margin:0 -16px">
      <div class="w3-third w3-dark-grey">
        <p><i class="fa fa-envelope w3-xxlarge w3-text-light-grey"></i></p>
        <p>email@email.com</p>
      </div>
      <div class="w3-third w3-teal">
        <p><i class="fa fa-map-marker w3-xxlarge w3-text-light-grey"></i></p>
        <p>Chicago, US</p>
      </div>
      <div class="w3-third w3-dark-grey">
        <p><i class="fa fa-phone w3-xxlarge w3-text-light-grey"></i></p>
        <p>512312311</p>
      </div>
    </div>
    <hr class="w3-opacity">
    <form action="/action_page.php" target="_blank">
      <div class="w3-section">
        <label>Name</label>
        <input class="w3-input w3-border" type="text" name="Name" required>
      </div>
      <div class="w3-section">
        <label>Email</label>
        <input class="w3-input w3-border" type="text" name="Email" required>
      </div>
      <div class="w3-section">
        <label>Message</label>
        <input class="w3-input w3-border" type="text" name="Message" required>
      </div>
      <button type="submit" class="w3-button w3-black w3-margin-bottom"><i class="fa fa-paper-plane w3-margin-right"></i>Send Message</button>
    </form>
  </div>
<!-- End page content -->

</layout:main_layout>