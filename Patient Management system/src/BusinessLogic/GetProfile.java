package BusinessLogic;


import Data.*;

import java.sql.* ;
import java.util.ArrayList;
import java.io.IOException ;

import static Data.Provider.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/GetProfile")
public class GetProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			HttpSession session = request.getSession();
			String del = (String) session.getAttribute("UserID");
			
			String Satatement10 = "SELECT * FROM PMS.Patient WHERE Email='" + del + "'" ;
	        PreparedStatement ps10 = con.prepareStatement(Satatement10);                   
	        ResultSet lassana = ps10.executeQuery();

	        
	        ArrayList<Patient> balo = new ArrayList<Patient>();

	        while (lassana.next())
	        {
	        	Patient tolo = new Patient();
					tolo.FirstName = lassana.getString(2);
					tolo.LastName = lassana.getString(3);
					tolo.DateOfBirth = lassana.getString(4);
					tolo.Gender = lassana.getString(5);
					tolo.Email = lassana.getString(6);
					tolo.Phone = lassana.getString(7);
					tolo.Address = lassana.getString(8);
					tolo.Password = lassana.getString(9);
					tolo.Ans1 = lassana.getString(10);
					tolo.Ans2 = lassana.getString(11);
	        	balo.add(tolo);

	        }
	        
	        request.setAttribute("resultp", balo);


	        RequestDispatcher dispatcher = request.getRequestDispatcher("EditProfile.jsp");
            dispatcher.forward(request, response);

        
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
  
	}

}
