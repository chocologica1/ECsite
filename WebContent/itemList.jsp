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
	<title>ItemList画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>商品一覧</h2>
			</div>
			<div>
				<s:if test="itemList.size() == 0">
					<h3>商品情報はありません。</h3>
				</s:if>

				<s:if test="itemList.size() > 0">
					<table border="1">
						<tr>
							<td></td>
							<th>商品名</th>
							<th>値段</th>
							<th>在庫数</th>
							<th>登録日</th>
						</tr>
						<s:iterator value="itemList">
							<tr>
								<td>
									<s:property value="id"/>
								</td>
								<td>
									<s:property value="itemName"/>
								</td>
								<td>
									<s:property value="itemPrice"/>
								</td>
								<td>
									<s:property value="itemStock"/>
								</td>
								<td>
									<s:property value="insertDate"/>
								</td>
							</tr>
						</s:iterator>
					</table>
					<s:form action="ItemListDeleteConfirmAction">
						<s:submit value="削除"/>
					</s:form>
				</s:if>
			</div>
			<div>
				<span>商品の登録は</span><a href='<s:url action="ItemCreateAction"/>'>こちら</a>
				<br><br>
				<span>管理者TOPへ戻る場合は</span><a href='<s:url action="AdminAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>