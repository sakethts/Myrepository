package Data;

import java.sql.Blob;


public class TestReport {

	/**
	 * 
	 */
	public String TestReportID;
	/**
	 * 
	 */
	public Blob Report;
	/**
	 * 
	 */
	public String Comment;
	/**
	 * 
	 */
	public String PatientID;
	/**
	 * 
	 */
	public String DoctorID;
	/**
	 * 
	 */
	public String Date;
	/**
	 * Getter of TestReportID
	 */
	public String getTestReportID() {
	 	 return TestReportID; 
	}
	/**
	 * Setter of TestReportID
	 */
	public void setTestReportID(String TestReportID) { 
		 this.TestReportID = TestReportID; 
	}
	/**
	 * Getter of Report
	 */
	public Blob getReport() {
	 	 return Report; 
	}
	/**
	 * Setter of Report
	 */
	public void setReport(Blob Report) { 
		 this.Report = Report; 
	}
	/**
	 * Getter of Comment
	 */
	public String getComment() {
	 	 return Comment; 
	}
	/**
	 * Setter of Comment
	 */
	public void setComment(String Comment) { 
		 this.Comment = Comment; 
	}
	/**
	 * Getter of PatientID
	 */
	public String getPatientID() {
	 	 return PatientID; 
	}
	/**
	 * Setter of PatientID
	 */
	public void setPatientID(String PatientID) { 
		 this.PatientID = PatientID; 
	}
	/**
	 * Getter of DoctorID
	 */
	public String getDoctorID() {
	 	 return DoctorID; 
	}
	/**
	 * Setter of DoctorID
	 */
	public void setDoctorID(String DoctorID) { 
		 this.DoctorID = DoctorID; 
	}
	/**
	 * Getter of Date
	 */
	public String getDate() {
	 	 return Date; 
	}
	/**
	 * Setter of Date
	 */
	public void setDate(String Date) { 
		 this.Date = Date; 
	}
	/**
	 * 
	 * @param PatientID 
	 * @param DoctorID 
	 * @param Report 
	 * @param Comment 
	 * @param ret 
	 */
	public void CreateNewReport(String PatientID, String DoctorID, String Report, String Comment, boolean ret) { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 * @param PatientID 
	 * @return 
	 */
	public String RetrievePatientTestReports(String PatientID) { 
		// TODO Auto-generated method
		return null;
	 }
	/**
	 * 
	 * @param PatientID 
	 * @param DoctorID 
	 * @param Comment 
	 * @param ret 
	 */
	public void AddToCommentTestReport(String PatientID, String DoctorID, String Comment, boolean ret) { 
		// TODO Auto-generated method
	 } 

}
