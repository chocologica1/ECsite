<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/style.css"/>
	<link rel="stylesheet" type="text/css" href="./css/list.css" />
	<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
	<title>ユーザー削除確認</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ユーザー削除</h2>
			</div>
			<div>
				<h3>以下のユーザーを削除します。よろしいですか。</h3>
				<br>
				<table>
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
				<div class="center-flex-box">
					<div class="flex-button-box">
						<s:form action="UserListAction">
							<s:submit value="キャンセル" cssClass="button back"/>
						</s:form>
					</div>
					<div class="flex-button-box">
						<s:form action="UserListDeleteCompleteAction">
							<s:submit value="OK" cssClass="button"/>
						</s:form>
					</div>
				</div>
			</div>
			<div>
				<s:form action="AdminAction" cssClass="return-button-box">
					<s:submit value="＞管理者トップに戻る" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true"/>
</body>
</html>