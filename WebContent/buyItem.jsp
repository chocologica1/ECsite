<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html;charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="imagetoolbar" content="no" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>BuyItem画面</title>
</head>
<body>
	<jsp:include page="header.jsp" flush="true" />
	<div id="main">
		<div class="container">
			<div class="buyitem-flex">
				<div class="image-column">
					<img src="./image/item/<s:property value='#session.id'/>.png"
						alt="item" class="buyitem-image" />
				</div>
				<div class="item-column">
					<div>
						<h2 class="buyitem-name">
							<s:property value="#session.buyItem_name" />
						</h2>
						<p class="buyitem-category">ここにカテゴリを表示予定</p>
						<p class="buyitem-price">
							¥<s:property value="#session.buyItem_price" />(税込)
						</p>
						<!-- 売り切れ -->
						<s:if test="itemStock <= 0">
							<div class="message-wrapper">
								<h4 class="error">
									<s:property value="soldOutMessage" />
								</h4>
							</div>
						</s:if>
						<!-- 未ログイン -->
						<s:elseif test="#session.login_user_id == null">
							<div class="message-wrapper">
								<h4>
									購入するには<a href='<s:url action="LoginConfirmAction"/>'>ログイン</a>が必要です。
								</h4>
							</div>
						</s:elseif>
						<!-- ログイン時在庫あり -->
						<s:elseif test="#session.login_user_id != null">
							<s:form action="CartAction" theme="simple">
								<div class="cart-wrapper">
									<div class="count-box">
										<p>
											数量: <select name="count">
												<option value="1" selected="selected">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select> 個
										</p>
									</div>
									<div class="cart-box">
										<s:submit value="カートに入れる" type="button" cssClass="cart-button" />
									</div>
									<!-- 在庫エラーがあったら表示される -->
									<h4 class="stock-error">
										<s:property value="stockMessage" />
									</h4>
								</div>
							</s:form>
						</s:elseif>
					</div>
					<div class="itemselect-box">
						<s:form action="ItemAction" theme="simple">
							<s:submit value="＞商品一覧へもどる" cssClass="itemselect-button"/>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="true" />
</body>
</html>