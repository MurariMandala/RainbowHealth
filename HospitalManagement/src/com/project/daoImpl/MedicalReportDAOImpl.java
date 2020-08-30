package com.project.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;


import com.mysql.cj.util.StringUtils;
import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.been.objs.PharmacyDtls;

import com.project.dbconnection.MyConnectionProvider;
import com.project.serviceimpl.IProjectService;


public class MedicalReportDAOImpl implements IProjectService {
	static Connection conn;
@Override
	public void saveReport(MedicalReportDtls reportDtls) {
	
	String reportDtlsInsertQuery="insert into medical_report_dtls (PATIENT_ID,PATIENT_NAME,BILL_NO,BILL_DATE,SALES_TYPE,DOCTOR_NAME,TOTAL_AMOUNT,NET_AMOUNT,PAID_AMOUNT,PREPARED_BY,PRINTED_BY,CGST_AMOUNT,SGST_AMOUNT)values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
	String reportItemsInsertQuery="insert into medical_report_item_dtls (ITEM_ID,PATIENT_ID,MEDICINE_NAME,MANUFACTURE,BATCHNO,EXP_DATE,SGST_PERCENT,CGST_PERCENT,QUANTITY,PRICE,TOTAL_AMOUNT,BILL_DATE) values(?,?,?,?,?,?,?,?,?,?,?,?) ";
	String getQtys="select QUANTITY,PRICE from list_of_medicines where MEDICINE_ID=? ";
	String qtyUpdate="update list_of_medicines set QUANTITY =?,PRICE=? where MEDICINE_ID=?";
	
try {
	 conn = MyConnectionProvider.getConn();
	PreparedStatement ps=conn.prepareStatement(reportDtlsInsertQuery);
	ps.setInt(1,reportDtls.getPatientId());
	ps.setString(2, reportDtls.getPatientName());
	ps.setInt(3, reportDtls.getBillNo());
	ps.setString(4, reportDtls.getBillDate());
	ps.setString(5, reportDtls.getSalesType());
	ps.setString(6, null);
	ps.setDouble(7, reportDtls.getTotAmount());
	ps.setDouble(8, reportDtls.getNetAmount());
	ps.setDouble(9, reportDtls.getPaidAmount());
	ps.setString(10, reportDtls.getPreparedBy());
	ps.setString(11, reportDtls.getPrintedBy());
	ps.setDouble(12, reportDtls.getCgstAmount());
	ps.setDouble(13, reportDtls.getSgstAmount());
	ps.executeUpdate();
	
	if(reportDtls.getReportItems()!=null && reportDtls.getReportItems().size()>0) {
		ArrayList<MedicalReportItemDtls> reportedItemsList=reportDtls.getReportItems();
		Iterator<MedicalReportItemDtls> itemsIterator=reportedItemsList.iterator();
		PreparedStatement ps1=conn.prepareStatement(reportItemsInsertQuery);
		
		while (itemsIterator.hasNext()) {
			MedicalReportItemDtls reportItemDtls = (MedicalReportItemDtls) itemsIterator.next();
			ps1.setInt(1, reportItemDtls.getReportId());
			ps1.setInt(2, reportDtls.getPatientId());
			ps1.setString(3, reportItemDtls.getMedicineName());
			ps1.setString(4, reportItemDtls.getManufacture());
			ps1.setString(5, reportItemDtls.getBatchNo());
			ps1.setString(6, reportItemDtls.getExpDate());
			ps1.setString(7, reportItemDtls.getSgstPer());
			ps1.setString(8, reportItemDtls.getCgstPer());
			ps1.setString(9, reportItemDtls.getQty());
			ps1.setDouble(10, reportItemDtls.getItemPrice());
			ps1.setDouble(11, reportItemDtls.getTotAmount());
			ps1.setString(12, reportDtls.getBillDate());
		
			
			// get qty and price for perticuler medicine
			PreparedStatement ps2=conn.prepareStatement(getQtys);
			ps2.setInt(1, reportItemDtls.getReportId());
			ResultSet rs=ps2.executeQuery();
			if(rs.next()){
				int qty=rs.getInt("QUANTITY");
				double price=rs.getDouble("PRICE");
			    int usedQty=Integer.parseInt(reportItemDtls.getQty());
				int updatedQty=qty-usedQty;
				double usedPrice=reportItemDtls.getItemPrice();
				double updatedPrice=price-usedPrice;
				  // update qty and price for perticuler medicine
				PreparedStatement ps3=conn.prepareStatement(qtyUpdate);
				ps3.setInt(1, updatedQty);
				ps3.setDouble(2, updatedPrice);
				ps3.setInt(3, reportItemDtls.getReportId());
				ps3.executeUpdate();	
			}

			
          
			ps1.executeUpdate();	
		}
	}
	

	
	conn.close();
	
} catch (Exception e) {
	e.printStackTrace();
	System.out.println(e.getMessage());
}
}
@Override
public MedicalReportDtls getTodaysAllReports(String todayDate,int parentId ,String selectedId) {
	MedicalReportDtls reportDtls=new MedicalReportDtls();
	ArrayList<MedicalReportItemDtls> reportItemsList=new ArrayList<MedicalReportItemDtls>();
	String reportHdrDtls="select PATIENT_ID \"parentId\",PATIENT_NAME \"patientName\",BILL_NO \"billNo\",BILL_DATE \"billDate\",SALES_TYPE \"saleType\",DOCTOR_NAME \"doctorName\",TOTAL_AMOUNT \"totAmount\",NET_AMOUNT \"netAmount\",PAID_AMOUNT \"paidAmount\",PREPARED_BY \"preparedBy\",PRINTED_BY \"printedBy\",CGST_AMOUNT \"cgstAmount\",SGST_AMOUNT \"sgstAmount\" from medical_report_dtls";
	String todayReportsQuery="select ITEM_ID \"itemId\",PATIENT_ID \"patientId\",MEDICINE_NAME \"madicineName\",MANUFACTURE \"manufacture\",BATCHNO \"batchNo\",EXP_DATE \"Expdate\",SGST_PERCENT \"sgstPer\",CGST_PERCENT \"cgstPer\",QUANTITY \"qty\",PRICE \"price\",TOTAL_AMOUNT \"totAmount\" from medical_report_item_dtls ";
	
	StringBuffer buff=new StringBuffer();
	StringBuffer buff1=new StringBuffer();
	if(parentId!=0) {
		
		buff.append(reportHdrDtls);
		
		String wherecaluse = " where PATIENT_ID = "+parentId;
		buff.append(wherecaluse);
		buff1.append(todayReportsQuery);
		String wherecaluse1 = " where PATIENT_ID = "+parentId;
		buff1.append(wherecaluse1);
	}
	if(!StringUtils.isNullOrEmpty(todayDate)) {
	
		buff.append(todayReportsQuery);
		String whereClause = " where BILL_DATE = "+"'"+todayDate+"'";
		buff.append(whereClause);
	}
	if(!StringUtils.isNullOrEmpty(selectedId)) {
		
		buff.append(todayReportsQuery);
		String whereClause = " where ITEM_ID = "+"'"+selectedId+"'";
		buff.append(whereClause);
	}
	try {
		conn=MyConnectionProvider.getConn();
		if(parentId!=0) {
		PreparedStatement ps=conn.prepareStatement(buff.toString());
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			reportDtls.setPatientId(rs.getInt("parentId"));
			reportDtls.setPatientName(rs.getString("patientName"));
			reportDtls.setBillNo(rs.getInt("billNo"));
			reportDtls.setBillDate(rs.getString("billDate"));
			reportDtls.setSalesType(rs.getString("saleType"));
			reportDtls.setDoctorName(rs.getString("doctorName"));
			reportDtls.setTotAmount(rs.getDouble("totAmount"));
			reportDtls.setNetAmount(rs.getDouble("netAmount"));
			reportDtls.setPaidAmount(rs.getDouble("paidAmount"));
			reportDtls.setPreparedBy(rs.getString("preparedBy"));
			reportDtls.setPrintedBy(rs.getString("printedBy"));
			reportDtls.setCgstAmount(rs.getDouble("cgstAmount"));
			reportDtls.setSgstAmount(rs.getDouble("sgstAmount"));
			
		}
		}
		if(!StringUtils.isNullOrEmpty(todayDate)||parentId!=0) {
			if(parentId!=0) {
				PreparedStatement ps1=conn.prepareStatement(buff1.toString());
				ResultSet rs1=ps1.executeQuery();
				while (rs1.next()) {
					MedicalReportItemDtls reportItems =new MedicalReportItemDtls();
					reportItems.setReportId(rs1.getInt("itemId"));
					reportItems.setMedicineName(rs1.getString("madicineName"));
					reportItems.setManufacture(rs1.getString("manufacture"));
					reportItems.setBatchNo(rs1.getString("batchNo"));
					reportItems.setExpDate(rs1.getString("Expdate"));
					reportItems.setSgstPer(rs1.getString("sgstPer"));
					reportItems.setCgstPer(rs1.getString("cgstPer"));
					reportItems.setQty(rs1.getString("qty"));
					reportItems.setItemPrice(rs1.getDouble("price"));
					reportItems.setTotAmount(rs1.getDouble("totAmount"));
					reportItemsList.add(reportItems);
				}
			}else {
				PreparedStatement ps1=conn.prepareStatement(buff.toString());
				ResultSet rs1=ps1.executeQuery();
				while (rs1.next()) {
					MedicalReportItemDtls reportItems =new MedicalReportItemDtls();
					reportItems.setReportId(rs1.getInt("itemId"));
					reportItems.setMedicineName(rs1.getString("madicineName"));
					reportItems.setManufacture(rs1.getString("manufacture"));
					reportItems.setBatchNo(rs1.getString("batchNo"));
					reportItems.setExpDate(rs1.getString("Expdate"));
					reportItems.setSgstPer(rs1.getString("sgstPer"));
					reportItems.setCgstPer(rs1.getString("cgstPer"));
					reportItems.setQty(rs1.getString("qty"));
					reportItems.setItemPrice(rs1.getDouble("price"));
					reportItems.setTotAmount(rs1.getDouble("totAmount"));
					reportItemsList.add(reportItems);
				}
			}


		}
		
		if(!StringUtils.isNullOrEmpty(selectedId)) {
			int patientId = 0;
			PreparedStatement ps1=conn.prepareStatement(buff.toString());
			ResultSet rs1=ps1.executeQuery();
			while (rs1.next()) {
				MedicalReportItemDtls reportItems =new MedicalReportItemDtls();
				reportItems.setReportId(rs1.getInt("itemId"));
				reportItems.setMedicineName(rs1.getString("madicineName"));
				reportItems.setManufacture(rs1.getString("manufacture"));
				reportItems.setBatchNo(rs1.getString("batchNo"));
				reportItems.setExpDate(rs1.getString("Expdate"));
				reportItems.setSgstPer(rs1.getString("sgstPer"));
				reportItems.setCgstPer(rs1.getString("cgstPer"));
				reportItems.setQty(rs1.getString("qty"));
				reportItems.setItemPrice(rs1.getDouble("price"));
				reportItems.setTotAmount(rs1.getDouble("totAmount"));
				
				patientId =rs1.getInt("patientId");
				reportItemsList.add(reportItems);
			}
			StringBuffer buff2=new StringBuffer();
			buff2.append(reportHdrDtls);
			String whereClause = " where PATIENT_ID = "+patientId;
			buff2.append(whereClause);
			PreparedStatement ps2=conn.prepareStatement(buff2.toString());
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next()) {
				reportDtls.setPatientId(rs2.getInt("parentId"));
				reportDtls.setPatientName(rs2.getString("patientName"));
				reportDtls.setBillNo(rs2.getInt("billNo"));
				reportDtls.setBillDate(rs2.getString("billDate"));
				reportDtls.setSalesType(rs2.getString("saleType"));
				reportDtls.setDoctorName(rs2.getString("doctorName"));
				reportDtls.setTotAmount(rs2.getDouble("totAmount"));
				reportDtls.setNetAmount(rs2.getDouble("netAmount"));
				reportDtls.setPaidAmount(rs2.getDouble("paidAmount"));
				reportDtls.setPreparedBy(rs2.getString("preparedBy"));
				reportDtls.setPrintedBy(rs2.getString("printedBy"));
				reportDtls.setCgstAmount(rs2.getDouble("cgstAmount"));
				reportDtls.setSgstAmount(rs2.getDouble("sgstAmount"));
			}
		}
		
