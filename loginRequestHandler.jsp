<%@page import="com.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>
 
<%
String result=LoginDAO.loginCheck(loginBean);
 
if(result.equals("true")){
session.setAttribute("email",loginBean.getEmail());
response.sendRedirect("home.jsp");
}
 
if(result.equals("false")){
 out.println("<script type=\"text/javascript\">" +
                         "alert(\"Worng Email or Password\");" +
                         "</script>");
               RequestDispatcher r=request.getRequestDispatcher("/login.jsp");
               r.include(request,response);

}
 
if(result.equals("error")){
    response.sendRedirect("index.jsp?status=error");
}
 
%>