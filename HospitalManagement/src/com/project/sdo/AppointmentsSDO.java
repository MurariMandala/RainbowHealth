package com.project.sdo;

public class AppointmentsSDO extends AbstractDtlsSDO {
	private String bookkingId;
	private String name;
	private String phoneNo;
	private String typeOfService;
	private String date;
	public String getBookkingId() {
		return bookkingId;
	}
	public void setBookkingId(String bookkingId) {
		this.bookkingId = bookkingId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getTypeOfService() {
		return typeOfService;
	}
	public void setTypeOfService(String typeOfService) {
		this.typeOfService = typeOfService;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
