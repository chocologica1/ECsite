<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/form.css" />
<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	rel="stylesheet">
<title>商品追加確認</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品追加</h2>
			</div>
			<div class="color-box">
				<p>ご登録内容は以下でよろしいですか。</p>
				<br>
				<table class="confirm-box">
					<s:form action="ItemCreateCompleteAction" theme="simple">
						<tr>
							<td><label>商品名</label></td>
							<td><s:property value="#session.itemName" /></td>
						</tr>
						<tr>
							<td><label>値段</label></td>
							<td><s:property value="#session.itemPrice" /> 円</td>
						</tr>
						<tr>
							<td><label>在庫</label></td>
							<td><s:property value="#session.itemStock" /> 個</td>
						</tr>
						<tr>
							<td><label>画像ファイル名</label></td>
							<td>
								<s:property value='#session.imageFileName' />
								<br>
								<div class="image-box">
									<p>プレビューが表示されます</p>
									<img
										src="./image/item/<s:property value='#session.imageFileName'/>"
										alt="preview" class="image" />
								</div></td>
						</tr>
						<!-- 					<tr> -->
						<!-- 						<td><label>カテゴリー</label></td> -->
						<%-- 						<td><s:property value="#session.categoryName"/></td> --%>
						<!-- 					</tr> -->
					</s:form>
				</table>
				<div class="center-flex-box">
					<div class="flex-button-box">
						<s:form action="ItemCreateAction">
							<s:submit value="戻って修正する" cssClass="button back" />
						</s:form>
					</div>
					<div class="flex-button-box">
						<s:form action="ItemCreateCompleteAction">
							<s:submit value="完了" cssClass="button" />
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>