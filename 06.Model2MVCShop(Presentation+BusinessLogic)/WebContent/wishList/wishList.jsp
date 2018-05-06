<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>���� ����Ʈ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
function fncGetList(currentPage) {
	document.getElementById("currentPage").value = currentPage;
   	document.detailForm.submit();		
}
function allChk(obj) {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length -1;
	var check = obj.checked;
	if(check){
		for (var i = 0; i <= rowCnt; i++) {
			if(chkObj[i].type =="checkbox")
				chkObj[i].checked =true;			
		}
	}else{
		for (var i = 0; i <= rowCnt; i++) {
			if(chkObj[i].type =="checkbox")
				chkObj[i].checked =false;	
	}
}
}

function delWishList() {
	var chk = document.getElementsByName("RowCheck");  //name="pidx1" ���� ��� ������.
	var data = "";
	var chk_check = false;

	 for (i=0;i<chk.length ;i++ )                   //for ������ ������..
	 {
	 if (chk[i].checked == true )               //checked �� �͸�
	 {
	  data = data + "/ " +chk[i].value;            // ���� �����ͼ� data �ִ´�.
	     if(chk[i].checked) chk_check = true;    // �ϳ��� üũ �ƴٸ� chk_check = true �� ��ȯ
	 }
	}
	 if (chk_check)              // chk_check ���� true ���
	 {
	    if(confirm("�����Ͻðڽ��ϱ�?")){
	   alert("�Ѿ�� ����="+data);
	   document.deleteForm.action = "/deleteWishList.do?wishNo2="+data;
	   document.deleteForm.submit();
	    }
	 }else{                         // chk_check ���� false ���
	  alert('�ϳ��̻��� üũ�Ͽ� �ֽʽÿ�');
	  return;
	 }
}

</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/wishList.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ����Ʈ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">
		<input id="allCheck" type="checkbox" onclick="allChk(this);"/>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>
		<td class="ct_line02"></td>

	</tr>
	<tr>
		<td colspan="20" bgcolor="808285" height="1"></td>
	</tr>
	
		
		<c:set var="i" value="0"/>
		<c:forEach var="list" items="${list}">
		<c:set var="i" value="${i+1}"/>
	
	<tr class="ct_list_pop">
	
	
	<td align="center">
		<input name="RowCheck" type="checkbox" value="${list.wishNo}"/>
		</td>
		<td></td>
		
	<td align="center">
		${i}
		</td>
		<td></td>
		
	<td align="center">
		${list.wishListBuyer.userId}
		</td>
		<td></td>
		
		<td align="center">
		<a href ="/getProduct.do?menu=completeSearch&prodNo=${list.wishListProd.prodNo}">${list.wishListProd.prodName}</a>
		</td>
		<td></td>

		<td align="center">${list.wishListProd.price}</td>
		<td></td>
		
		<td align="center">
		<c:if test="${list.wishIsPurchaseCode=='0' }">
			<a href="addPurchaseView.do?prodNo=${list.wishListProd.prodNo}">�����Ϸ� ����</a>
		</c:if>
		<c:if test="${list.wishIsPurchaseCode!='0' }">
			�����Ͻ� ��ǰ�Դϴ�.
		</c:if>
		
		</td>
		
		<tr >
		<td colspan="20" bgcolor="D6D7D6" height="1"></td>
		</tr>
	
		</c:forEach>
		
		
	
</table>

		
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
	<tr>
					
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
				<jsp:include page="../common/pageNavigator.jsp"></jsp:include>		
		</td>
	</tr>	
</table>


					</table>
					

<!--  ������ Navigator �� -->
</form>

<form name="deleteForm" method="post">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:delWishList();">����</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					</tr>
					</table>
				</form>	

</div>

</body>
</html>