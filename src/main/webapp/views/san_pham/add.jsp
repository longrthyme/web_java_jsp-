<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        function confirmUpdate() {
            return confirm("Bạn có chắc chắn thêm sản phẩm này không?");
        }
    </script>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
   <div class="mb-4" style="width: 60%;"> <!-- Adjust width as needed -->
      <h3>Thêm sản phẩm mới</h3>
      <form action="/san-pham/them" method="post" onsubmit="return confirmAdd();">
          <div class="form-group mb-3">
              <label for="ma" class="sr-only">Mã sản phẩm</label>
              <input type="text" class="form-control" id="ma" name="ma" placeholder="Mã sản phẩm">
          </div>

          <div class="form-group mb-3">
              <label for="gia" class="sr-only">Giá sản phẩm</label>
              <input type="text" class="form-control" id="gia" name="gia" placeholder="Giá sản phẩm">
          </div>

          <div class="form-group mb-3">
              <label for="ten" class="sr-only">Tên sản phẩm</label>
              <input type="text" class="form-control" id="ten" name="ten" placeholder="Tên sản phẩm">
          </div>

          <div class="form-group mb-3">
              <label for="loai" class="sr-only">Loại sản phẩm</label>
              <input type="text" class="form-control" id="loai" name="loai" placeholder="Loại sản phẩm">
          </div>

          <div class="form-group mb-3">
              <label for="trangThai" class="sr-only">Trạng thái</label>
              <select class="form-control" id="trangThai" name="trangThai">
                  <option value="true">Còn hàng</option>
                  <option value="false">Hết hàng</option>
              </select>
          </div>

          <button type="submit" class="btn btn-primary mb-2">Thêm sản phẩm</button>
      </form>

      <a href="/san-pham/index" class="btn btn-secondary mt-3">Quay lại danh sách sản phẩm</a>
   </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>