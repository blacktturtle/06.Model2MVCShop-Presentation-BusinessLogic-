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
	//==> null 을 ""(nullString)으로 변경
	
%>
 --%>


<html>
<head>
<title>구매 목록조회</title>

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
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지</td>
<%-- 		<td colspan="11">전체 <%=resultPage.getTotalCount() %> 건수, 현재 <%= resultPage.getCurrentPage() %> 페이지</td> --%>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">상품가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매수량</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
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
		현재 구매완료 상태입니다.
		</c:if>
		<c:if test="${list.tranCode=='2' }">
		현재 배송중 상태입니다.
		</c:if>
		<c:if test="${list.tranCode=='3' }">
		현재 배송완료 상태입니다.
		</c:if>		
		</c:if>		

		</td>
		<td></td>
		<td align="left">
		<c:if test="${list.isPurchaseCode=='0' }">
		구매취소 되었습니다.
		</c:if>
		
		<c:if test="${list.isPurchaseCode=='1' }">
			<c:if test="${list.tranCode=='2' }">
				<a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}" >배송완료</a>
			</c:if>			
			<c:if test="${list.tranCode=='1' }">
				<a href="/updateTranCodeByProd.do?tranNo=${list.tranNo}" >구매취소</a>
			</c:if>			
		</c:if>
		</td>
		<td></td>
		
				
		
		
<%-- 		<%if(purchase.getTranCode().trim().equals("2")){ %>
		<a href="/updateTranCodeByProd.do?tranNo=<%=vo.getTranNo()%>" >배송완료</a>
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
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getBeginUnitPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>		 --%>
			<jsp:include page="../common/pageNavigator.jsp"></jsp:include>
		
		</td>
	</tr>	
</table>


<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>