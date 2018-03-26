<%@ tag language="java" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page" %>
<%@ taglib prefix="fragment" tagdir="/WEB-INF/tags/fragment" %>
<!DOCTYPE html>
<html>
	<page:meta/>
	
	<head>
		
		<page:style/>
		
	</head>
		
	<body class="w3-light-grey w3-content" style="max-width:1600px">
		
		<fragment:nav/>
		
		<div class="w3-main" style="margin-left:300px">
			<fragment:header/>
		
			<jsp:doBody/>
		
			<fragment:footer/>
		</div>
		
		<page:script/>
	</body>
</html>