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

@WebServlet("/purchaserRegistration")
public class purchaserRegistration extends HttpServlet
{
	public void service(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String pname=req.getParameter("pname");
		String pemail=req.getParameter("pemail");
		String pmobile=req.getParameter("pmobile");
		String password=req.getParameter("password");
		
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/ep_project","root","root");
		PreparedStatement pstmt=con.prepareStatement("insert into purchaserdetails values(?,?,?,?)");
		pstmt.setString(1,pname);
		pstmt.setString(2,pemail);
		pstmt.setString(3,pmobile);
		pstmt.setString(4,password);
		int n=pstmt.executeUpdate();
		if(n>0)
		{
			
			res.sendRedirect("purchaserLogin.html");

		}
		else
		{
			out.println("unsuccessful registration");
			RequestDispatcher rd=req.getRequestDispatcher("purchaserRegistration.html");
			rd.include(req,res);
			
		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
}