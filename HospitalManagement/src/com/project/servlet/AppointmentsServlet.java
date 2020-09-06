package com.project.servlet;

import java.io.IOException;
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
		dispatcher=request.getRequestDispatcher("index.html");
		dispatcher.forward(request, response);
	}
	
	if(formAction.equalsIgnoreCase("VIEW_APPOINTMENTS")) {
	
		AppointmentDAOImpl dao=new AppointmentDAOImpl();
		int latest=1;
		List<AppointmentDtls> list=dao.viewAppointments(latest);
		request.setAttribute("isViewAppointmentsActive", "active");
		request.setAttribute("appointmentsList", list);
		request.setAttribute("isViewAppointments","true");
		dispatcher=request.getRequestDispatcher("jsp/receptionistHome.jsp");
		dispatcher.forward(request, response);
	}
    		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
