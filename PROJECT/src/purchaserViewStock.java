import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/purchaserViewStock")
public class purchaserViewStock extends HttpServlet
{
  public void service(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException
  {
    res.setContentType("text/html");
    PrintWriter out = res.getWriter();
       
   
    try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
    PreparedStatement pstmt=con.prepareStatement("Select * from products");
    ResultSet rs=pstmt.executeQuery();
   
    out.println("<br>");
    out.println("<br>");
    out.println("<br>");
   
    out.println("<table align=center border='2'>");
    out.println("<tr bgcolor='lightblue'>");
    out.println("<th>stock Name</th>");
    out.println("<th>stock Quantity</th>");
    out.println("<th>stock Price</th>");
    out.println("<th>Amount</th>");
    out.println("<th>Buy This Stock</th>");
    out.println("</tr>");
    while(rs.next())
    {
    	
      out.println("<tr>");
      out.println("<td>"+rs.getString(2)+"</td>");
      out.println("<td>"+rs.getString(3)+"</td>");
      out.println("<td>"+rs.getString(4)+"</td>");
      out.println("<td>"+Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(3))+"</td>");
      HttpSession session = req.getSession();
      session.setAttribute("pname", rs.getString(2));
      session.setAttribute("pquantity", rs.getInt(3));
      session.setAttribute("pprice", rs.getInt(4));
     
      
      out.println("<td><a href='quantity.html'>Buy this Stock!</a>");
      //out.println("<td><a href='viewrequest.jsp?pname="+rs.getString(2)+"&pquantity="+rs.getString(3)+"&pprice="+rs.getString(4)+"'>Buy This Stock!</a>");
    }
    out.println("</table>");
    }
    catch(Exception e)
    {
      out.println(e);
    }
   
    out.println("<a href='purchaserHome.html'>Home</a>");
  }
}