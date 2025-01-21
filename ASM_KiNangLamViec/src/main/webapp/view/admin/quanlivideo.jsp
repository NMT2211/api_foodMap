<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        /* Custom styling */
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
        .video-list td {
            vertical-align: middle;
        }
        .video-list th, .video-list td {
            text-align: center;
        }
        .video-list tbody tr:hover {
            background-color: #f1f1f1;
        }
        .video-list td a {
            color: #007bff;
            text-decoration: none;
        }
        .video-list td a:hover {
            text-decoration: underline;
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
        .card-img-top {
	    	width: 90%;
	        height: 90%; /* Chiều cao tối đa cho hình ảnh */
	        object-fit: cover;
	        
	    }
    </style>
</head>
<body>
    <div class="mt-5">
        <!-- Tabs -->
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="video-edition-tab" data-bs-toggle="tab" data-bs-target="#video-edition" type="button" role="tab" aria-controls="video-edition" aria-selected="true">Video Edition</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="video-list-tab" data-bs-toggle="tab" data-bs-target="#video-list" type="button" role="tab" aria-controls="video-list" aria-selected="false">Video List</button>
            </li>
        </ul>
        
        
        
        <c:set var="path" value="${pageContext.request.contextPath}/admin/video"></c:set>
		<form action="${path}" method="post" enctype="multipart/form-data">
		
		    <div class="tab-content mt-3" id="myTabContent">
		        <!-- Video Edition Tab -->
		        <div class="tab-pane fade show active" id="video-edition" role="tabpanel" aria-labelledby="video-edition-tab">
		            <div class="card">
		                <div class="card-header">
		                    Video Information
		                </div>
		                <div class="card-body">
		                    <div class="row">
		                        <div class="col-md-3 text-center">
		                            <div class="border mb-3" style="height: 200px; display: flex; justify-content: center; align-items: center;">
		                                <c:choose>
		                                    <c:when test="${not empty item.poster}">
		                                        <img src="D:\Eclipse_2024\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ASM_Java4\img\${item.poster}" class="card-img-top mx-auto d-block m-3 rounded" alt="${item.title}">
		                                    </c:when>
		                                    <c:otherwise>
		                                        <input type="file" class="form-control" name="file" accept="image/*">
		                                    </c:otherwise>
		                                </c:choose>
		                            </div>
		                        </div>
		                        <div class="col-md-9">
		                            <div class="mb-3">
		                                <label for="id" class="form-label">YouTube ID</label>
		                                <input type="text" class="form-control" id="id" name="id" value="${item.id}">
		                            </div>
		                            <div class="mb-3">
		                                <label for="title" class="form-label">Video Title</label>
		                                <input type="text" class="form-control" id="title" name="title" value="${item.title}">
		                            </div>
		                            <div class="mb-3">
		                                <label for="views" class="form-label">View Count</label>
		                                <input type="number" class="form-control" id="views" name="views" value="${item.views}">
		                            </div>
		                            <div class="mb-3">
		                                <label for="link" class="form-label">Video Link</label>
		                                <input type="text" class="form-control" id="link" name="link" value="${item.link}">
		                            </div>
		                            <div class="mb-3">
		                                <label class="form-label">Status</label><br>
		                                <div class="form-check form-check-inline">
		                                    <input class="form-check-input" type="radio" name="active" value="true" ${item.active ? 'checked' : ''}>
		                                    <label class="form-check-label" for="active">Active</label>
		                                </div>
		                                <div class="form-check form-check-inline">
		                                    <input class="form-check-input" type="radio" name="active" value="false" ${!item.active ? 'checked' : ''}>
		                                    <label class="form-check-label" for="inactive">Inactive</label>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="mb-3">
		                        <label for="description" class="form-label">Description</label>
		                        <textarea class="form-control" id="description" name="description" rows="4">${item.description}</textarea>
		                    </div>
		                    <div class="text-center">
		                        
		                        <button class="btn btn-danger me-2 btn-custom" type="submit" formaction="${path}/create">Create</button>
								<button class="btn btn-primary me-2 btn-custom" type="submit" formaction="${path}/update">Update</button>
								<button class="btn btn-warning me-2 btn-custom" type="submit" formaction="${path}/delete/${item.id}">Delete</button>
								<button class="btn btn-secondary btn-custom"  type="reset">Reset</button>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</form>

            <!-- Video List Tab -->
            <!-- Video List Tab -->
			<div class="tab-pane fade" id="video-list" role="tabpanel" aria-labelledby="video-list-tab">
			    <div class="card">
			        <div class="card-header">
			            Video List
			        </div>
			        <div class="card-body">
			            <table class="table table-bordered video-list">
			                <thead>
			                    <tr>
			                        <th>YouTube ID</th>
			                        <th>Video Title</th>
			                        <th>View Count</th>
			                        <th>Status</th>
			                        <th>Link</th>
			                        <th>Actions</th>
			                    </tr>
			                </thead>
			                <tbody>
					            <c:forEach items="${listall}" var="vi">
					                <tr>
					                    <td>${vi.id}</td>
					                    <td>${vi.title}</td>
					                    <td>${vi.views}</td>
					                    <td>${vi.active}</td>
					                    <td>${vi.link}</td>
					                    <td>
					                        <a href="${path}/edit/${vi.id}"><i class="fas fa-edit"></i></a> 
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
