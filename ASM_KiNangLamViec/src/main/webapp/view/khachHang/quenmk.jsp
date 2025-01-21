<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
    <div class="card shadow-sm p-4" style="width: 100%; max-width: 400px;">
        <h2 class="text-center mb-4">FORGOT PASSWORD</h2>
        <c:set var="path" value="${pageContext.request.contextPath}/lab_3" />

        <form action="${path}/quenmk" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required />
            </div>

            <div class="mb-5">
                <label for="email" class="form-label">Email:</label>
                <input type="text" id="email" name="email" class="form-control" required />
            </div>


            <button type="submit" class="btn btn-primary w-100">Retrieve</button>
        </form>
    </div>
</div>

</body>
</html>