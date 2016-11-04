package Data;

public class Prescription {

	/**
	 * 
	 */
	public String PrescriptionID;
	/**
	 * 
	 */
	public String DoctorID;
	/**
	 * 
	 */
	public String PatientID;
	/**
	 * 
	 */
	public int TestReportID;
	
	public String Prescription;
	/**
	 * Getter of PrescriptionID
	 */
	public String getPrescriptionID() {
	 	 return PrescriptionID; 
	}
	/**
	 * Setter of PrescriptionID
	 */
	public void setPrescriptionID(String PrescriptionID) { 
		 this.PrescriptionID = PrescriptionID; 
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
	 * Getter of TestReportID
	 */
	public int getTestReportID() {
	 	 return TestReportID; 
	}
	/**
	 * Setter of TestReportID
	 */
	public void setTestReportID(int TestReportID) { 
		 this.TestReportID = TestReportID; 
	}
	/**
	 * Getter of Prescription
	 */
	public String getPrescription() {
	 	 return Prescription; 
	}
	/**
	 * Setter of Prescription
	 */
	public void setPrescription(String Prescription) { 
		 this.Prescription = Prescription; 
	}
	/**
	 * 
	 * @param PatientID 
	 * @param DoctorID 
	 * @param TestReportID 
	 * @param Prescription 
	 * @return 
	 */
	public boolean CreateNewPrescription(String PatientID, String DoctorID, String TestReportID, String Prescription) { 
		// TODO Auto-generated method
		return false;
	 }
	/**
	 * 
	 * @param PatientID 
	 * @return 
	 */
	public String RetrievePatientPrescriptions(String PatientID) { 
		// TODO Auto-generated method
		return null;
	 } 

}
