package BusinessLogic;

import java.sql.* ;
import java.io.*;

import static Data.Provider.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Registration
 */
@WebServlet("/GetReport")
public class GetReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetReport() {
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
			String deli = (String) session.getAttribute("UserID");
			
			String Satatement10 = "SELECT * FROM PMS.TestReport WHERE PatientID = '" + deli + "'" ;
	        PreparedStatement ps10 = con.prepareStatement(Satatement10);                   
	        ResultSet lassani = ps10.executeQuery();
        
	        lassani.last();
	        String fileName = "Report.pdf";
	        Blob blob = lassani.getBlob("Report");
	        InputStream inputStream = blob.getBinaryStream();
	        int fileLength = inputStream.available();

	        ServletContext context = getServletContext();

	        // sets MIME type for the file download
	        String mimeType = context.getMimeType(fileName);
	        if (mimeType == null) {        
	            mimeType = "application/pdf";
	        }              
	         
	        // set content properties and header attributes for the response
	        response.setContentType(mimeType);
	        response.setContentLength(fileLength);
	        String headerKey = "Content-Disposition";
	        String headerValue = String.format("attachment; filename=\"%s\"", fileName);
	        response.setHeader(headerKey, headerValue);

	        // writes the file to the client
	        OutputStream outStream = response.getOutputStream();
	         
	        byte[] buffer = new byte[(int) blob.length()];
	        int bytesRead = -1;
	         
	        while ((bytesRead = inputStream.read(buffer)) != -1) {
	            outStream.write(buffer, 0, bytesRead);
	        }
	         
	        inputStream.close();
	        outStream.close();

        
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
		} 
	
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
  
	}

}
