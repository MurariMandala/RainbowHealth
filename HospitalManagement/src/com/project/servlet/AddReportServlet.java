package com.project.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;
import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.been.objs.PharmacyDtls;
import com.project.daoImpl.MedicalReportDAOImpl;
import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.ReportItemsSDO;
import com.project.util.ProjectReportsUtil;

/**
 * Servlet implementation class AddReportServlet
 * @author Murari Mandala
 * 
 */

public class AddReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	String formAction=request.getParameter("formAction");
	String formAction1=(String)request.getAttribute("formAction");
	if(formAction1!=null) {
		formAction=formAction1;
	}
	System.out.println(formAction);
	RequestDispatcher dispatcher;
	if(formAction.equalsIgnoreCase("GOTO_REPORT")) {
		MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
//		PharmacyDtls pdtls=new PharmacyDtls();
		generateBillNoAndDate(request);
	//	pdtls=daoImpl.getPharmacyDetails();
	//	request.setAttribute("pdtls", pdtls);
		request.setAttribute("isAddCustomerActive", "active");
		request.setAttribute("isTodayReportsActive", "");
		request.setAttribute("isAddMedicinesActive", "");
		request.setAttribute("dataset", "[]");
		request.setAttribute("formAction", "LIST_OF_MEDICINES");
		dispatcher=request.getRequestDispatcher("/totalBills");
		dispatcher.forward(request, response);
	}

	//report save
	if(formAction.equalsIgnoreCase("REPORT_SAVE")) {
		
		MedicalReportDtls medReportDtls=new MedicalReportDtls();
		
		medReportDtls=getReportEntity(request);
		request.setAttribute("parentId", medReportDtls.getPatientId());
		MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
		if(medReportDtls!=null) {
			daoImpl.saveReport(medReportDtls);			
			request.setAttribute("SuccessMsg", "Report saved successfully...");
			dispatcher = request.getRequestDispatcher("/totalBills");
			request.setAttribute("formAction","PRESENT_REPORT");
			dispatcher.forward(request, response);
		}		
	
	}
	
	// view the list of medicines while updating the medicines screen
	if(formAction.equalsIgnoreCase("LIST_MEDICINES")) {
		MedicalReportDAOImpl dao=new MedicalReportDAOImpl();
		MedicalReportDtls dtls=new MedicalReportDtls();
		dtls=dao.getMedicineListForPopup(request);
		ArrayList<AbstractDtlsSDO> listSdo=new ArrayList<AbstractDtlsSDO>();
	    listSdo=getMedicines(dtls);
	    if(listSdo.size()==0) {
	    	request.setAttribute("dataset", "[]");
	    }else {
	    	request.setAttribute("dataset",new ProjectReportsUtil().getMedicinesDataset(listSdo));	
	    }
	    request.setAttribute("isAddCustomerActive", "");
		request.setAttribute("isTodayReportsActive", "");
		request.setAttribute("isAddMedicinesActive", "active");
		
	//	dispatcher=request.getRequestDispatcher("addYourMedicines.jsp");
	    request.setAttribute("isAddAndUpdateMedicines","true");
		dispatcher=request.getRequestDispatcher("jsp/medicalHomeTabsTag.jsp");
	    dispatcher.forward(request, response);
	}
	// save and update your medicines
	if(formAction.equalsIgnoreCase("SAVE_MEDICINES")) {
		MedicalReportDtls dtls=new MedicalReportDtls();
		MedicalReportDAOImpl dao=new MedicalReportDAOImpl();
		dtls=getMedicineEntity(request);
		dao.saveMedicines(dtls);
		request.setAttribute("formAction","LIST_MEDICINES");
		dispatcher=request.getRequestDispatcher("/addReport");
		dispatcher.forward(request, response);
	}
	
	}
	
	

