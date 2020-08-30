package com.project.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.been.objs.PharmacyDtls;
import com.project.daoImpl.UserDaoImpl;

/**
 * Servlet implementation class UserLoginServlet
 * @author Murari Mandala
 */
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String formAction=request.getParameter("formAction");
		RequestDispatcher dispatcher;
		if(formAction.equalsIgnoreCase("LOGIN")) {
			String userName=request.getParameter("userName");
			String passWord=request.getParameter("passWord");
			UserDaoImpl daoimpl=new UserDaoImpl();
			PharmacyDtls dtls=new PharmacyDtls();
			dtls=daoimpl.getUserLoginDetails(userName,passWord);
			if(dtls.getPharmacyId()!=null) {
				System.out.println("login success ");
				request.getSession().setAttribute("pharmaDtls", dtls);;
				dispatcher=request.getRequestDispatcher("medicalHome.jsp");
				dispatcher.forward(request, response);
				
			}else {
				request.setAttribute("errorMsg","username or password not valid !");
				dispatcher=request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			
			
		}
		
		if(formAction.equalsIgnoreCase("LOGOUT")) {
			request.getSession().removeAttribute("pharmaDtls");
			dispatcher=request.getRequestDispatcher("index.jsp");
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
