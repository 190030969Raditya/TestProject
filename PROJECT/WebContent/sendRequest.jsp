<style>
.button {
  background-color: #000;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  opacity: 0.6;
  transition: 0.3s;
  display: inline-block;
  text-decoration: none;
  cursor: pointer;
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
body {  
    background-image: url('stock.jpg') 
}
</style>

<a href="purchaserHome.html" class="button">Home</a>

<%@page import="java.sql.*,java.io.*"%>
<center><h1 class="button">Your Stocks</h1></center>
<div class="tbox">
<%
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
PreparedStatement pstm=con.prepareStatement("Select * from viewproducts");
ResultSet rs=pstm.executeQuery();

out.println("<br>");
out.println("<br>");
out.println("<br>");

out.println("<table align=center border='2'>");
out.println("<tr bgcolor='lightblue'>");
out.println("<th>Product Name</th>");
out.println("<th>Product Quantity</th>");
out.println("<th>Product Price</th>");
out.println("<th>Amount</th>");
//out.println("<th>Buy This Stock</th>");
out.println("</tr>");
while(rs.next())
{
  out.println("<tr>");
  out.println("<td>"+rs.getString(2)+"</td>");
  out.println("<td>"+rs.getString(3)+"</td>");
  out.println("<td>"+rs.getString(4)+"</td>");
  out.println("<td>"+Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(3))+"</td>");
  
  //out.println("<td><a href='viewrequest.jsp?pname="+rs.getString(2)+"&pquantity="+rs.getString(3)+"&pprice="+rs.getString(4)+"'>Buy This Stock!</a>");
}
out.println("</table>");
%>
</div>