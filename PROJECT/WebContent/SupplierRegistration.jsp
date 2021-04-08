<%@page import="java.sql.*"%>

<%

String sname=request.getParameter("sname");
String semail=request.getParameter("semail");
String smobile=request.getParameter("smobile");
String password=request.getParameter("password");
%>



<%
try
{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
	PreparedStatement pstmt=con.prepareStatement("insert into supplierdetails values(?,?,?,?)");
	pstmt.setString(1,sname);
	pstmt.setString(2,semail);
	pstmt.setString(3,smobile);
	pstmt.setString(4,password);
	int n=pstmt.executeUpdate();
	if(n>0)
	{
		
		response.sendRedirect("SupplierLogin.html");
		

	}
	else
	{
		out.println("Unsuccesfull Registration");
	}
		
}
	
	catch(Exception e)
	{
		out.println(e);
	}

%>