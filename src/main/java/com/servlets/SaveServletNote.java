package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveServletNote
 */
public class SaveServletNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public SaveServletNote() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("note_title");
			String content = request.getParameter("note_content");
			Note newNote = new Note(title,content,new Date());
			System.out.println(newNote);
			
			Session session =  FactoryProvider.getFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(newNote);
			
			transaction.commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Note Added sucessfully</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
