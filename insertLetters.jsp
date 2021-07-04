<%-- 
    Document   : insert
    Created on : Jun 29, 2021, 8:26:52 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
                String f = request.getParameter("for");
                String l = request.getParameter("lef");
                String r = request.getParameter("rt");
                String b = request.getParameter("bck");
                String s = request.getParameter("st");

                DB.DB_ConnectionT2 conn = new DB.DB_ConnectionT2();

                conn.addValues("Forward", "Left", "Right", "Backward", "Stop");

        %>
        <table>
        <%
            
     try {
             Class.forName("com.mysql.jdbc.Driver");
             String URL = "jdbc:mysql://localhost:3306/first_task?useSSL=false";
             String USERNAME = "root"; 
             String PASSWORD = "bushra";
             Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

             Statement st = con.createStatement();
             String str = "select * from controlpanel ORDER BY id DESC LIMIT 1;";
           
             ResultSet rs = st.executeQuery(str);
        
            if (f != null) {
             while (rs.next() ) {
        %>
        <tr>
            <td><%=rs.getString("forward")%> </td>
        </tr>
        
        <% }}else if(l!=null){
           
             while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("leftP")%> </td>
        </tr>
        <% }}else if(r!=null){
           
             while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("rightP")%> </td>
        </tr>
        <% }}else if(b!=null){
           
             while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("backward")%> </td>
        </tr>
        <% }}else if(s!=null){
           
             while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("stopP")%> </td>
        </tr>
        <% }}
            } catch (Exception e) {

            }

        %>    
        </table>
    </body>
</html>
