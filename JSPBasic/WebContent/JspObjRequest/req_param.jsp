<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    
<%--
	* ��û �Ķ����(request parameter)
	
	- Ŭ���̾�Ʈ ������ ������ �����͸� ��û�� �� ���޵Ǵ� ������ ���� ������ �Ķ���Ͷ�� �մϴ�. 
	- ��û �Ķ���ʹ� URL �ּ� �ڿ� ?�� ���� ���� [�Ķ���ͺ����� = ��]�� ������ ���� ������ �����͸� �����մϴ�. 
	- ��û �Ķ���͸� ������ ������ ���� &��ȣ�� ����Ͽ� �����ؼ� �����մϴ�. 
 --%>
 <%
 
 	// Ŭ���̾�Ʈ���� ���۵� ��û �Ķ������ ���� �д� ���
 	// ���� ��ü  request�� �޼����� getParameter("�Ķ���ͺ�����");
 	
 	String breakfast = request.getParameter("bf");
 	String lunch = request.getParameter("lunch");
 	String dinner = request.getParameter("dinner");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>
		- ��ħ�� : <%=breakfast %>
		- ���ɹ� : <%=lunch %>
		- ����� : <%=dinner %>
		
	</p>

</body>
</html>