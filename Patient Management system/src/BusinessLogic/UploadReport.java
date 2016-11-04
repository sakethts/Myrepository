package BusinessLogic;


import static Data.Provider.*;
import Data.*;

import java.sql.* ;
import java.io.IOException ;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/UploadReport")
@MultipartConfig(maxFileSize = 1000000000)
public class UploadReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadReport() {
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
		
		TestReport tota = new TestReport();
        tota.PatientID =request.getParameter("PatientID");
        tota.DoctorID =request.getParameter("DoctorID");
        tota.Date =request.getParameter("Date");
        tota.Comment = request.getParameter("Comment");
        Part filePart = request.getPart("Report"); 
        InputStream Report = filePart.getInputStream();
        
        
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			String Satatement = "INSERT INTO PMS.TestReport(PatientID, DoctorID, Date, Report, Comment) VALUES('"+ tota.PatientID + "','" + tota.DoctorID + "','"+ tota.Date + "','"+ Report + "','"+ tota.Comment + "')";
	        PreparedStatement ps = con.prepareStatement(Satatement);  
             
            
	        ps.executeUpdate();
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("UploadReportSuccess.jsp");
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
