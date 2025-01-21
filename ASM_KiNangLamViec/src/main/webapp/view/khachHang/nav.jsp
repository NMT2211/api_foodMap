<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
		.navbar-brand img {
            height: 40px;
            width: auto;
        }

</style>
    
</head>
<body>
	 <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
        <div class="container-fluid">
            <!-- Logo -->
            <a class="navbar-brand" href="home.jsp">
            	<img class="" alt="" src="${pageContext.request.contextPath}/view/assets/img/logo2.png">
                
            </a>
            <!-- Toggle button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- Navbar items -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <!-- My Favorites -->
                    <li class="nav-item">
                        <a class="nav-link" href="favorites.jsp">
                            <i class="bi bi-heart-fill me-1"></i>My Favorites
                        </a>
                    </li>
                    <!-- My Account with Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-1"></i>My Account
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="login.jsp"><i class="bi bi-box-arrow-in-right me-2"></i>Login</a></li>
                            <li><a class="dropdown-item" href="forgotPassword.jsp"><i class="bi bi-key me-2"></i>Forgot Password</a></li>
                            <li><a class="dropdown-item" href="registration.jsp"><i class="bi bi-person-plus-fill me-2"></i>Registration</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logoff.jsp"><i class="bi bi-box-arrow-right me-2"></i>Logoff</a></li>
                            <li><a class="dropdown-item" href="changePassword.jsp"><i class="bi bi-shield-lock-fill me-2"></i>Change Password</a></li>
                            <li><a class="dropdown-item" href="editProfile.jsp"><i class="bi bi-pencil-fill me-2"></i>Edit Profile</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>
