package com.blogger.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blogger.dao.UserDao;
import com.blogger.entities.Message;
import com.blogger.entities.User;
import com.blogger.helper.ConnectionProvider;
import com.blogger.helper.Helper;



/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		Part part = request.getPart("profile");
		String imageName=part.getSubmittedFileName();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		user.setEmail(email);
		user.setGender(gender);
		user.setName(name);
		user.setPassword(password);
		String oldFileName = user.getProfile();
		user.setProfile(imageName);
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean saved=dao.updateUserInfo(user);
		
		PrintWriter out= response.getWriter();
		if(saved)
		{
			//out.println("Updated successfully");
			//file separator is '/' and getRealPath('/') reaches us to the WebContenet folder
			String path = request.getServletContext().getRealPath("/")+"avatar"+File.separator+user.getProfile();
			String oldFilepath = request.getServletContext().getRealPath("/")+"avatar"+File.separator+oldFileName;
			
			//delete old profile pic
			if( !oldFilepath.equals("default.png") )
				Helper.deleteFile(oldFilepath);
			
			//if deleted successfully, then upload new file to the path
			if( Helper.saveFile(part.getInputStream(), path) )
			{
				Message msg = new Message("Details Updated Successfully","success","alert-success");
				session.setAttribute("msg", msg);
			}
			else {
				Message msg = new Message("Some Error while updating","error","alert-danger");
				session.setAttribute("msg", msg);
			}	
		}
		else
		{
			Message msg = new Message("Some Error while updating","error","alert-danger");
			session.setAttribute("msg", msg);
			
		}
		
		response.sendRedirect("profile.jsp");
		
	}

}
