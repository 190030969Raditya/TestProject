<%@page import="java.sql.*"%>

<%
String semail=request.getParameter("semail");
String password=request.getParameter("password");
out.println(semail);
out.println(password);
%>



<%
try
{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
	PreparedStatement pstmt=con.prepareStatement("Select * from supplierdetails where semail=? and password=?");
	pstmt.setString(1,semail);
	pstmt.setString(2,password);
	ResultSet rs=pstmt.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("supplierHome.html");
	}
	else
	{
		out.println("Unsuccesfull login");
	}
		
}
	
	catch(Exception e)
	{
		out.println(e);
	}
finally{
	session.setAttribute("semail",semail); 
}

%>