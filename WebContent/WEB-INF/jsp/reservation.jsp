<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

		<link href="${contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    	<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
		<link rel="stylesheet" href="${contextPath}/resources/css/datatable-pretty.css">
		
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
		
		
		<script type="text/javascript">
		
		$(document).ready(function() {
			
			var reservDT = $('#reservationList').dataTable( {
				//"scrollY": 500,
                 //"scrollX": true,
                 //"aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],
                 "iDisplayLength": 25,
                 "bPaginate": true,
                 //"paging":   true,
                 "info":     true
                 //"order": [[ 1, "desc" ]],
		                 /* ,
		                "dom": 'C<"clear">lfrtip',
		                "colVis": {
		                    "buttonText": "Show/Hide columns",
		                    restore: "Restore",
		                    exclude: [ 0, 1, 2, 3, 4, 5, 6, 12, 13, 14, 15, 16, 17 ]
		                } */
		            } )/* .columnFilter({ sPlaceHolder: "head:after",
		                   aoColumns: [
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true },
										{ type: "text", bRegex:true }
									]
		            }) */
		           	;
		 
			var a = reservDT.fnAddData(new_rows);
			var nTr = reservDT.fnGetNodes( a[0] );
			$(nTr).blink({blinks:2,speed:500});
			
		});
		
		
		</script>
		
	</head>
	<body>

		<header id="#wrapper">
			<img alt="tcs" src="${contextPath}/resources/images/speed_topbar.gif">
		</header>
		
		<div class="success">${message}</div>
		
		<form:form id="reservationForm" method="post" action="reservationAction" modelAttribute="reservationBean" class="form-signin">
		
			<h2 class="form-heading">Reserve MSISDN</h2>
			
			<form:input type="text" path="msisdn" name="msisdn" id="msisdn" placeholder="MSISDN" class="form-control" autofocus="true"/>
	
			<form:input type="text" path="ssnId" name="ssnId" id="ssnId" placeholder="SSN ID" class="form-control"/>
			
			<form:input type="text" path="reservationBy" id="reservationBy" placeholder="Reserve By" class="form-control"/>
			
			<form:input type="text" path="reservationDate" id="reservationDate" placeholder="Reservation Date" class="form-control"/>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit">Reserve</button>

		</form:form>
		
		<table id="reservationList" class="pretty">
				<thead>
					<tr>
						<th>MSISDN</th>
						<th>SSN ID</th>
						<th>Reserved By</th>
						<th>Reservation Date</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<c:forEach items="${reservationList}" var="reservBean">
					  	<tr>
					    	<td>${reservBean.msisdn}</td>
							<td>${reservBean.ssnId}</td>
							<td>${reservBean.reservationBy}</td>
							<td>${reservBean.reservationDate}</td>
							<td><button class="btn btn-primary" type="submit">Unreserve</button></td>
						</tr>
				</c:forEach>
			</table>
			
		<footer>
			<img alt="tcs" src="${contextPath}/resources/images/images.png">
		</footer>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

	</body>
</html>