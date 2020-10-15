package com.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.been.objs.AppointmentDtls;
import com.project.daoImpl.AppointmentDAOImpl;
import com.project.sdo.AbstractDtlsSDO;
import com.project.sdo.AppointmentsSDO;
import com.project.util.ProjectReportsUtil;

/**
 * Servlet implementation class BookAppointmentServlet
 * @author Murari.Mandala
 */

public class AppointmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     * 
     */
    public AppointmentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String formAction=request.getParameter("formAction");
	RequestDispatcher dispatcher=null;
	if(formAction.equalsIgnoreCase("BOOK_APPOINTMENT")) {
		String name=request.getParameter("name");
		String phoneNo=request.getParameter("phoneNo");
		String date=request.getParameter("date");
		String typeOfService=request.getParameter("typeOfService");
		
		AppointmentDtls dtls=new AppointmentDtls();
		Random idGenerate=new Random();
		int Id=idGenerate.nextInt(1000);
		
		String bookkingId=name+"-RainBowHealth-"+Id;
		System.out.println("bookkingId  :"+bookkingId);
		dtls.setBookkingId(bookkingId);
		dtls.setName(name);
		dtls.setDate(date);
		dtls.setPhoneNo(phoneNo);
		dtls.setTypeOfService(typeOfService);		
		AppointmentDAOImpl dao=new AppointmentDAOImpl();
		dao.bookAppointment(dtls);
		request.setAttribute("status","suucessfully submitted your appointment...");
		request.setAttribute("appointMentId", "your appointment Id : "+bookkingId+"");
		request.setAttribute("isModel", "true");
		dispatcher=request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	if(formAction.equalsIgnoreCase("VIEW_APPOINTMENTS")) {
		 ArrayList<AbstractDtlsSDO> appointmentsList=new ArrayList<AbstractDtlsSDO>(); 
		AppointmentDAOImpl dao=new AppointmentDAOImpl();
		int latest=1;
		List<AppointmentDtls> list=dao.viewAppointments(latest);
		appointmentsList=getAppointmentsList(list);
		request.setAttribute("appointmentDataSet",new ProjectReportsUtil().getAllAppointments(appointmentsList));
		//request.setAttribute("appointmentDataSet","[]");
		request.setAttribute("isViewAppointmentsActive", "active");
		request.setAttribute("isViewAppointments","true");
		dispatcher=request.getRequestDispatcher("jsp/receptionistHome.jsp");
		dispatcher.forward(request, response);
	}
    
	if(formAction.equalsIgnoreCase("SEARCH")) {
		String searchOption=request.getParameter("searchOption");
		String input=request.getParameter("search");
		SearchAppointMent(request,searchOption,input);
		dispatcher=request.getRequestDispatcher("jsp/receptionistHome.jsp");
		dispatcher.forward(request, response);
	}
	}

	private ArrayList<AbstractDtlsSDO> getAppointmentsList(List<AppointmentDtls> list) {
		ArrayList<AbstractDtlsSDO> dtlsSdo=new ArrayList<AbstractDtlsSDO>();
	if(list.size()>0 && list!=null) {
		for(int i=0;i<list.size();i++) {
			AppointmentsSDO sdo=new AppointmentsSDO();
			AppointmentDtls dtls=list.get(i);
			sdo.setBookkingId(dtls.getBookkingId());
			sdo.setName(dtls.getName());
			sdo.setPhoneNo(dtls.getPhoneNo());
			sdo.setDate(dtls.getDate());
			sdo.setTypeOfService(dtls.getTypeOfService());
			dtlsSdo.add(sdo);
		}
	}
		return dtlsSdo;
	}

	private void SearchAppointMent(HttpServletRequest request, String searchOption, String input) {
		AppointmentDAOImpl daoImpl=new AppointmentDAOImpl();
		List<AppointmentDtls> SearchList=daoImpl.SearchAppointMent(searchOption,input);
		request.setAttribute("isViewAppointmentsActive", "active");
		request.setAttribute("appointmentsList", SearchList);
		request.setAttribute("isViewAppointments","true");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
