<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #1c1e22;
            color: white;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #343a40;
            border: none;
        }
        .card-header {
            background-color: #495057;
            font-size: 1.5rem;
        }
        .btn-back {
            background-color: #17a2b8;
        }
        .btn-back:hover {
            background-color: #138496;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">
        <div class="card-header">
            Chi tiết khách hàng
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="makh" class="form-label">Mã khách hàng:</label>
                <input type="text" class="form-control" id="makh" value="${detail.maKhachHang}" readonly>
            </div>
            <div class="mb-3">
                <label for="ten" class="form-label">Tên khách hàng:</label>
                <input type="text" class="form-control" id="ten" value="${detail.tenKhachHang}" readonly>
            </div>
            <div class="mb-3">
                <label for="ngaysinh" class="form-label">Ngày sinh:</label>
                <input type="text" class="form-control" id="ngaysinh" value="${detail.ngaySinh}" readonly>
            </div>
            <div class="mb-3">
                <label for="gioitinh" class="form-label">Giới tính:</label>
                <input type="text" class="form-control" id="gioitinh" value="${detail.gioiTinh}" readonly>
            </div>
            <div class="mb-3">
                <label for="sdt" class="form-label">Số điện thoại:</label>
                <input type="text" class="form-control" id="sdt" value="${detail.sdt}" readonly>
            </div>
            <div class="mb-3">
                <label for="diachi" class="form-label">Địa chỉ:</label>
                <input type="text" class="form-control" id="diachi" value="${detail.diaChi}" readonly>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="text" class="form-control" id="email" value="${detail.email}" readonly>
            </div>
            <div class="mb-3">
                <label for="trangthai" class="form-label">Trạng thái:</label>
                <input type="text" class="form-control" id="trangthai" value="${detail.trangThai == 1 ? 'Hoạt động' : 'Ngừng hoạt động'}" readonly>
            </div>
            <div class="text-end
">
                <a href="/khach-hang/index" class="btn btn-back">Quay lại</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
