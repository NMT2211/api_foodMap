<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    
    <style>
	    .card-img-top {
	    	width: 90%;
	        height: 200px; /* Chiều cao tối đa cho hình ảnh */
	        object-fit: cover;
	        
	    }
    </style>
</head>
<body>
	<div class="container">
        <jsp:include page="/view/khachHang/nav.jsp" ></jsp:include>
        
        <h1 class="mb-4 mt-5">Danh Sách Tiểu Phẩm</h1>
        <div class="row">
            <!-- Card 1 -->
            <div class="col-md-4 mb-5">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="card">
                    <img src="${pageContext.request.contextPath}/view/assets/img/llauEPX.png" class="card-img-top mx-auto d-block m-3" alt="Tiểu phẩm 1">
                    <div class="card-body">
                        <h5 class="card-title">Tiểu phẩm 1</h5>
                        <p class="card-text">Lượt xem: <span class="luot-xem">120</span></p>
                        <button class="btn btn-primary" onclick="xemChiTiet(1)">Chi tiết</button>
                        <button class="btn btn-outline-success" onclick="thich(1)">
                            <i class="fas fa-thumbs-up"></i> Thích
                        </button>
                        <button class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#shareModal">
                            <i class="fas fa-share"></i> Chia sẻ
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="d-flex justify-content-center mt-4">
		    <nav aria-label="Page navigation">
		        <ul class="pagination">
		            <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
		                <a class="page-link" href="" aria-label="Trang đầu">|&lt;</a>
		            </li>
		            <li class="page-item ${currentPage <= 1 ? 'disabled' : ''}">
		                <a class="page-link" href="" aria-label="Trang trước">&laquo;</a>
		            </li>
		            <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
		                <a class="page-link" href="" aria-label="Trang sau">&raquo;</a>
		            </li>
		            <li class="page-item ${currentPage >= totalPages ? 'disabled' : ''}">
		                <a class="page-link" href="" aria-label="Trang cuối">&gt;|</a>
		            </li>
		        </ul>
		    </nav>
		</div>
        
        
        
    </div>
    
    
    <!-- Modal Overlay chia sẻ-->
    <div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true" style="height: 700px; border: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title" id="shareModalLabel">Chia sẻ video</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <iframe src="${pageContext.request.contextPath}/view/khachHang/chiase.jsp" style="width: 100%; height: 500px; border: none;"></iframe>
                </div>
                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Hàm thích (ví dụ)
        function thich(id) {
            alert('Bạn đã thích video ' + id);
        }
    </script>
		
</body>
</html>