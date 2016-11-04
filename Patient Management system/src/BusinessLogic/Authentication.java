package BusinessLogic;

import javax.servlet.http.HttpSession;
import Data.*;
import java.sql.* ;
import java.io.IOException ;
import static Data.Provider.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Authentication")
public class Authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		// TODO Auto-generated method stub
    	Patient talo = new Patient();
    	talo.Email = request.getParameter("Email");
    	talo.Password = request.getParameter("Password");
    	request.getSession();
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			
			String Satatement1 = "SELECT * FROM PMS.Patient WHERE Email='" + talo.Email + "'AND Password='" + talo.Password + "'";
	        PreparedStatement ps1 = con.prepareStatement(Satatement1);                   
	        ResultSet rs1 = ps1.executeQuery();
	        
	        String Satatement2 = "SELECT * FROM PMS.Doctor WHERE Email='" + talo.Email + "'AND Password='" + talo.Password + "'";
	        PreparedStatement ps2 = con.prepareStatement(Satatement2);                   
	        ResultSet rs2 = ps2.executeQuery();
	        
	        if (rs1.next() && !rs2.next())
	        {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("UserID",rs1.getString(6));
	        	session.setAttribute("FirstName",rs1.getString(2));
	        	session.setAttribute("LastName",rs1.getString(3));
	        	session.setAttribute("Status", "Patient");
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
	            dispatcher.forward(request, response);
	        	
	        }
	        else if (rs2.next() && !rs1.next() )
	        {
	        	HttpSession session = request.getSession();
	        	session.setAttribute("UserID",rs2.getString(6));
	        	session.setAttribute("FirstName",rs2.getString(2));
	        	session.setAttribute("LastName",rs2.getString(3));
	        	session.setAttribute("Status", "Doctor");
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
	            dispatcher.forward(request, response);
	        }
	        else
	        {
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("LoginFailed.jsp");
	            dispatcher.forward(request, response);
	        }
	        
	      
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        
	}

}
