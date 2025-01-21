<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
    	.navbar {
            margin-bottom: 30px;
        }
        .tab-content {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
        }
        .tab-pane {
            padding: 20px;
        }
        .form-label {
            font-weight: bold;
        }
        .btn-custom {
            width: 120px;
        }
        .card {
            border: none;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            font-size: 1.2rem;
            font-weight: bold;
            background-color: #007bff;
            color: white;
            border-radius: 5px 5px 0 0;
        }
    </style>
</head>
<body>
    <div class="mt-5">
        <!-- Tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="user-edition-tab" data-bs-toggle="tab" data-bs-target="#user-edition" type="button" role="tab" aria-controls="user-edition" aria-selected="true">User Edition</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="user-list-tab" data-bs-toggle="tab" data-bs-target="#user-list" type="button" role="tab" aria-controls="user-list" aria-selected="false">User List</button>
            </li>
        </ul>
        
        <c:set var="path" value="${pageContext.request.contextPath}/admin/user"></c:set>
		<form action="${path}" method="post" >
		
		    <div class="tab-content mt-3" id="myTabContent">
		        <!-- User Edition Tab -->
		        <div class="tab-pane fade show active" id="user-edition" role="tabpanel" aria-labelledby="user-edition-tab">
		            <div class="card">
		                <div class="card-header">
		                    User Information
		                </div>
		                <div class="card-body">
		                    <div class="mb-3">
				                <label for="id" class="form-label">Username:</label>
				                <input type="text" class="form-control" id="id" name="id" value="${item.id}" required>
				            </div>
				
				            <div class="mb-3">
				                <label for="password" class="form-label">Password:</label>
				                <input type="password" class="form-control" id="password" name="password" value="${item.password}"  required />
				            </div>
				            
				            <div class="mb-3">
				                <label for="fullname" class="form-label">Fullname:</label>
				                <input type="text" class="form-control" id="fullname" name="fullname" value="${item.fullname}"  required />
				            </div>
				            
				            <div class="mb-5">
				                <label for="email" class="form-label">Email:</label>
				                <input type="text" class="form-control" id="email" name="email" value="${item.email}"  required />
				            </div>
						    <div class="text-center">
		                        
								<button class="btn btn-primary me-2 btn-custom" type="submit" formaction="${path}/update">Update</button>
								<button  class="btn btn-warning me-2 btn-custom" type="submit" formaction="${path}/delete/${item.id}">Delete</button>
								
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</form>

            <!-- User List Tab -->
			<div class="tab-pane fade" id="user-list" role="tabpanel" aria-labelledby="user-list-tab">
			    <div class="card">
			        <div class="card-header">
			            User List
			        </div>
			        <div class="card-body">
			            <table class="table table-bordered user-list">
			                <thead>
			                    <tr>
			                        <th>Username</th>
			                        <th>Password</th>
			                        <th>Fullname</th>
			                        <th>Email</th>
			                        <th>Role</th>
			                        <th>Actions</th>
			                    </tr>
			                </thead>
			                <tbody>
					            <c:forEach items="${listall}" var="user">
					                <tr>
					                    <td>${user.id}</td>
					                    <td>${user.password}</td>
					                    <td>${user.fullname}</td>
					                    <td>${user.email}</td>
					                    <td>${user.admin ? "Admin" : "User"}</td>
					                    <td>
					                        <a href="${path}/edit/${user.id}"><i class="fas fa-edit"></i></a> 
					                    </td>
					                </tr>
					            </c:forEach>
					        </tbody>
			               	
			            </table>
			
			            <!-- Pagination Controls -->
			            <nav aria-label="Page navigation">
			                <ul class="pagination justify-content-center">
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="First">
			                            <span aria-hidden="true">|&lt;</span>
			                        </a>
			                    </li>
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="Previous">
			                            <span aria-hidden="true">&lt;&lt;</span>
			                        </a>
			                    </li>
			                    <li class="page-item disabled">
			                        <a class="page-link" href="#">1</a>
			                    </li>
			                    <li class="page-item">
			                        <a class="page-link" href="#">2</a>
			                    </li>
			                    <li class="page-item">
			                        <a class="page-link" href="#">3</a>
			                    </li>
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="Next">
			                            <span aria-hidden="true">&gt;&gt;</span>
			                        </a>
			                    </li>
			                    <li class="page-item">
			                        <a class="page-link" href="#" aria-label="Last">
			                            <span aria-hidden="true">&gt;|</span>
			                        </a>
			                    </li>
			                </ul>
			            </nav>
			        </div>
			    </div>
			</div>

        </div>
    </div>
</body>
</html>
