<%@page import="java.sql.*"%>

<%
String prname=request.getParameter("prname");
int prquantity=Integer.parseInt(request.getParameter("prquantity"));
int prprice=Integer.parseInt(request.getParameter("prprice"));

String semail=(String)session.getAttribute("semail");

%>



<%
try
{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
	PreparedStatement pstmt=con.prepareStatement("insert into products values(?,?,?,?)");
	pstmt.setString(1,semail);
	pstmt.setString(2,prname);
	pstmt.setInt(3,prquantity);
	pstmt.setInt(4,prprice);
	int n=pstmt.executeUpdate();
	if(n>0)
	{
		
		response.sendRedirect("SupplierHome.html");
	}
	else
	{
		out.println("Unsuccesfull");
	}
		
}
	
	catch(Exception e)
	{
		out.println(e);
	}

%>