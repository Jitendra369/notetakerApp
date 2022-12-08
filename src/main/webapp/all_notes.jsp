<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entities.*"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<%@include file="all_css_js.jsp"%>
</head>

<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		

		<div class="row justify-content-center">
		
			<div class="col-md-8">
			<h1>All Notes</h1>
				<%
				Session sess = FactoryProvider.getFactory().openSession();
				Query query = sess.createQuery("from Note");
				List<Note> list = query.list();
				for (Note note : list) {
				%>

				<!-- Card for All the notes -->
				<div class="card mt-3" style="width: 800px;">
					<div class="text-center p-3 mx-auto">
						<img class="card-img-top " src="img/essay.png"
							alt="Card image cap" style="max-width: 100px">
					</div>
					<div class="card-body px-5" id="card">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container text-center">
						
							<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger mt-2" >Delete</a>
							<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>



				<%
				}
				%>
			</div>

		</div>



	</div>

</body>
</html>