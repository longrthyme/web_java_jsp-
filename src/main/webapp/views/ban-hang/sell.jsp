<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        /* CSS tùy chỉnh cho modal */
        .modal-dialog {
            max-width: 50%; /* Điều chỉnh phần trăm hoặc giá trị px để thay đổi kích thước modal */
        }

    </style>
</head>
<body>

<h1 style="text-align: center; color: red">Hóa đơn chờ thanh toán</h1>



<div style="display: flex;">
    <form action="/ban-hang/add" method="POST">
        <button style="height: 60px; border-radius: 10px; margin-bottom: 20px" class="btn btn-primary" type="submit">Bán tại quầy</button>
    </form>

    <c:if test="${not empty errorMessage}">
        <div style="width: 300px; height: 60px; margin-left: 20px; place-items: center" class="alert alert-danger">${errorMessage}</div>
    </c:if>
</div>
    <table class="table">
        <tr>
            <td>ma_hd</td>
            <td>id_khach_hang</td>
            <td>id_nhan_vien</td>
            <td>ngay_tao</td>
            <td>thao tac</td>
        </tr>
        <c:forEach items="${hoadon}" var="c">
            <tr>
                <td>${c.ma_hd}</td>
                <td>${c.khachHang.tenKhachHang}</td>
                <td>${c.nhanVien.ten_nv}</td>
                <td>${c.ngay_tao}</td>
                <td>
                    <form action="/ban-hang/hoa-don" method="GET">
                        <input type="hidden" name="idHoaDon" value="${c.id_hoa_don}" /> <!-- Chuyển id_hoa_don vào form -->
                        <button type="submit">Xem chi tiết</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

<!-- Modal thêm sản phẩm-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/ban-hang/them-san-pham" method="POST">
                    <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                    <table class="table">
                        <tr>
                            <td>Sản phẩm</td>
                            <td>Loại</td>
                            <td>Màu sắc</td>
                            <td>Thương hiệu</td>
                            <td>Kích cỡ</td>
                            <td>Số lượng còn lại</td>
                            <td>Giá bán</td>
                        </tr>
                        <c:forEach items="${sanphamct}" var="ok">
                            <tr>
                                <td>${ok.sanPham.ten}</td>
                                <td>${ok.sanPham.loai}</td>
                                <td>${ok.mauSac.ten_mau_sac}</td>
                                <td>${ok.thuongHieu.ten_thuong_hieu}</td>
                                <td>${ok.size}</td>
                                <td>${ok.so_luong_ton}</td>
                                <td>${ok.gia_ban}</td>
                                <td>
                                    <button style="float: right" class="btn btn-primary" type="submit" name="idSanPhamCT" value="${ok.id_san_pham_ct}">
                                        Thêm
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal thêm khách hàng -->
<div style="margin: 3%" class="modal fade" id="ModalKhachHang" tabindex="-1" aria-labelledby="ModalKhachHangLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="ModalKhachHangLabel">Thêm khách hàng</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div style="display: flex;">
                    <button>
                        Khách lẻ
                    </button>
                    <form method="get" action="/ban-hang/tim-kiem-khach-hang">
                        <input type="hidden" name="idHoaDon" value="${idHoaDon}">
                        <input type="text" style="margin-left: auto" name="sdt" placeholder="Nhập số điện thoại">
                        <button type="submit" class="btn btn-warning bi bi-search">Tìm kiếm</button>
                    </form>

                </div>
                <br>

                <c:if test="${not empty khachHang}">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Tên khách hàng</th>
                            <th>Số điện thoại</th>
                            <th>Email</th>
                            <th>Chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${khachHang}" var="kh">
                            <tr>
                                <td>${kh.tenKhachHang}</td>
                                <td>${kh.sdt}</td>
                                <td>${kh.email}</td>
                                <td>
                                    <form method="post" action="/ban-hang/add-khach-hang">
                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                                        <input type="hidden" name="idKhachHang" value="${kh.id}" />
                                        <button type="submit" class="btn btn-primary">Chọn</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>

<%--                <c:if test="${empty khachHang}">--%>
<%--                    <table class="table">--%>
<%--                        <tr>--%>
<%--                            <td>Tên khách hàng</td>--%>
<%--                            <td>Số điện thoại</td>--%>
<%--                            <td>email</td>--%>
<%--                        </tr>--%>
<%--                        <c:forEach items="${khachHang}" var="kh">--%>
<%--                            <tr>--%>
<%--                                <td>${kh.tenKhachHang}</td>--%>
<%--                                <td>${kh.sdt}</td>--%>
<%--                                <td>${kh.email}</td>--%>
<%--                                <td>--%>
<%--                                    <form method="post" action="/ban-hang/add-khach-hang">--%>
<%--                                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />--%>
<%--                                        <input type="hidden" name="idKhachHang" value="${kh.id}" />--%>
<%--                                        <button type="submit" class="btn btn-primary">--%>
<%--                                            Chọn--%>
<%--                                        </button>--%>
<%--                                    </form>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                    </table>--%>
<%--                </c:if>--%>

            </div>
        </div>
    </div>
</div>
<!-- Script mở modal tự động -->
<c:if test="${showModal}">
    <script>
        const modal = new bootstrap.Modal(document.getElementById('ModalKhachHang'));
        modal.show();
    </script>
