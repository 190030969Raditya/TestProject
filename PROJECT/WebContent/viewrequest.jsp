<%@page import="java.sql.*,java.io.*"%>

<%
String semail=(String)session.getAttribute("semail");
String pname = (String)session.getAttribute("pname");
int pquantity = (int)session.getAttribute("pquantity");
int pprice = (int)session.getAttribute("pprice");
int amt = Integer.parseInt(request.getParameter("amt"));
out.println(amt);
String amount = request.getParameter("pprice");
%>



<%
try
{
  Connection con=null;
  Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
  if(amt==pquantity)
  {
    PreparedStatement pstmt=con.prepareStatement("insert into viewproducts values(?,?,?,?)");
    pstmt.setString(1,semail);
    pstmt.setString(2,pname);
    pstmt.setInt(3,pquantity);
    pstmt.setInt(4,pprice);
    int n = pstmt.executeUpdate();
    if(n>0)
    {
      response.sendRedirect("sendRequest.jsp");
    }
    
    PreparedStatement pst=con.prepareStatement("delete from products where productname=? and productquantity=? and productprice=?");
    pst.setString(1,pname);
    pst.setInt(2,pquantity);
    pst.setInt(3,pprice);
    
    pst.executeUpdate();
  }
  else if(amt<pquantity)
  {
    PreparedStatement pstmt=con.prepareStatement("insert into viewproducts values(?,?,?,?)");
    pstmt.setString(1,semail);
    pstmt.setString(2,pname);
    pstmt.setInt(3,amt);
    pstmt.setInt(4,pprice);
    int n = pstmt.executeUpdate();
    if(n>0)
    {
      response.sendRedirect("sendRequest.jsp");
    }
 
    PreparedStatement pst=con.prepareStatement("update products set productquantity=? where semail=?");
    pst.setInt(1,(pquantity-amt));
    pst.setString(2,semail);
    pst.executeUpdate();
  }
  else
  {
    

    out.println("Quantity Enter is greater than available Stock");
    
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
