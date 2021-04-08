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

@WebServlet("/purchaserLogin")
public class purchaserLogin extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String pemail=req.getParameter("pemail");
		String password=req.getParameter("password");
	
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
		PreparedStatement pstmt=con.prepareStatement("Select * from purchaserdetails where pemail=? and password=?");
		pstmt.setString(1,pemail);
		pstmt.setString(2,password);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next())
		{
		
			HttpSession session=req.getSession();
			session.setAttribute("pemail",pemail);	
			res.sendRedirect("purchaserHome.html");

		}
		else
		{
			RequestDispatcher rd=req.getRequestDispatcher("purchaserLogin.html");
			rd.include(req,res);
			
		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
}