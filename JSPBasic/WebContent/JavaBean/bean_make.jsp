<%@page import="kr.co.jiyeon.jspbasic.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
/* 	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email"); */
	
	// UserBean user = new UserBean(id, pw, name, email);	

%>

<%--
	id - jsp 페이지에서 자바빈 객체에 접근할때 사용할 이름을 지정
	class - 자바빈 클래스의 경로를 입력(완전한 패키지 경로)
	scope - 자바빈 객체를 저장할 영역을 지정(request -> request 객체에 자바빈 객체를 저장)(session, application 도 존재)
 --%>

<jsp:useBean id="user" class="kr.co.jiyeon.jspbasic.user.UserBean" scope="request"/>

<%-- 
	jsp 액션태그의 setProperty, getProperty 태그를 사용하여 setter와 getter를 사용할 수 있습니다. 
	name - 값을 변경할 자바빈 객체의 이름을 지정
	property - 값을 지정할 속성의 이름을 지정(자바빈 클래스의 멤버변수명)
	value - 멤버변수에 넣을 값을 지정
--%>
<%--
<jsp:setProperty name="user" property="id" value="<%= id %>"/>
<jsp:setProperty name="user" property="pw" value="<%= pw %>"/>
<jsp:setProperty name="user" property="name" value="<%= name %>"/>
<jsp:setProperty name="user" property="email" value="<%= email %>"/>
 --%>
 
 <%--
 	* 파라미터 변수명과 자바빈 클래스의 멤버변수가 모두 일치할 경우에는 액션태그 setProperty의 속성 property의 값을 *로 지정하면
 	    자동으로 파라미터 값을 읽어서 자바빈 클래스 변수에 저장합니다.
  --%>
 
<jsp:setProperty property="*" name="user"/>
<jsp:forward page="bean_use.jsp"/> 
 
 
 
 
 
