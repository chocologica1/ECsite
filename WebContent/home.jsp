<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html;charset=utf-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.12/jquery.bxslider.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<title>Home画面</title>
	<!-- スライドショー -->
	<script>
		$(document).ready(function(){
		   $('.slide').bxSlider({
			   auto: true,
			   mode: 'horizontal',
			   speed: 4000
		   });
		 });
	</script>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="top-wrapper">
			<div class="container">
				<s:if test="userName != null">
					<div class="welcome-message">
						<h4><s:property value="#session.userName"/>さん　ようこそ</h4>
					</div>
				</s:if>
				<div class="top-image">
					<!-- スライドショー -->
					<div class="slide">
						<div><img src="./image/slide/top2.jpg" alt="top"/></div>
						<div><img src="./image/slide/top1.jpg" alt="top" /></div>
						<div><img src="./image/slide/top4.jpg" alt="top" /></div>
						<div><img src="./image/slide/top3.jpg" alt="top" /></div>
					</div>
				</div>
			</div>
		</div>
		<div class="contents-wrapper">
	 		<div class="container">
	 			<s:form action="ItemAction" cssClass="menu-box">
					<s:submit value="GOODS" type="button" cssClass="menu-button"/>
				</s:form>
				<s:if test="#session.login_user_id == null">
					<s:form action="LoginConfirmAction" cssClass="menu-box">
						<s:submit value="LOGIN" type="button" cssClass="menu-button"/>
					</s:form>
				</s:if>
				<s:elseif test="#session.login_user_id != null">
					<s:form action="MyPageAction" cssClass="menu-box">
						<s:submit value="MY PAGE" type="button" cssClass="menu-button"/>
					</s:form>
				</s:elseif>
				<s:form action="AdminAction" cssClass="menu-box">
					<s:submit value="ADMIN" type="button" cssClass="menu-button"/>
				</s:form>
			</div>
	 	</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>