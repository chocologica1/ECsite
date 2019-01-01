<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<link rel="stylesheet" type="text/css" href="./css/item.css" />
	<title>Item画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品一覧</h2>
			</div>
			<div class="items-wrapper">
				<s:iterator value="itemList">
					<div class="item-box">
						<div class="item-image">
							<img src='./image/item/<s:property value="id"/>.png' class="image" alt="item"/>
						</div>
						<div class="item-info">
							<span><s:property value="itemName"/></span>
							<span>¥<s:property value="itemPrice"/></span>
						</div>
						<div class="item-select">
							<s:form action="ItemSelectAction" theme="simple">
								<input type="hidden" name="id" value='<s:property value="id"/>'/>
								<s:submit value="購入ページへ"/>
							</s:form>
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>