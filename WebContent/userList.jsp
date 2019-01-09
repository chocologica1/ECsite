<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<link rel="stylesheet" type="text/css" href="./css/list.css"/>
<link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	rel="stylesheet">
<title>ユーザー管理</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="index">
				<h2>ユーザー一覧</h2>
			</div>
			<div>
				<s:if test="userList.size() <= 0">
					<div class="info">
						<p>ユーザー情報はありません。</p>
					</div>
				</s:if>

				<s:if test="userList.size() > 0">
					<table>
						<tr>
							<th>ログインID</th>
							<th>パスワード</th>
							<th>ユーザー名</th>
							<th>登録日</th>
						</tr>
						<s:iterator value="userList">
							<tr>
								<td><s:property value="loginId" /></td>
								<td><s:property value="Password" /></td>
								<td><s:property value="userName" /></td>
								<td><s:property value="insertDate" /></td>
							</tr>
						</s:iterator>
					</table>
					<s:form action="UserListDeleteConfirmAction" cssClass="center-button-box">
						<s:submit value="全削除" cssClass="button"/>
					</s:form>
				</s:if>
			</div>
			<div>
				<s:form action="AdminAction" cssClass="return-button-box">
					<s:submit value="＞管理者トップに戻る" cssClass="return-button" />
				</s:form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>