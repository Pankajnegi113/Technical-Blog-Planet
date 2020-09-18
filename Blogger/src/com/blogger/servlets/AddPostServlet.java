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

import com.blogger.dao.PostDao;
import com.blogger.entities.Post;
import com.blogger.entities.User;
import com.blogger.helper.ConnectionProvider;
import com.blogger.helper.Helper;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
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
		PrintWriter out = response.getWriter();
		 int cid = Integer.parseInt(request.getParameter("cid"));
         String pTitle = request.getParameter("pTitle");
         String pContent = request.getParameter("pContent");
         String pCode = request.getParameter("pCode");
         Part part = request.getPart("Ppic");
//         getting currentuser id
         HttpSession session = request.getSession();
         User user = (User) session.getAttribute("user");

//         out.println("your post title is " + pTitle);
//         out.println(part.getSubmittedFileName());
         Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(),cid,user.getId());
         PostDao dao = new PostDao(ConnectionProvider.getConnection());
         if (dao.savePost(p)) {

             String path = request.getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
             Helper.saveFile(part.getInputStream(), path);
             out.println("done");

         } else {
             out.println("error");

         }
	}

}
