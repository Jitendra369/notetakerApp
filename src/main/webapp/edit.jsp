
<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_css_js.jsp"%>
</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<h3>Edit note Page</h3>

		<%
		int note_id = Integer.parseInt(request.getParameter("note_id"));
		Session sess = FactoryProvider.getFactory().openSession();
		Note note = sess.get(Note.class, note_id);
		%>

		<form action="UpdateNoteServlet" method="post">
		<input  value="<%= note.getId()%>" name="id" type="hidden">
			<div class="form-group">
				<label for="exampleInputEmail1"></label>Post Title<input
					type="text"  required class="form-control" value="<%= note.getTitle() %>"  name="note_title"
					id="n_title" aria-describedby="emailHelp"
					placeholder="Titile goes here...">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Post Content</label>
				<textarea name="note_content" required
					placeholder="Enter your content..." class="form-control" rows=""
					cols="" style="height: 300px"><%= note.getContent() %></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save your Note</button>
			</div>
		</form>
	</div>

</body>
</html>