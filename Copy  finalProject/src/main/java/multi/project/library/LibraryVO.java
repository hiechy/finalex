package multi.project.library;

public class LibraryVO {
	
	
	private String l_Id;
	private String l_Name;
	private String l_Address;
	private String l_Time;
	private double l_Latitude;
	private double l_Longtitude;
	
	
	public LibraryVO() {
		super();
	}
	public LibraryVO(String l_Id, String l_Name, String l_Address, String l_Time, double l_Latitude,
			double l_Longtitude) {
		super();
		this.l_Id = l_Id;
		this.l_Name = l_Name;
		this.l_Address = l_Address;
		this.l_Time = l_Time;
		this.l_Latitude = l_Latitude;
		this.l_Longtitude = l_Longtitude;
	}
	public String getL_Id() {
		return l_Id;
	}
	public void setL_Id(String l_Id) {
		this.l_Id = l_Id;
	}
	public String getL_Name() {
		return l_Name;
	}
	public void setL_Name(String l_Name) {
		this.l_Name = l_Name;
	}
	public String getL_Address() {
		return l_Address;
	}
	public void setL_Address(String l_Address) {
		this.l_Address = l_Address;
	}
	public String getL_Time() {
		return l_Time;
	}
	public void setL_Time(String l_Time) {
		this.l_Time = l_Time;
	}
	public double getL_Latitude() {
		return l_Latitude;
	}
	public void setL_Latitude(double l_Latitude) {
		this.l_Latitude = l_Latitude;
	}
	public double getL_Longtitude() {
		return l_Longtitude;
	}
	public void setL_Longtitude(double l_Longtitude) {
		this.l_Longtitude = l_Longtitude;
	}
	
	
	
	
	
}
