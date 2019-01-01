<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>Admin画面</title>
	<style type="text/css">
	/* ======flexbox====== */
		.flex {
			width: 100%;
			display: flex;
			justify-content: center;
			margin-bottom: 30px;
		}

		.box {
			width: 160px;
			height: 160px;
			margin: 0 32px;
			background-color: lightgray;
			padding-top: 10px;
		}

		.center{
			width: 100px;
			margin: 0 auto;
		}

		.button {
			width: 100px;
		}

	</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>管理者用画面</h2>
			</div>
			<div class="flex">
				<div class="box">
					<p>商品</p>
					<div class="center">
						<s:form action="ItemCreateAction">
							<s:submit value="新規登録" cssClass="button"/>
						</s:form>
						<s:form action="ItemListAction" >
							<s:submit value="一覧" cssClass="button"/>
						</s:form>
					</div>
				</div>
				<div class="box">
					<p>ユーザー</p>
					<div class="center">
						<s:form action="UserCreateAction">
							<s:submit value="新規登録" cssClass="button"/>
						</s:form>
						<s:form action="UserListAction">
							<s:submit value="一覧" cssClass="button"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<span>Homeに戻る場合は</span><a href ='<s:url action="LogoutAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>