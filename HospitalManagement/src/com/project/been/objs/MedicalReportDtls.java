package com.project.been.objs;

import java.util.ArrayList;

public class MedicalReportDtls {
  private int patientId;
  private String patientName;
  private String salesType;
  private int billNo;
  private String billDate;
  private String doctorName;
  private String dlNo;
  private String phoneNo;
  private String gstInNo;
  private String preparedBy;
  private String printedBy;
  private Double totAmount;
  private Double netAmount;
  private Double paidAmount;
  private Double cgstAmount;
  private Double sgstAmount;
  
  private ArrayList<MedicalReportItemDtls> reportItems=new ArrayList<MedicalReportItemDtls>();
  private ArrayList<MedicalReportItemDtls> updatedItems=new ArrayList<MedicalReportItemDtls>();

public int getPatientId() {
	return patientId;
}

public void setPatientId(int patientId) {
	this.patientId = patientId;
}

public String getPatientName() {
	return patientName;
}

public void setPatientName(String patientName) {
	this.patientName = patientName;
}

public String getSalesType() {
	return salesType;
}

public void setSalesType(String salesType) {
	this.salesType = salesType;
}

public int getBillNo() {
	return billNo;
}

public void setBillNo(int billNo) {
	this.billNo = billNo;
}

public String getBillDate() {
	return billDate;
}

public void setBillDate(String billDate) {
	this.billDate = billDate;
}

public String getDoctorName() {
	return doctorName;
}

public void setDoctorName(String doctorName) {
	this.doctorName = doctorName;
}

public String getDlNo() {
	return dlNo;
}

public void setDlNo(String dlNo) {
	this.dlNo = dlNo;
}

public String getPhoneNo() {
	return phoneNo;
}

public void setPhoneNo(String phoneNo) {
	this.phoneNo = phoneNo;
}

public String getGstInNo() {
	return gstInNo;
}

public void setGstInNo(String gstInNo) {
	this.gstInNo = gstInNo;
}

public String getPreparedBy() {
	return preparedBy;
}

public void setPreparedBy(String preparedBy) {
	this.preparedBy = preparedBy;
}

public String getPrintedBy() {
	return printedBy;
}

public void setPrintedBy(String printedBy) {
	this.printedBy = printedBy;
}

public Double getTotAmount() {
	return totAmount;
}

public void setTotAmount(Double totAmount) {
	this.totAmount = totAmount;
}

public Double getNetAmount() {
	return netAmount;
}

public void setNetAmount(Double netAmount) {
	this.netAmount = netAmount;
}

public Double getPaidAmount() {
	return paidAmount;
}

public void setPaidAmount(Double paidAmount) {
	this.paidAmount = paidAmount;
}

public ArrayList<MedicalReportItemDtls> getReportItems() {
	return reportItems;
}

public void addReportItems(ArrayList<MedicalReportItemDtls> reportItems) {
	this.reportItems = reportItems;
}

public Double getCgstAmount() {
	return cgstAmount;
}

public void setCgstAmount(Double cgstAmount) {
	this.cgstAmount = cgstAmount;
}

public Double getSgstAmount() {
	return sgstAmount;
}

public void setSgstAmount(Double sgstAmount) {
	this.sgstAmount = sgstAmount;
}

public ArrayList<MedicalReportItemDtls> getUpdatedItems() {
	return updatedItems;
}

public void addUpdatedItems(ArrayList<MedicalReportItemDtls> updatedItems) {
	this.updatedItems = updatedItems;
}
  
  
}
