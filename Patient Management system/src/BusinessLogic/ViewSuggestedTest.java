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
@WebServlet("/ViewSuggestedTest")
public class ViewSuggestedTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewSuggestedTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		Connection con =null;
		try 
        {
    		Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			HttpSession session = request.getSession();
			String del = (String) session.getAttribute("UserID");
			
			String Satatement10 = "SELECT * FROM PMS.SuggestedTest WHERE PatientID = '" + del + "'" ;
	        PreparedStatement ps10 = con.prepareStatement(Satatement10);                   
	        ResultSet lassana = ps10.executeQuery();

	        
	        ArrayList<SuggestedTest> balol = new ArrayList<SuggestedTest>();

	        lassana.last();
	        
	        	SuggestedTest tolo = new SuggestedTest();
					tolo.PatientID = lassana.getString(2);
					tolo.DoctorID = lassana.getString(3);
					tolo.Suggestion = lassana.getString(4);
	        	balol.add(tolo);

	 
	        
	        request.setAttribute("results", balol);


	        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewSuggestedTest.jsp");
            dispatcher.forward(request, response);

        
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayError.jsp");
            dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayError.jsp");
            dispatcher.forward(request, response);
		} finally {
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
  
	}

}
