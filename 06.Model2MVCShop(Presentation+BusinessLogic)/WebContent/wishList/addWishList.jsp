<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
ID : ${wishList.wishListBuyer.userId}<br/>
��ǰ�� : ${wishList.wishListProd.prodName}<br/>
��ǰ���� : ${wishList.wishListProd.price}<br/>

���ø���Ʈ�� �߰��Ǿ����ϴ�.<br/>
���ø���Ʈ�� �̵��Ͻðڽ��ϱ�?<br/>

<a href="/wishList.do">���ø���Ʈ�� �̵�</a>
<a href="/listProduct.do?menu=search"> ��� �����ϱ� </a>

</center>

</body>
</html>