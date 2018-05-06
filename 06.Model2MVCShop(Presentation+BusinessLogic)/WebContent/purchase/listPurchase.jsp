<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- <%@page import="com.model2.mvc.service.product.impl.ProductServiceImpl"%>
<%@page import="com.model2.mvc.service.product.ProductService"%>
<%@page import="com.model2.mvc.service.product.dao.ProductDAO"%>
<%@ page import="java.util.List"  %>
<%@page import="com.model2.mvc.service.purchase.impl.PurchaseServiceImpl"%>
<%@page import="com.model2.mvc.service.purchase.PurchaseService"%>
<%@page import="com.model2.mvc.service.purchase.dao.PurchaseDAO"%>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	User user = (User)session.getAttribute("user");
	List<Purchase> list= (List<Purchase>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	Search search=(Search)request.getAttribute("search"); 
	//==> null �� ""(nullString)���� ����
	
%>
 --%>


<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listPurchase.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
<%-- 		<td colspan="11">��ü <%=resultPage.getTotalCount() %> �Ǽ�, ���� <%= resultPage.getCurrentPage() %> ������</td> --%>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">���ż���</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="808285" height="1"></td>
	</tr>
	
	
	
	
	<%-- <% 	
		for(int i=0; i<list.size(); i++) {
			Purchase vo = (Purchase)list.get(i);
					
		PurchaseService purchaseService = new PurchaseServiceImpl();
		ProductService productService = new ProductServiceImpl();
				
		Purchase purchase =  purchaseService.getPurchase(vo.getTranNo());
		
		Product product = productService.getProduct2(vo.getTranNo());
		%> --%>
		
		<c:set var="i" value="0"/>
		<c:forEach var="list" items="${list}">
		<c:set var="i" value="${i+1}"/>
	
	<tr class="ct_list_pop">
	<td align="center">
<%-- 			<a href="/getPurchase.do?tranNo=<%=vo.getTranNo() %>"><%=i+1 %></a> --%>
		<c:if test="${list.tranCode=='1' }">
			<a href="/getPurchase.do?tranNo=${list.tranNo}">${i}</a>
		</c:if>
		<c:if test="${list.tranCode!='1' }">
			${i}
		</c:if>
		</td>
		<td></td>
		<td align="left">
		<c:if test="${list.tranCode=='1' }">
			<a href="/getUser.do?userId=${user.userId}">${user.userId }</a>
		</c:if>
		<c:if test="${list.tranCode!='1' }">
			${user.userId}
		</c:if>
		
		
	<%-- 	<%if((purchase.getTranCode().trim().equals("1"))){%>
			<a href="/getUser.do?userId=<%=user.getUserId()%>"><%=user.getUserId() %></a>
			<%}else{ %>
			<%=user.getUserId() %>
			<%} %> --%>
		</td>
		<td></td>
		
		<td align="left"><a href ="/getProduct.do?menu=completeSearch&prodNo=${list.purchaseProd.prodNo}">${list.purchaseProd.prodName}</a></td>
<%-- 		<td align="left"><a href ="/getProduct.do?menu=completeSearch&prodNo=<%=product.getProdNo()%>"><%=product.getProdName() %></a></td> --%>
		<td></td>
		<td align="left">${list.purchaseProd.price}</td>
<%-- 		<td align="left"><%=product.getPrice() %></td> --%>
		<td></td>
		<td align="left">${list.purQuantity}</td>
<%-- 		<td align="left"><%=product.getPrice() %></td> --%>
		<td></td>
				
		<td align="left">
		<c:if test="${list.isPurchaseCode=='1' }"> 	
		<c:if test="${list.tranCode=='1' }">
		���� ���ſϷ� �����Դϴ�.
		</c:if>
		<c:if test="${list.tranCode=='2' }">
		���� ����� �����Դϴ�.
		</c:if>
		<c:if test="${list.tranCode=='3' }">
		���� ��ۿϷ� �����Դϴ�.
		</c:if>		
		</c:if>		

		</td>
		<td></td>
		<td align="left">
		<c:if test="${list.isPurchaseCode=='0' }">
		������� �Ǿ����ϴ�.
		</c:if>
		
		<c:if test="${list.isPurchaseCode=='1' }">
			<c:if test="${list.tranCode=='2' }">
				<a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}" >��ۿϷ�</a>
			</c:if>			
			<c:if test="${list.tranCode=='1' }">
				<a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}" >�������</a>
			</c:if>			
		</c:if>
		</td>
		<td></td>
		
				
		
		
<%-- 		<%if(purchase.getTranCode().trim().equals("2")){ %>
		<a href="/updateTranCodeByProd.do?tranNo=<%=vo.getTranNo()%>" >��ۿϷ�</a>
		<%} %></td> --%>
		
		<tr>
		<td colspan="20" bgcolor="D6D7D6" height="1"></td>
		</tr>
	
		<%-- <%} %>	 --%>
		</c:forEach>
		
		
	
</table>
		
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
			<%-- <% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getBeginUnitPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>		 --%>
			<jsp:include page="../common/pageNavigator.jsp"></jsp:include>
		
		</td>
	</tr>	
</table>


<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>