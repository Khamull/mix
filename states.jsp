<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
try {
String connectionURL = "jdbc:mysql://localhost/varzeainfo";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "root", ""); 
//Add the data into the database
String sql = "SELECT nome FROM produto WHERE nome LIKE '"+str+"%' LIMIT 10";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
//out.println("<li onclick='fill("+rs.getString("nome")+");'>"+rs.getString("nome")+"</li>");
out.println("<li onclick=\"javascript: fill('"+rs.getString("nome")+"')\">"+rs.getString("nome")+"</li>");
}}catch(Exception e){
out.println("Exception is ;"+e);
}
%>
