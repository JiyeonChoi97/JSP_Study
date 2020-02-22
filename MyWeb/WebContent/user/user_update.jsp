<%@page import="kr.co.jiyeon.user.model.UserVO"%>
<%@page import="kr.co.jiyeon.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
		- 사용자가 이 페이지에 들어왔을 때 getUserInfo()를 이용하여 회원 정보를 불러온 후 아래의 input태그에 해당하는 값이 보여지도록 처리
	*/
	
	String id = (String) session.getAttribute("user_id");
	
	UserVO vo = UserDAO.getInstance().getUserInfo(id);
		
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../include/header.jsp"/>

<div class="container">
   <div class="row">
      <div class="col-md-offset-2 col-md-4">
         <div class="panel" style="width:200%;">
            <div class="panel-heading text-white" align="center" style="background: #F8F8FF;">
               <h2><span style="color: gray;">MyWeb</span> 회원 정보 수정</h2>
            </div>
            <div class="panel-body">
               <form action="user_update_con.jsp" method="post" style="margin-bottom: 0;">
                  
                  <table
                     style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
                     <tr>
                        <td style="text-align: left">
                           <p><strong>아이디</strong>&nbsp;&nbsp;&nbsp;</p>
                        </td>                     
                     </tr>
                     <tr>
                        <td><input type="text" name="id" value="<%=id %>"
                           class="form-control" maxlength="14" readonly
                           style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de">
                           </td>
                     </tr>
         
            
                     <tr>
                        <td style="text-align: left">
                           <p><strong>이름을 수정해 주세요.</strong>&nbsp;&nbsp;&nbsp;</p>
                        </td>
                     </tr>
                     <tr>
                        <td><input type="text" name="name" value="<%=vo.getName() %>"
                           class="form-control" maxlength="6"
                           style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                           ></td>
                     </tr>
                     
                                          
                     <tr>
                        <td style="text-align: left">
                           <p><strong>이메일을 수정해 주세요.</strong>&nbsp;&nbsp;&nbsp;</p>
                        </td>
                     </tr>
                     <tr>
                        <td><input type="email" name="email"
                           class="form-control" value="<%=vo.getEmail() %>"
                           style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                           ></td>
                     </tr>
                     <tr>
                        <td style="text-align: left">
                           <p><strong>주소를 수정해 주세요.</strong>&nbsp;&nbsp;&nbsp;</p>
                        </td>
                     </tr>
                     <tr>
                        <td><input type="text" name="address"
                           class="form-control" value="<%= vo.getAddress() %>"
                           style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
                           ></td>
                     </tr> 
                     

                     <tr>
                        <td style="width: 100%; text-align: center; colspan: 2;">
                        	<input type="submit" value="정보수정" class="btn btn-primary btn-lg" onclick="return confirm('수정하시겠습니까?')"> &nbsp;&nbsp;&nbsp;
                        	                        	<input type="button" value="취소" class="btn btn-danger btn-lg" onclick="location.href='user_mypage.jsp'">
                        </td>
                     </tr>
         
                  </table>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>