private MedicalReportDtls getMedicineEntity(HttpServletRequest request) {
   String medicinesList=request.getParameter("medicinesList");
   String updatedMedicinesList=request.getParameter("updateMedicinesList");
   MedicalReportDtls dtls=new MedicalReportDtls();
   ArrayList<MedicalReportItemDtls>itemsArr=new ArrayList<MedicalReportItemDtls>();
   if(!StringUtils.isNullOrEmpty(medicinesList)) {
	   String [] medicineListArr=medicinesList.split("~");
	   for(int i=0;i<medicineListArr.length;i++) {
		   String listItem=medicineListArr[i];
		   String []listItemArr=listItem.split(",");
		   
		   String medicineName=listItemArr[0];
		   String medicineId=listItemArr[1];
		   String manufacture=listItemArr[2];
		   String batchno=listItemArr[3];
		   String expDate=listItemArr[4];
		   String qty=listItemArr[5];
		   String price=listItemArr[6];
		   
		   MedicalReportItemDtls itemDtls=new MedicalReportItemDtls();
		   if(StringUtils.isNullOrEmpty(medicineId)) {
			  Integer medcineId;
			  Random idgenerate=new Random();
			  medcineId=idgenerate.nextInt(10000);
			  itemDtls.setMedicineId(medcineId);
			   itemDtls.setMedicineName(medicineName);
			   itemDtls.setManufacture(manufacture);
			   itemDtls.setBatchNo(batchno);
			   itemDtls.setExpDate(expDate);
			   itemDtls.setQty(qty);
			   itemDtls.setItemPrice(Double.parseDouble(price));
			   itemsArr.add(itemDtls);
		   }
		
		 
	   }
	   dtls.addReportItems(itemsArr);
   }
   if(!StringUtils.isNullOrEmpty(updatedMedicinesList)) {
		 ArrayList<MedicalReportItemDtls>itemsUpdatedArr=new ArrayList<MedicalReportItemDtls>();
		 
		 String [] splitn=updatedMedicinesList.split("~");
		  for(int i=0;i<splitn.length;i++) {
			  String splitted = splitn[i];
			  String splittedcomma[] = splitted.split(",");
			    StringBuffer sb = new StringBuffer();
			      String retrieveData = "";
			      for(int j =0; j<splittedcomma.length; j++){
			          retrieveData = splittedcomma[j];
			          if((retrieveData.trim()).length()>0){

			                  sb.append(",");

			              sb.append(retrieveData);

			          }
			      }
			      updatedMedicinesList= sb.toString();
			if(!StringUtils.isNullOrEmpty(updatedMedicinesList)) {
			
			 	String nextStr=updatedMedicinesList.replaceFirst(",","");
			 	String [] nextstrSplit=nextStr.split(",");
			
			 	String medicineName=nextstrSplit[0];
			 	String medicineId=nextstrSplit[1];
			 	String manufacture=nextstrSplit[2];
			 	String batchNo=nextstrSplit[3];
			 	String expdate=nextstrSplit[4];
			 	String qty=nextstrSplit[5];
			 	String price=nextstrSplit[6];
			 	
			 	MedicalReportItemDtls uitems=new MedicalReportItemDtls();
			 	uitems.setMedicineId(Integer.parseInt(medicineId));
			 	uitems.setMedicineName(medicineName);
			 	   uitems.setManufacture(manufacture);
			 	   uitems.setBatchNo(batchNo);
			 	   uitems.setExpDate(expdate);
			 	   uitems.setQty(qty);
			 	   uitems.setItemPrice(Double.parseDouble(price));
			 	   itemsUpdatedArr.add(uitems);
				
			}		  }
 
		 dtls.addUpdatedItems(itemsUpdatedArr);
   }

		return dtls;
	}

private ArrayList<AbstractDtlsSDO> getMedicines(MedicalReportDtls dtls) {
		List medicineList=dtls.getReportItems();
		ArrayList<AbstractDtlsSDO>listSdo=new ArrayList<AbstractDtlsSDO>();
		if(medicineList.size()>0) {
			for(int i=0;i<medicineList.size();i++) {
				MedicalReportItemDtls itemDtls=(MedicalReportItemDtls)medicineList.get(i);
			    ReportItemsSDO sdo=new ReportItemsSDO();
			    sdo.setMedicineId(itemDtls.getMedicineId());
				sdo.setMedicineName(itemDtls.getMedicineName());
			    sdo.setManufacture(itemDtls.getManufacture());
				sdo.setBatchNo(itemDtls.getBatchNo());
			    sdo.setExpDate(itemDtls.getExpDate());
			    sdo.setQty(itemDtls.getQty());
			    sdo.setItemPrice(itemDtls.getItemPrice());
			    listSdo.add(sdo);
			}
		}
		return listSdo;
	}



