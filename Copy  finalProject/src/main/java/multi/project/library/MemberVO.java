package multi.project.library;

public class MemberVO {

	private String l_Id;
	private String m_Id;
	private String Pw;
	private String Phone;
	private String m_Name;
	private String m_Pic;
	
	public MemberVO() {
		super();
	}
	
	



	public MemberVO(String l_Id, String m_Id, String pw, String phone, String m_Name, String m_Pic) {
		super();
		this.l_Id = l_Id;
		this.m_Id = m_Id;
		this.Pw = pw;
		this.Phone = phone;
		this.m_Name = m_Name;
		this.m_Pic = m_Pic;
	}





	public String getL_Id() {
		return l_Id;
	}
	public void setL_Id(String l_Id) {
		this.l_Id = l_Id;
	}
	public String getM_Id() {
		return m_Id;
	}
	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}
	public String getPw() {
		return Pw;
	}
	public void setPw(String pw) {
		this.Pw = pw;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		this.Phone = phone;
	}
	public String getM_Name() {
		return m_Name;
	}
	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}
	public String getM_Pic() {
		return m_Pic;
	}
	public void setM_Pic(String m_Pic) {
		this.m_Pic = m_Pic;
	}

	
	
	
	
}
