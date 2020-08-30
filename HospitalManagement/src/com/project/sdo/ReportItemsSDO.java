package com.project.sdo;

import com.project.sdo.AbstractDtlsSDO;

public class ReportItemsSDO extends AbstractDtlsSDO {
	
	private int reportId;
	 private int medicineId;
	 private String medicineName;
	 private String manufacture;
	 private String batchNo;
	 private String expDate;
	 private String sgstPer;
	 private String cgstPer;
	 private String qty;
	 private Double itemPrice;
	 private Double totAmount;
	public int getReportId() {
		return reportId;
	}
	public void setReportId(int reportId) {
		this.reportId = reportId;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public String getManufacture() {
		return manufacture;
	}
	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getSgstPer() {
		return sgstPer;
	}
	public void setSgstPer(String sgstPer) {
		this.sgstPer = sgstPer;
	}
	public String getCgstPer() {
		return cgstPer;
	}
	public void setCgstPer(String cgstPer) {
		this.cgstPer = cgstPer;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public Double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public Double getTotAmount() {
		return totAmount;
	}
	public void setTotAmount(Double totAmount) {
		this.totAmount = totAmount;
	}
	public int getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(int i) {
		this.medicineId = i;
	}
	 
	 
}
