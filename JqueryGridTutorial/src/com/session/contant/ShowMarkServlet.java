package com.session.contant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShowMarkServlet
 */
public class ShowMarkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      String rollno=request.getParameter("rollnumber");
	      System.out.println(rollno);
	      String report=request.getParameter("domainarea");
	      System.out.println(report);
	      HttpSession session=request.getSession();
	      session.setAttribute(rollno,"rollno");
	      if(report.equals("MarkDetail")){
	        request.getRequestDispatcher("/sessionConstant.jsp").forward(request, response);
	    }
	
	
}
}