/*
	private ArrayList<AbstractDtlsSDO> getReports(MedicalReportDtls reportDtls) {
		ArrayList<AbstractDtlsSDO> dtlsSdo=new ArrayList<AbstractDtlsSDO>();
		List itemsList=reportDtls.getReportItems();
		if(itemsList!=null && itemsList.size()>0) {
			for(int i=0;itemsList.size()>i;i++) {
				ReportItemsSDO sdo=new ReportItemsSDO();
				MedicalReportItemDtls reportItems=(MedicalReportItemDtls) itemsList.get(i);
				sdo.setReportId(reportItems.getReportId());
				sdo.setMedicineName(reportItems.getMedicineName());
				sdo.setManufacture(reportItems.getManufacture());
				sdo.setBatchNo(reportItems.getBatchNo());
				sdo.setCgstPer(reportItems.getCgstPer());
				sdo.setSgstPer(reportItems.getSgstPer());
				sdo.setExpDate(reportItems.getExpDate());
				sdo.setQty(reportItems.getQty());
				sdo.setItemPrice(reportItems.getItemPrice());
				sdo.setTotAmount(reportItems.getTotAmount());
				dtlsSdo.add(sdo);
			}
			
			
		}
		
		return dtlsSdo;
	}
*/
	private void generateBillNoAndDate(HttpServletRequest request) {
		Random generateBill=new Random();
		int billNo=generateBill.nextInt(99999);
		MedicalReportDtls dtls=new MedicalReportDtls();
		dtls.setBillNo(billNo);
		request.setAttribute("billNo", dtls.getBillNo());
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
	    Date date = new Date();  
	    System.out.println(formatter.format(date));  
	    String billDate=formatter.format(date);
	    request.setAttribute("billDate", billDate);
	}

	private MedicalReportDtls getReportEntity(HttpServletRequest request) {
     String patientName=request.getParameter("patientName");
     String saleType=request.getParameter("saleType");
   //  String doctorName=request.getParameter("doctorName");
     String billNo=request.getParameter("billNo");
     String billDate=request.getParameter("billDate");
     String totAmount=request.getParameter("totAmount");
     String netAmount=request.getParameter("netAmount");
     String paidAmount=request.getParameter("paidAmount");
     String preparedBy=request.getParameter("preparedBy");
     String printedBy=request.getParameter("printedBy");
     String sgstTax=request.getParameter("sgstTax");
     String cgstTax=request.getParameter("cgstTax");
     
     Random idGenerate=new Random();
     int patientId=idGenerate.nextInt(10000);
     System.out.println("patientId : "+patientId);
     MedicalReportDtls reportDtls=new MedicalReportDtls();
     reportDtls.setPatientId(patientId);
     reportDtls.setPatientName(patientName);
 //    reportDtls.setDoctorName(doctorName);
     reportDtls.setSalesType(saleType);
     reportDtls.setBillDate(billDate);
     reportDtls.setBillNo(Integer.parseInt(billNo));
     reportDtls.setTotAmount(Double.parseDouble(totAmount));
     reportDtls.setNetAmount(Double.parseDouble(netAmount));
     reportDtls.setPaidAmount(Double.parseDouble(paidAmount));
     reportDtls.setCgstAmount(Double.parseDouble(cgstTax));
     reportDtls.setSgstAmount(Double.parseDouble(sgstTax));
     reportDtls.setPreparedBy(preparedBy);
     reportDtls.setPrintedBy(printedBy);
     
     
     // getting medical report items form the array objects
     
     String addReportItems=request.getParameter("addReportItems");
     ArrayList<MedicalReportItemDtls> reportItems=new ArrayList<MedicalReportItemDtls>();
     
     if(!StringUtils.isNullOrEmpty(addReportItems)) {
    	 String [] itemArr=addReportItems.split("~");
    	 
    	 for(int i=0; itemArr.length>i;i++) {
    		 String itemString =itemArr[i];
    		 String [] itemArr1=itemString.split(",");
    		 
    		 if(itemArr1.length==0) {
    			 continue;
    		 }
    		 
    		 String medicineName=itemArr1[0];
    		 String manufacture=itemArr1[1];
    		 String batchNo=itemArr1[2];
    		 String expDate=itemArr1[3];
    		 String sgstPer=itemArr1[4];
    		 String cgstPer=itemArr1[5];
    		 String qty=itemArr1[6];
    		 String price=itemArr1[7];
    		 String itemTotAmount=itemArr1[8];
    		 
    		 Integer itemId=0;
    		 String idArr=itemArr1[9];
    		 if(!StringUtils.isNullOrEmpty(idArr)) {
    			 itemId=Integer.parseInt(idArr);
    		 }
    		
    		 
    		 MedicalReportItemDtls itemdtls=new MedicalReportItemDtls();
    		 if(itemId==0) {
    			 Random itemIdGenerate=new Random();
    			 itemId=itemIdGenerate.nextInt(10000);
    		 
    		 }
    		 itemdtls.setReportId(itemId);
    		 itemdtls.setMedicineName(medicineName);
    		 itemdtls.setManufacture(manufacture);
    		 itemdtls.setBatchNo(batchNo);
    		 itemdtls.setExpDate(expDate);
    		 itemdtls.setSgstPer(sgstPer);
    		 itemdtls.setCgstPer(cgstPer);
    		 itemdtls.setQty(qty);
    		 itemdtls.setItemPrice(Double.parseDouble(price));
    		 itemdtls.setTotAmount(Double.parseDouble(itemTotAmount));
    		 reportItems.add(itemdtls);
    	 }
    	 reportDtls.addReportItems(reportItems);
     }
     return reportDtls;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
