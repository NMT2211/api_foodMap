<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý thoke</title>
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
        .form-label{
        
        	width: 10%;
        }
    </style>
</head>
<body>
    <div class="mt-5">
        <!-- Tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="favorites-tab" data-bs-toggle="tab" data-bs-target="#favorites" type="button" role="tab" aria-controls="favorites" aria-selected="true">FAVORITES</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="favorite-users-tab" data-bs-toggle="tab" data-bs-target="#favorite-users" type="button" role="tab" aria-controls="favorite-users" aria-selected="false">FAVORITE USERS</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="shared-friends-tab" data-bs-toggle="tab" data-bs-target="#shared-friends" type="button" role="tab" aria-controls="shared-friends" aria-selected="false">SHARED FRIENDS</button>
            </li>
        </ul>

        <div class="tab-content mt-3" id="myTabContent">
            <!-- FAVORITES Tab -->
            <div class="tab-pane fade show active" id="favorites" role="tabpanel" aria-labelledby="favorites-tab">
                <div class="card">
                    <div class="card-header">
                        FAVORITES
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered video-list">
			                <thead>
			                    <tr>
			                        <th>VIDEO TITLE</th>
			                        <th>FAVORITE COUNT</th>
			                        <th>LATEST DATE</th>
			                        <th>OLDEST DATE</th>
			                        
			                    </tr>
			                </thead>
			                <tbody>
					            <c:forEach items="${listFavorite}" var="vi">
					                <tr>
					                    <td>${vi[0]}</td> 
								        <td>${vi[1]}</td> 
								        <td>${vi[3]}</td> 
								        <td>${vi[2]}</td>
					                </tr>
					            </c:forEach>
					        </tbody>
			               	
			            </table>
                    </div>
                </div>
            </div>

            <!-- FAVORITE USERS Tab -->
            <div class="tab-pane fade" id="favorite-users" role="tabpanel" aria-labelledby="favorite-users-tab">
                <div class="card">
                    <div class="card-header">
                        FAVORITE USERS
                    </div>
                    <div class="card-body">
                   		<div class="d-flex justify-content-between mb-3">
			                <label class="form-label" >VIDEO TITLE:</label>
			                <select class="form-select" id="filterSelect" >
			                    <option value="">Select Filter</option>
			                    <option value="option1">Option 1</option>
			                    <option value="option2">Option 2</option>
			                    <option value="option3">Option 3</option>
			                </select>
			            </div>
                        <table class="table table-bordered video-list">
			                <thead>
			                    <tr>
			                        <th>USERNAME</th>
			                        <th>FULLNAME</th>
			                        <th>EMAIL</th>
			                        <th>FAVORITE DATE</th>
			                        
			                    </tr>
			                </thead>
			                <tbody>
					            <c:forEach items="${listFavoriteUser}" var="vi">
					                <tr>
					                    <td>${vi.id}</td>
					                    <td>${vi.title}</td>
					                    <td>${vi.views}</td>
					                    <td>${vi.active}</td>
					                    
					                </tr>
					            </c:forEach>
					        </tbody>
			               	
			            </table>
                    </div>
                </div>
            </div>

            <!-- SHARED FRIENDS Tab -->
            <div class="tab-pane fade" id="shared-friends" role="tabpanel" aria-labelledby="shared-friends-tab">
                <div class="card">
                    <div class="card-header">
                        SHARED FRIENDS
                    </div>
                    <div class="card-body">
                    	<div class="d-flex justify-content-between mb-3">
			                <label class="form-label" >VIDEO TITLE:</label>
			                <select class="form-select" id="filterSelect" >
			                    <option value="">Select Filter</option>
			                    <option value="option1">Option 1</option>
			                    <option value="option2">Option 2</option>
			                    <option value="option3">Option 3</option>
			                </select>
			            </div>
                        <table class="table table-bordered video-list">
			                <thead>
			                    <tr>
			                        <th>SENDER NAME</th>
			                        <th>SENDER EMAIL</th>
			                        <th>RECEIVER EMAIL</th>
			                        <th>SENT DATE</th>
			                        
			                    </tr>
			                </thead>
			                <tbody>
					            <c:forEach items="${listSHARED}" var="vi">
					                <tr>
					                    <td>${vi.id}</td>
					                    <td>${vi.title}</td>
					                    <td>${vi.views}</td>
					                    <td>${vi.active}</td>
					                    
					                </tr>
					            </c:forEach>
					        </tbody>
			               	
			            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
