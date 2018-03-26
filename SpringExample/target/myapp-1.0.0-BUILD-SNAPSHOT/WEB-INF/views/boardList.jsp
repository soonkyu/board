<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<layout:main_layout>

<!-- !PAGE CONTENT! -->
	<div align="center" style="position:  relative;top: 20%;">
				<h2>${map.title} 게시판입니다~</h2>	    		
		<div class="w3-row-padding w3-margin-top">
			<c:forEach begin="0" end="1">
				<div class="w3-card-4 w3-white w3-half">
				    <img src="/resources/img/default_moomin.png" alt="Nature" style="width:100%">
				    <div class="w3-container">
				      <h3><b>대 제목</b></h3>
				      <h5>By Web꼬맹이, <span class="w3-opacity">게시한 날짜</span></h5>
				    </div>
				
				    <div class="w3-container">
				      <p>컨텐츠가 들어가는 부분 </p>
				      <div class="w3-row">
				        <div class="w3-col m2 s12">
				          <p><button class="w3-button w3-padding-large w3-white w3-border"><b>더 보기 »</b></button></p>
				        </div>
				        <div class="w3-col m10 w3-hide-small">
				          <p><span class="w3-padding-large w3-right"><b>Comments &nbsp;</b> <span class="w3-tag">2</span></span></p>
				        </div>
				      </div>
				    </div>
				  </div>
			</c:forEach>
			</div>	    		
	    		<table class="w3-table w3-bordered" style="margin-top: 6%;">
	    			<tr>
	    				<th width="50px">
	    					No
	    				</th>
	    				<th width="850px">
	    					제목
	    				</th>
	    				<th width="100px">
	    					작성자
	    				</th>
	    				<th width="200px">
	    					작성일
	    				</th>
	    			</tr>
	    			<c:choose>
			        	<c:when test="${fn:length(map.boardList) == 0}">
			            	<tr>
			            		<td colspan="4" align="center">
			            			조회결과가 없습니다.
			            		</td>
			            	</tr>
			           	</c:when>
			           	<c:otherwise>
			            	<c:forEach var="boardList" items="${map.boardList}" varStatus="status">
								<tr>
						    		<td align="center">${boardList.idx}</td>
						    		<td>
						    			<a style='text-decoration: none;'href="javascript:detailView(${boardList.idx})">${boardList.title}</a>
						    		</td>
						    		<td align="center">${boardList.name}</td>
						    		<td align="center">${boardList.currentdate}</td>
						    	</tr>
						    </c:forEach>
						     <tr>
					            <td colspan="5" style="text-align:  center;">
					                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
					                <c:if test="${map.boardPager.curBlock > 1}">
					                    <a style="text-decoration:none" href="javascript:list('1')">[처음]</a>
					                </c:if>
					                
					                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
					                <c:if test="${map.boardPager.curBlock > 1}">
					                    <a style="text-decoration:none" href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
					                </c:if>
					                
					                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
					                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					                    <!-- **현재페이지이면 하이퍼링크 제거 -->
					                    <c:choose>
					                        <c:when test="${num == map.boardPager.curPage}">
					                            <span style="color: red">${num}</span>&nbsp;
					                        </c:when>
					                        <c:otherwise>
					                            <a style="text-decoration:none" href="javascript:list('${num}')">${num}</a>&nbsp;
					                        </c:otherwise>
					                    </c:choose>
					                </c:forEach>
					                
					                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
					                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					                    <a style="text-decoration:none"  href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
					                </c:if>
					                
					                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
					                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					                    <a style="text-decoration:none" href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
					                </c:if>
					            </td>
					        </tr>
			           	</c:otherwise> 
			    	</c:choose>
	    	</table>
	    <br>
	</div>
<!-- End page content -->

</layout:main_layout>