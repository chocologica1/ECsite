<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<title>UserListDeleteConfirm画面</title>
</head>
	<style type="text/css">
		.center {
			display: flex;
			width: 160px;
			margin: auto;
		}

		.button {
			width: 80px;
			padding-bottom: 30px;
		}

	</style>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ユーザー削除</h2>
			</div>
			<div>
				<h3>以下のユーザーを削除します。よろしいですか。</h3>
				<table border="1">
					<tr>
						<th>ログインID</th>
						<th>パスワード</th>
						<th>ユーザー名</th>
						<th>登録日</th>
					</tr>
					<s:iterator value="deleteUserList">
						<tr>
							<td>
								<s:property value="loginId"/>
							</td>
							<td>
								<s:property value="Password"/>
							</td>
							<td>
								<s:property value="userName"/>
							</td>
							<td>
								<s:property value="insertDate"/>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div>
				<div class="center">
					<div class="button">
						<s:form action="UserListAction">
							<s:submit value="キャンセル"/>
						</s:form>
					</div>
					<div class="button">
						<s:form action="UserListDeleteCompleteAction">
							<s:submit value="OK"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				管理者TOPへ戻る場合は<a href='<s:url action="AdminAction"/>'>こちら</a>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>