<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/form.css"/>
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>商品追加</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品追加</h2>
			</div>
			<div>
				<!-- ItemCreateConfirmActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="errorMessage != ''">
					<div class="error">
						<s:property value="errorMessage"/>
					</div>
				</s:if>
				<!-- ItemCreateCompleteActionの返り値がerrorの時エラーメッセージを表示 -->
				<s:if test="itemCreateError != ''">
					<div class="error">
						<s:property value="itemCreateError"/>
					</div>
				</s:if>

				<s:form action="ItemCreateConfirmAction">
					<div class="color-box login-wrapper">
						<div class="login-box">
							<label>商品名</label><br>
							<input type="text" name="itemName" class="input-field" autocomplete="off"/>
							<br>
							<label>価格</label><br>
							<input type="text" name="itemPrice" class="input-field number"  autocomplete="off" value="円" />
							<br>
							<label>在庫</label><br>
							<input type="text" name="itemStock" class="input-field number" autocomplete="off" value="個"/>
						</div>
						<div class="user-box">
							<label>画像ファイル名</label><br>
							<input type="text" name="imageFileName" class="input-field" autocomplete="off" placeholder="noimage.jpg"/>
							<br>
<!-- 							<label>カテゴリー</label><br> -->
<%-- 							<s:select name="categoryId" cssClass="category-select" --%>
<%-- 								list="categoryList" listValue="categoryName" listKey="categoruId"/> --%>
							<div class="center-button-box bottom">
								<s:submit value="登録" cssClass="button"/>
							</div>
						</div>
					</div>
				</s:form>
				<s:form action="AdminAction" cssClass="return-button-box">
					<s:submit value="＞管理者トップに戻る" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>