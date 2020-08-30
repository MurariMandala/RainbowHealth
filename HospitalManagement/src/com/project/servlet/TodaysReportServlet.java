package com.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItemStream.ItemSkippedException;

import com.project.been.objs.MedicalReportDtls;
import com.project.been.objs.MedicalReportItemDtls;
import com.project.been.objs.PharmacyDtls;
import com.project.daoImpl.MedicalReportDAOImpl;
import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.ReportItemsSDO;
import com.project.util.ProjectReportsUtil;

/**
 * Servlet implementation class TodaysReportServlet
@author Murari Mandala
 */
/*@WebServlet("/TodaysReportServlet")*/
public class TodaysReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodaysReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formAction=request.getParameter("formAction");
		String formAction1 =(String) request.getAttribute("formAction");
		System.out.println(formAction);
		RequestDispatcher dispatcher;
	
		// today reports list
		if(formAction.equalsIgnoreCase("GOTO_TODAT_REPORT")) {
			MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");  
		    Date date = new Date();  
	//	    System.out.println(formatter.format(date));  
		    String todayDate=formatter.format(date);
		   MedicalReportDtls reportDtls=new MedicalReportDtls();
		   int id=0;
		   
		   reportDtls=daoImpl.getTodaysAllReports(todayDate,id,null);
	
		   ArrayList<AbstractDtlsSDO> todaysReportList=new ArrayList<AbstractDtlsSDO>(); 
		   todaysReportList=getReports(reportDtls);
	
		   request.setAttribute("dataset",new ProjectReportsUtil().getReportsDataset(todaysReportList));
		   dispatcher=request.getRequestDispatcher("todayAllMedicinesBill.jsp");
			dispatcher.forward(request, response);
		   
		}
		// this list is appear after selecting the record from todays report list
		if(formAction.equalsIgnoreCase("REPORT_LIST")) {
			MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
			   MedicalReportDtls reportDtls=new MedicalReportDtls();
			   PharmacyDtls pdtls=new PharmacyDtls();
		    String todayDate = null;
		    int parentId =0;
		    String selectedId=request.getParameter("selectedId");
			reportDtls=daoImpl.getTodaysAllReports(todayDate,parentId,selectedId);

			pdtls=daoImpl.getPharmacyDetails();
			request.setAttribute("reportDtls", reportDtls);
			request.setAttribute("pdtls", pdtls);
			  ArrayList<AbstractDtlsSDO> reportList=new ArrayList<AbstractDtlsSDO>(); 
			  reportList=getReports(reportDtls);
			    request.setAttribute("dataset",new ProjectReportsUtil().getReportsDataset(reportList));
				dispatcher=request.getRequestDispatcher("jsp/medicalReportCreation.jsp");
				dispatcher.forward(request, response);
		}
		// this will appear after saving the record 
		if(formAction1!=null && formAction1.equalsIgnoreCase("PRESENT_REPORT")) {
			MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
			int parentId=(int)request.getAttribute("parentId");
			    MedicalReportDtls reportDtls=new MedicalReportDtls();
			    String todayDate = null;
				reportDtls=daoImpl.getTodaysAllReports(todayDate,parentId,null);
				request.setAttribute("reportDtls", reportDtls);
			    ArrayList<AbstractDtlsSDO> todaysReportList=new ArrayList<AbstractDtlsSDO>(); 
			    todaysReportList=getReports(reportDtls);
			    request.setAttribute("dataset",new ProjectReportsUtil().getReportsDataset(todaysReportList));
				dispatcher=request.getRequestDispatcher("generatedBill.jsp");
				dispatcher.forward(request, response);
		}
//LIST_OF_MEDICINES  for popup		
	if(formAction.equalsIgnoreCase("LIST_OF_MEDICINES")||formAction1.equalsIgnoreCase("LIST_OF_MEDICINES")) {
		MedicalReportDAOImpl daoImpl=new MedicalReportDAOImpl();
		MedicalReportDtls dtls=new MedicalReportDtls();
		dtls=daoImpl.getMedicineListForPopup(request);
		ArrayList<AbstractDtlsSDO>reportItemsSdo=new ArrayList<AbstractDtlsSDO>();
		reportItemsSdo=getMedicines(dtls);
		request.setAttribute("listMedicinesDataSet",new ProjectReportsUtil().getMedicinesDataset(reportItemsSdo));
		dispatcher=request.getRequestDispatcher("generateMedicineReport.jsp");
		dispatcher.forward(request, response);
	}
	
	}

	private ArrayList<AbstractDtlsSDO> getMedicines(MedicalReportDtls dtls) {
		ArrayList<AbstractDtlsSDO> itemsArr=new ArrayList<AbstractDtlsSDO>();
		List items=dtls.getReportItems();
		if(items.size()>0) {
			for(int i=0;i<items.size();i++) {
				ReportItemsSDO sdo=new ReportItemsSDO();
				MedicalReportItemDtls itemdtls=(MedicalReportItemDtls) items.get(i);
				sdo.setMedicineId(itemdtls.getMedicineId());
				sdo.setMedicineName(itemdtls.getMedicineName());
			    sdo.setManufacture(itemdtls.getManufacture());
				sdo.setBatchNo(itemdtls.getBatchNo());
			    sdo.setExpDate(itemdtls.getExpDate());
			    sdo.setQty(itemdtls.getQty());
			    sdo.setItemPrice(itemdtls.getItemPrice());
			    itemsArr.add(sdo);
			}
		}
		return itemsArr;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}



}
