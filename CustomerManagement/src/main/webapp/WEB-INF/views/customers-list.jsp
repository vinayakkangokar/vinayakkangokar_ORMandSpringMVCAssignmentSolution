<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Customers List</title>
</head>
<body>
	<div class="container">

		<h3 margin:left:>Customer Relationship Management</h3>
		<hr>

		<!-- Add a search form -->

		<form action="/CustomerManagement/customer/search" class="form-inline">

			<!-- Add a button -->
			<a href="/CustomerManagement/customer/showFormForAdd"
				class="btn btn-primary btn-sm mb-3">Register Customer</a>

		</form>
		<c:choose>
			<c:when test="${fn:length(Customers) > 0}">

				<table class="table table-bordered table-striped">
					<thead class="thead-dark">
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Customers}" var="tempCustomer">
							<tr>
								<td><c:out value="${tempCustomer.firstName}" /></td>
								<td><c:out value="${tempCustomer.lastName}" /></td>
								<td><c:out value="${tempCustomer.emailId}" /></td>
								<td>
									<!-- Add "update" button/link --> <a
									href="/CustomerManagement/customer/showFormForUpdate?custId=${tempCustomer.custId}"
									class="btn btn-info btn-sm"> Update Customer </a> <!-- Add "delete" button/link -->
									<a
									href="/CustomerManagement/customer/delete?custId=${tempCustomer.custId}"
									class="btn btn-danger btn-sm"
									onclick="if (!(confirm('Confirm to delete this Customer Record?'))) return false">
										Delete Customer </a>

								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				No Customers to show. Click Register Customer to Add.
			</c:otherwise>
		</c:choose>

	</div>

</body>
</html>