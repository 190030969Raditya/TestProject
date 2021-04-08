<a href="SupplierHome.html" class="button">Home</a>
<center><h1>Stocks</h1></center>
<%@page import="java.sql.*"%>
<style>
body {  
    background-image: url('tock1.jpg');
    background-size:cover;
	background-repeat:no-repeat;
} 
.tbox{
	background: rgba(0,0,0,0.4);
	margin-left: 30%;
	margin-right: 30%;
	padding: 15px;
	color: #fff;
	border-radius: 15px;
}
td{

color: #fff;
}
table{
border-color: #fff;
}
</style>

<%
String semail=(String)session.getAttribute("semail");

%>

<div class="tbox">

<%
try
{
	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
	PreparedStatement pstmt=con.prepareStatement("Select * from products where semail=?");
	pstmt.setString(1,semail);
	ResultSet rs=pstmt.executeQuery();
	
	%>
	<table align=center border='2'>
	<tr bgcolor='lightblue'>
	<th>Stock Name</th>
	<th>Stock Quantity</th>
	<th>Stock Price</th>
	<th>Amount</th>
	</tr>
	<% 
	while(rs.next())
	{
		out.println("<tr>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		out.println("<td>"+Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(3))+"</td>");
		
	}
	
	%>
	</table>
	<% 
	
		
}
	
	catch(Exception e)
	{
		out.println(e);
	}
finally{
	session.setAttribute("semail",semail); 
}

%>
<style>
.button {
  background-color:black;
  border: none;
  color:white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  opacity: 0.8;

}
</style>

</div>