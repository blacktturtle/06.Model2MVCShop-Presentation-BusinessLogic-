<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@page import="com.model2.mvc.service.domain.*"%>
<%Purchase vo = (Purchase)request.getAttribute("vo"); %> --%>

<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/updatePurchaseView.do?tranNo=0" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purchase.purchaseProd.prodNo}</td>
<%-- 		<td><%=purchase.getPurchaseProd().getProdNo() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purchase.buyer.userId}</td>
<%-- 		<td><%=purchase.getBuyer().getUserId() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>���ż���</td>
		<td>${purchase.purQuantity} ��</td>
<%-- 		<td><%=purchase.getBuyer().getUserId() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
		
		<c:if test="${purchase.paymentOption =='1' }">
		${"���ݱ���"}		
		</c:if>
		<c:if test="${purchase.paymentOption !='1' }">
		${"�ſ뱸��"}		
		</c:if>
<%-- 		<%	if(purchase.getPaymentOption().equals(1)){%>
			<%="���ݱ���" %>
			<%}else{ %>
					<%="�ſ뱸��" %>
			<%} %> --%>
	
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purchase.receiverName}</td>
<%-- 		<td><%=purchase.getReceiverName() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purchase.receiverPhone}</td>
<%-- 		<td><%=purchase.getReceiverPhone() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purchase.divyAddr}</td>
<%-- 		<td><%=purchase.getDivyAddr() %></td> --%>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purchase.divyRequest}</td>
<%-- 		<td><%=purchase.getDivyRequest() %></td> --%>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<td>${purchase.divyDate}</td>
<%-- 		<td><%=purchase.getDivyDate() %></td> --%>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>