</c:if>
<!-- Kiểm tra maHoaDon để hiển thị/ẩn các nút -->
<c:if test="${not empty maHoaDon}">
    <!-- Hiển thị các nút khi maHoaDon không null -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Thêm sản phẩm
    </button>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ModalKhachHang">
        Thêm khách hàng
    </button>
</c:if>


<p>
<h3>
    <Strong>
        <label>Mã hóa đơn: </label>
        <label style="color: red">${maHoaDon}</label>
        <!-- Kiểm tra nếu maHoaDon rỗng thì hiển thị thông báo "Chưa chọn hóa đơn" -->
        <label style="color: red">
            <c:if test="${empty maHoaDon}">
                Chưa chọn hóa đơn
            </c:if>
        </label>

        <!-- Nếu maHoaDon có giá trị (không rỗng), sẽ ẩn thông báo trên -->
        <c:if test="${not empty maHoaDon}">
            <!-- Mã hóa đơn đã tồn tại, không cần hiển thị thông báo "Chưa chọn hóa đơn" -->
        </c:if>

    </Strong>
</h3>
</p>

<!-- Kiểm tra maHoaDon để hiển thị/ẩn các nút -->
<c:if test="${not empty maHoaDon}">

    <table class="table">
        <tr>
            <td>Mã hóa đơn chi tiết</td>
            <td>Tên sản phẩm</td>
            <td>Kích cỡ</td>
            <td>Màu sắc</td>
            <td>Thương hiệu</td>
            <td>Số lượng</td>
            <td>Đơn giá</td>
            <td>Thành tiền</td>
            <td>thao tac</td>
        </tr>
        <c:forEach items="${hoadonct}" var="ct">
            <tr>

<%--                <td>${ok.sanPham.ten}</td>--%>
<%--                <td>${ok.sanPham.loai}</td>--%>
<%--                <td>${ok.mauSac.ten_mau_sac}</td>--%>
<%--                <td>${ok.thuongHieu.ten_thuong_hieu}</td>--%>
<%--                <td>${ok.size}</td>--%>
<%--                <td>${ok.so_luong_ton}</td>--%>
<%--                <td>${ok.gia_ban}</td>--%>

                <td>${ct.ma_hdct}</td>
                <td>${ct.sanPhamChiTiet.sanPham.ten}</td>
                <td>${ct.sanPhamChiTiet.size}</td>
                <td>${ct.sanPhamChiTiet.mauSac.ten_mau_sac}</td>
                <td>${ct.sanPhamChiTiet.thuongHieu.ten_thuong_hieu}</td>
                <td style="text-align: center; display: flex">
                    <form action="/ban-hang/tang-so-luong" method="post" id="plus">
                        <input type="hidden" name="idSanPhamCT" value="${idSanPhamCT}" />
                        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
                        <button style="width: 30px; height: 30px; border-radius: 5px">+</button>
                    </form>

                    <input type="text" min="1" style="width: 40px; text-align: center; border-radius: 5px; margin: 0 5px 0 5px" value="${ct.soluong}">
                    <button style="width: 30px; height: 30px; border-radius: 5px">-</button>
                </td>
                <td>${ct.don_gia}</td>
                <td>${ct.thanh_tien}</td>
                <td>
                    <form action="/ban-hang/xoa-cthd" method="POST" id="deleteForm">
                        <input type="hidden" name="idHoaDonChiTiet" value="${ct.id_hoa_don_ct}" />
                        <input type="hidden" name="idHoaDon" value="${ct.id_hoa_don}" />
                        <button class="btn btn-danger" type="submit" onclick="deleteConfirm(event)">Xóa</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <form action="/ban-hang/xac-nhan-mua-hang" method="POST">
        <input type="hidden" name="idHoaDon" value="${idHoaDon}" />
        <p>
            <label>Địa chỉ</label>
            <input type="text" name="diaChi" required>
        </p>
        <p>
            <label>Email</label>
            <input type="email" name="email" required>
        </p>
        <p>
            <label>Số điện thoại</label>
            <input type="text" name="sdt" required>
        </p>
        <p>
            <label>Tổng tiền:</label>
            <label id="tongTien" style="color: red;">${tongTien}</label> <!-- Giá trị tổng tiền -->
            <input type="hidden" name="tongTien" value="${tongTien}"> <!-- Giá trị tổng tiền gửi kèm -->
        </p>
        <p>
            <label>Tiền khách đưa:</label>
            <input type="number" id="tienKhachDua" oninput="calculateChange()" placeholder="Nhập số tiền khách đưa" required>
        </p>
        <p>
            <label>Tiền thừa:</label>
            <input type="text" id="tienThua" readonly>
        </p>
        <button type="submit">Xác nhận mua hàng</button>
    </form>

</c:if>

<c:if test="${empty maHoaDon}">
    <!-- Không hiển thị các nút khi maHoaDon là null -->
</c:if>
<script>
    function calculateChange() {
        const tongTien = parseFloat(document.getElementById("tongTien").textContent) || 0;
        const tienKhachDua = parseFloat(document.getElementById("tienKhachDua").value) || 0;

        const tienThua = tienKhachDua - tongTien;
        document.getElementById("tienThua").value = tienThua >= 0 ? tienThua.toFixed(2) : "Chưa đủ tiền!";
    }
</script>

</body>
</html>