		reportDtls.addReportItems(reportItemsList);
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return reportDtls;
}
@Override
public PharmacyDtls getPharmacyDetails() {
	PharmacyDtls pdtls=new PharmacyDtls();
	
	String getPharmacyQuery="select PHARMACY_ID \"pharmaId\",GSTINTAX_ID \"gstInId\",PHARMACY_NAME \"pharmaName\",ADDRESS \"address\",PHONE_NO \"phno\",GSTINNO \"gstInNo\",DLNO \"dlNo\",DOCTOR_NAME \"doctorName\" from create_pharmacy";
	
	try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(getPharmacyQuery);
		ResultSet rs=ps.executeQuery();
		while (rs.next()) {
			pdtls.setPharmacyId(rs.getString("pharmaId"));
			pdtls.setGstInTaxId(rs.getString("gstInId"));
			pdtls.setPharmacyName(rs.getString("pharmaName"));
			pdtls.setAddress(rs.getString("address"));
			pdtls.setPhoneNo(rs.getString("phno"));
			pdtls.setGstInTaxNo(rs.getString("gstInNo"));
			pdtls.setDlNo(rs.getString("dlNo"));
			pdtls.setDoctorName(rs.getString("doctorName"));
		}
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return pdtls;
}
@Override
public MedicalReportDtls getMedicineListForPopup(HttpServletRequest request) {
	MedicalReportDtls dtls=new  MedicalReportDtls();
	String listMedicine="select MEDICINE_ID \"medicineId\", MEDICINE_NAME \"medicineName\",QUANTITY \"qty\",PRICE \"price\",MANUFACTURE \"manufacture\",BATCHNO \"batchno\",EXP_DATE \"expdate\" from list_of_medicines";
	
	try {
		conn=MyConnectionProvider.getConn();
		PreparedStatement ps=conn.prepareStatement(listMedicine);
		ResultSet rs=ps.executeQuery();
		ArrayList<MedicalReportItemDtls>itemsArr=new ArrayList<MedicalReportItemDtls>();
		while(rs.next()) {
			MedicalReportItemDtls itemDtls=new  MedicalReportItemDtls();
			itemDtls.setMedicineId(rs.getInt("medicineId"));
			itemDtls.setMedicineName(rs.getString("medicineName"));
			itemDtls.setManufacture(rs.getString("manufacture"));
			itemDtls.setQty(rs.getString("qty"));
			itemDtls.setItemPrice(rs.getDouble("price"));
			itemDtls.setBatchNo(rs.getString("batchno"));
			itemDtls.setExpDate(rs.getString("expdate"));
			itemsArr.add(itemDtls);
		}
		dtls.addReportItems(itemsArr);
	/*String json=JsonUtil.getJson(itemsArr);
	request.setAttribute("medicinesJson",json);
	System.out.println("json :"+json);*/
		
	} catch (Exception e) {
	e.printStackTrace();
	}
	return dtls;
}
@Override
public void saveMedicines(MedicalReportDtls dtls) {
	
	String saveMedicine= "insert into list_of_medicines (MEDICINE_ID,MEDICINE_NAME,QUANTITY,PRICE,MANUFACTURE,BATCHNO,EXP_DATE)values(?,?,?,?,?,?,?)";
	String updateQuery="update list_of_medicines set  MEDICINE_NAME=?,QUANTITY=?,PRICE=?,MANUFACTURE=?,BATCHNO=?,EXP_DATE=? where MEDICINE_ID=?";
	try {
			conn=MyConnectionProvider.getConn();

			PreparedStatement ps=conn.prepareStatement(saveMedicine);
			if(dtls.getReportItems().size()>0 && dtls.getReportItems()!=null) {
				ArrayList<MedicalReportItemDtls> itemsArr=dtls.getReportItems();
				Iterator<MedicalReportItemDtls> itemsIterator=itemsArr.iterator();
				while (itemsIterator.hasNext()) {
					MedicalReportItemDtls itemDtls = (MedicalReportItemDtls) itemsIterator.next();
					ps.setInt(1, itemDtls.getMedicineId());
					ps.setString(2, itemDtls.getMedicineName());
					ps.setString(3, itemDtls.getQty());
					ps.setDouble(4, itemDtls.getItemPrice());
					ps.setString(5, itemDtls.getManufacture());
					ps.setString(6, itemDtls.getBatchNo());
					ps.setString(7, itemDtls.getExpDate());
					ps.executeUpdate();
				}
			}
			PreparedStatement ps1=conn.prepareStatement(updateQuery);
			if(dtls.getUpdatedItems().size()>0 && dtls.getUpdatedItems()!=null) {
				ArrayList<MedicalReportItemDtls> itemsArr=dtls.getUpdatedItems();
				Iterator<MedicalReportItemDtls> itemsIterator=itemsArr.iterator();
				while (itemsIterator.hasNext()) {
					MedicalReportItemDtls itemDtls = (MedicalReportItemDtls) itemsIterator.next();
					
					ps1.setString(1, itemDtls.getMedicineName());
					ps1.setString(2, itemDtls.getQty());
					ps1.setDouble(3, itemDtls.getItemPrice());
					ps1.setString(4, itemDtls.getManufacture());
					ps1.setString(5, itemDtls.getBatchNo());
					ps1.setString(6, itemDtls.getExpDate());
					ps1.setInt(7, itemDtls.getMedicineId());
					ps1.executeUpdate();
				}
			}
			
	} catch (Exception e) {
e.printStackTrace();
	}
	
}

}
