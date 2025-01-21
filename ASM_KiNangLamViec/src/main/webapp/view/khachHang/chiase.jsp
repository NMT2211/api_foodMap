<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Video to Your Friend</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            
            font-family: Arial, sans-serif;
        }
        .chiase {
            max-width: 500px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #28a745; /* Màu xanh lá đậm */
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .card-body {
            background-color: white;
            border-radius: 0 0 10px 10px;
        }
        .btn-success {
            background-color: #28a745; /* Màu xanh lá đậm */
            border: none;
        }
        .btn-success:hover {
            background-color: #218838; /* Màu xanh lá nhạt hơn khi hover */
        }
        .form-control {
            border: 1px solid #ced4da; /* Đường viền form */
            border-radius: 5px;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(40, 167, 69, 0.5); /* Hiệu ứng focus */
            border-color: #28a745;
        }
    </style>
</head>
<body>
    
        <div class="card">
            <div class="card-header text-center">
                <h5 class="mb-0">Send Video to Your Friend</h5>
            </div>
            <div class="card-body">
                <p class="text-center text-muted">Enter your friend's email below and send them the video:</p>
                <div class="mb-3">
                    <label for="friendEmail" class="form-label">Your Friend's Email</label>
                    <input type="email" class="form-control" id="friendEmail" placeholder="Enter email">
                </div>
                <div class="text-center">
                    <button class="btn btn-success btn-lg px-4" onclick="sendEmail()">
                        <i class="fas fa-paper-plane"></i> Send
                    </button>
                </div>
            </div>
        </div>
    
    <!-- Thư viện Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    
</body>
</html>
