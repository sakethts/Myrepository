package BusinessLogic;

import static Data.Provider.*;
import Data.*;

import java.sql.* ;
import java.io.IOException ;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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
		
		Patient toto = new Patient();
        toto.FirstName =request.getParameter("FirstName");
        toto.LastName =request.getParameter("LastName");
        toto.DateOfBirth =request.getParameter("DateOfBirth");
        toto.Gender = request.getParameter("Gender");
        toto.Email = request.getParameter("Email");
        toto.Phone = request.getParameter("Phone");
        toto.Address = request.getParameter("Address");
        toto.Password = request.getParameter("Password");
        toto.Ans1 = request.getParameter("Ans1");
        toto.Ans2 = request.getParameter("Ans2");
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			String Satatement = "UPDATE PMS.Patient SET FirstName = '"+ toto.FirstName + "', LastName = '" + toto.LastName + "', DateOfBirth = '"+ toto.DateOfBirth + "', Gender = '"+ toto.Gender + "', Email = '"+ toto.Email + "', Phone = '"+ toto.Phone + "', Address = '"+ toto.Address + "', Password = '"+ toto.Password + "', Ans1 = '"+ toto.Ans1 + "', Ans2 = '"+ toto.Ans2 + "' WHERE Email = '"+ toto.Email + "'";
	        PreparedStatement ps = con.prepareStatement(Satatement);                   
	        ps.executeUpdate();
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("EditProfileSuccess.jsp");
            dispatcher.forward(request, response);
	      
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("InsertError.jsp");
            dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("InsertError.jsp");
            dispatcher.forward(request, response);
		}
        
        
        
	}

}

