<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
        .navbar-brand img {
            height: 40px;
            width: auto;
        }

        .nav-item .nav-link {
            padding-left: 15px;
            padding-right: 15px;
        }

        .navbar-nav .nav-item {
            margin-left: 10px;
            margin-right: 10px;
        }

        /* Adjust navbar background color */
        .navbar-dark {
            background-color: #343a40;
        }

        /* Hover effect */
        .nav-link:hover {
            background-color: #495057;
            border-radius: 5px;
        }

        /* Customize the icon spacing */
        .nav-link i {
            font-size: 1.2rem;
            margin-right: 8px;
        }

        /* Navbar collapse for mobile */
        @media (max-width: 768px) {
            .navbar-nav {
                text-align: center;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
    <div class="container-fluid">
        <!-- Logo -->
        <a class="navbar-brand" href="home.jsp">
            <img class="" alt="Logo" src="${pageContext.request.contextPath}/view/assets/img/logo2.png">
        </a>
        <!-- Toggle button for mobile view -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- Navbar items -->
        
        <c:url var="home" value="/admin"></c:url>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <!-- Home -->
                <li class="nav-item">
                    <a class="nav-link" href="${home}/home">
                        <i class="bi bi-house-door me-1"></i>Home
                    </a>
                </li>
                <!-- Videos -->
                <li class="nav-item">
                    <a class="nav-link" href="${home}/video">
                        <i class="bi bi-film me-1"></i>Videos
                    </a>
                </li>
                <!-- Users -->
                <li class="nav-item">
                    <a class="nav-link" href="${home}/user">
                        <i class="bi bi-person-fill me-1"></i>Users
                    </a>
                </li>
                <!-- Reports -->
                <li class="nav-item">
                    <a class="nav-link" href="${home}/report">
                        <i class="bi bi-bar-chart-line me-1"></i>Reports
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>