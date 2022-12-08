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
		<%@ include file="navbar.jsp"%>
		<div class="row justify-content-center">
			<div class="col-md-8 col-11">
				<form action="SaveServletNote" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">Note Title</label> <input
							type="text" required class="form-control" name="note_title" id="n_title"
							aria-describedby="emailHelp" placeholder="Titile goes here..."> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Note Content</label>
						<textarea name="note_content" required placeholder="Enter your content..." class="form-control" rows="" cols="" style="height: 300px"></textarea>
					</div>
					
					<div class="container text-center">
						<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>