<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #1c1e22;
            color: white;
        }

        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            background-color: #343a40;
            color: white;
            padding-top: 20px;
        }

        .sidebar h4 {
            text-align: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .sidebar ul {
            padding: 0;
            list-style: none;
        }

        .sidebar ul li {
            margin: 1rem 0;
        }

        .sidebar ul li a {
            color: white;
            display: block;
            padding: 10px 20px;
            text-decoration: none;
        }

        .sidebar .nav-link:hover {
            background-color: #495057;
        }

        .sidebar .nav-link.active {
            background-color: #495057;
        }

        .navbar {
            margin-left: 250px;
            background-color: #212529;
        }
        .navbar-nav {
            width: 100%;
            justify-content: flex-end;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }

        table {
            background-color: #343a40;
            color: white;
        }

        table thead {
            background-color: #495057;
        }

        table tbody tr {
            border-top: 1px solid #dee2e6;
        }
           .form-container {
               display: flex;
               justify-content: flex-end;
           }

        .pagination-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?");
        }

        function confirmAdd() {
            return confirm("Bạn có chắc chắn muốn thêm sản phẩm này không?");
        }

        function confirmSearch() {
            return confirm("Bạn có chắc chắn muốn tìm kiếm không?");
        }
    </script>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar p-3" id="sidebar">
    <h4 class="text-center">Lifestyle</h4>
    <hr>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="/home/index"><i class="fas fa-home"></i> <span class="link-text">Trang chủ</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-chart-bar"></i> <span class="link-text">Thống kê</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/ban-hang/ban-hang"><i class="bi bi-coin"></i> <span class="link-text">Bán hàng</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="/san-pham/index"><i class="fas fa-box-open"></i> <span class="link-text">Sản phẩm</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/nhan-vien/index"><i class="fas fa-users"></i> <span class="link-text">Nhân viên</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/khach-hang/index"><i class="fas fa-user"></i> <span class="link-text">Khách hàng</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#"><i class="fas fa-cogs"></i> <span class="link-text">Thiết lập</span></a>
        </li>
    </ul>
</div>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <span class="sidebar-toggler text-white me-3" onclick="toggleSidebar()">&#9776;</span>
        <a class="navbar-brand" href="#">Lifestyle</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Đăng nhập</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Giỏ hàng</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="content" id="content">
    <div class="container mt-5 pt-5">
    <h2 class="text-center">Danh sách sản phẩm</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

  <form action="/san-pham/them" method="GET" class="form-container">
     <button type="submit" class="btn btn-primary mb-2">Thêm sản phẩm</button>
  </form>

    <div class="mb-4">
        <h3>Tìm kiếm sản phẩm</h3>
        <form action="/san-pham/tim-kiem" method="get" class="form-inline">

            <div class="form-group mx-sm-3 mb-2">
                <label for="searchTen" class="sr-only">Tìm kiếm theo tên</label>
                <input type="text" class="form-control" id="searchTen" name="searchTen"
                       placeholder="Tìm theo tên" value="${searchTen}">
            </div>
            <div class="form-group mx-sm-3 mb-2">
                <label for="searchTrangThai" class="sr-only">Tìm kiếm theo trạng thái</label>
                <select class="form-control" id="searchTrangThai" name="searchTrangThai">
                    <option value="">Tất cả</option>
                    <option value="true">Còn hàng</option>
                    <option value="false">Hết hàng</option>
                </select>
            </div>
            <button type="submit" class="btn btn-success mb-2">Tìm kiếm</button>
        </form>
    </div>

    <%-- Check for the error message and display it --%>
    <c:if test="${not empty success_added}">
           <div class="alert alert-success">
            ${success_added}
        </div>
    </c:if>


    <c:if test="${not empty page}">
        <table class="table table-dark mt-4" id="productTable">
            <thead>
            <tr>
                <th>ID</th>
                <th>Mã</th>
                <th>Tên</th>
                <th>Loại</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.content}" var="sp">
                <tr>
                    <td>${sp.id}</td>
                    <td>${sp.ma}</td>
                    <td>${sp.ten}</td>
                    <td>${sp.loai}</td>
                    <td>
                        <c:choose>
                            <c:when test="${sp.trangThai}">
                                Còn hàng
                            </c:when>
                            <c:otherwise>
                                Hết hàng
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form action="/san-pham/xoa/${sp.id}" method="post" onsubmit="return confirmDelete();" class="d-inline">
                            <button type="submit" class="btn btn-danger btn-sm">
                                <i class="fas fa-trash-alt"></i> Xóa
                            </button>
                        </form>

                        <form action="/san-pham/cap-nhat/${sp.id}" method="get" class="d-inline">
                            <button type="submit" class="btn btn-warning btn-sm">
                                <i class="fas fa-edit"></i> Cập nhật
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

       <!-- Pagination -->
       <div class="pagination mt-4">
           <nav aria-label="Page navigation">
               <ul class="pagination justify-content-center">
                   <!-- Previous Page -->
                   <c:if test="${page.hasPrevious()}">
                       <li class="page-item">
                           <a class="page-link"
                              href="/san-pham/tim-kiem?searchTen=${searchTen}&page=${page.number - 1}
                                   <c:if test='${not empty searchTrangThai}'>
                                       &searchTrangThai=${searchTrangThai}
                                   </c:if>"
                              aria-label="Previous">
                               <span aria-hidden="true">&laquo;</span>
                           </a>
                       </li>
                   </c:if>

                   <!-- Page Numbers -->
                   <c:choose>
                       <c:when test="${page.totalPages > 0}">
                           <c:forEach begin="0" end="${page.totalPages - 1}" var="i">
                               <li class="page-item ${i == page.number ? 'active' : ''}">
                                   <a class="page-link"
                                      href="/san-pham/tim-kiem?searchTen=${searchTen}&page=${i}
                                           <c:if test='${not empty searchTrangThai}'>
                                               &searchTrangThai=${searchTrangThai}
                                           </c:if>">
                                       ${i + 1}
                                   </a>
                               </li>
                           </c:forEach>
                       </c:when>
                       <c:otherwise>
                           <li class="page-item disabled">
                               <span class="page-link">No results to display</span>
                           </li>
                       </c:otherwise>
                   </c:choose>

                   <!-- Next Page -->
                   <c:if test="${page.hasNext()}">
                       <li class="page-item">
                           <a class="page-link"
                              href="/san-pham/tim-kiem?searchTen=${searchTen}&page=${page.number + 1}
                                   <c:if test='${not empty searchTrangThai}'>
                                       &searchTrangThai=${searchTrangThai}
                                   </c:if>"
                              aria-label="Next">
                               <span aria-hidden="true">&raquo;</span>
                           </a>
                       </li>
                   </c:if>
               </ul>
           </nav>
       </div>

    </c:if>

    <c:if test="${empty page}">
        <div class="alert alert-info">Không có sản phẩm nào phù hợp với tìm kiếm.</div>
    </c:if>

    <a href="/san-pham/index" class="btn btn-secondary mt-3">Quay lại danh sách sản phẩm</a>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
