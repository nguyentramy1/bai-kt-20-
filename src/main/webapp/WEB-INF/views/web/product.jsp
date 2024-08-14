<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ admin</title>
    <style>
        /* CSS ở đây */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        #navbar {
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            text-align: left;
        }
        .navbar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar-header a {
            color: #fff;
            text-decoration: none;
            font-size: 24px;
        }
        .navbar-buttons ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .navbar-buttons ul li {
            margin-left: 15px;
        }
        .navbar-buttons ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        #sidebar {
            width: 200px;
            background-color: #222;
            position: absolute;
            top: 50px;
            bottom: 0;
            left: 0;
            padding: 20px 0;
        }
        .nav-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .nav-list li {
            padding: 10px 20px;
        }
        .nav-list li a {
            color: #fff;
            text-decoration: none;
            display: block;
        }
        .nav-list li a:hover {
            background-color: #444;
        }
        .main-container {
            margin-left: 220px;
            padding: 20px;
        }
        h1 {
            margin-top: 0;
        }
        .table-responsive {
            margin-top: 20px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }
        .table th, .table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .table th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 5px 10px;
            margin-right: 5px;
            text-decoration: none;
            color: #fff;
            border-radius: 3px;
        }
        .btn-primary {
            background-color: #007bff;
        }
        .btn-warning {
            background-color: #ffc107;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-info {
            background-color: #17a2b8;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        .modal-body {
            padding: 10px 0;
        }
        .modal-footer {
            padding-top: 10px;
            border-top: 1px solid #ddd;
            text-align: right;
        }
    </style>
</head>
<body>

<!-- Header -->
<div id="navbar">
    <div class="navbar-container">
        <div class="navbar-header">
            <a href="<c:url value='/admin/home'/>" class="navbar-brand">
                <i class="fa fa-leaf"></i>
                Trang chủ
            </a>
        </div>
        <div class="navbar-buttons">
            <ul>
                <li>
                    <a href="#">Xin chào, [fullName]</a>
                </li>
                <li>
                    <a href="<c:url value='/admin/logout' />">
                        Đăng xuất
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- End Header -->

<!-- Begin menu -->
<div id="sidebar">
    <ul class="nav-list">
        <li>
            <a href="<c:url value='/admin/products' />">
                <i class="fa fa-cubes"></i>
                Quản lý hàng hóa
            </a>
        </li>
    </ul>
</div>
<!-- End menu -->

<!-- Begin body -->
<div class="main-container">
    <h1>Danh sách hàng hóa</h1>
    <button class="btn btn-primary" onclick="showModal('addProductModal')">Thêm hàng hóa</button>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Số lượng</th>
                    <th>Nhà sản xuất</th>
                    <th>Màu</th>
                    <th>Thể loại</th>
                    <th>Còn hàng</th>
                    <th>Giá</th> <!-- Cột mới cho trường giá -->
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><c:out value="${product.id}" /></td>
                        <td><c:out value="${product.name}" /></td>
                        <td><c:out value="${product.quantity}" /></td>
                        <td><c:out value="${product.manufacturer}" /></td>
                        <td><c:out value="${product.color}" /></td>
                        <td><c:out value="${product.category}" /></td>
                        <td><c:out value="${product.inStock ? 'Có' : 'Không'}" /></td>
                        <td><c:out value="${product.price}" /></td> <!-- Hiển thị giá -->
                        <td>
                            <button class="btn btn-warning" onclick="showModal('editProductModal', ${product.id})">Sửa</button>
                            <button class="btn btn-danger" onclick="showModal('deleteProductModal', ${product.id})">Xóa</button>
                            <button class="btn btn-info" onclick="showModal('viewProductModal', ${product.id})">Hiển thị</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- End body -->

<!-- Modal Thêm sản phẩm -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Thêm sản phẩm</h2>
            <span class="close" onclick="closeModal('addProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form action="<c:url value='/admin/products/add' />" method="post">
                <label for="name">Tên:</label>
                <input type="text" id="name" name="name" required>

                <label for="quantity">Số lượng:</label>
                <input type="number" id="quantity" name="quantity" required>

                <label for="manufacturer">Nhà sản xuất:</label>
                <input type="text" id="manufacturer" name="manufacturer" required>

                <label for="color">Màu:</label>
                <input type="text" id="color" name="color" required>

                <label for="category">Thể loại:</label>
                <input type="text" id="category" name="category" required>

                <label for="inStock">Còn hàng:</label>
                <input type="checkbox" id="inStock" name="inStock">

                <label for="price">Giá:</label> <!-- Trường nhập giá -->
                <input type="number" id="price" name="price" required>

                <button type="submit" class="btn btn-primary">Thêm</button>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('addProductModal')">Đóng</button>
        </div>
    </div>
</div>

<!-- Modal Sửa sản phẩm -->
<div id="editProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Sửa sản phẩm</h2>
            <span class="close" onclick="closeModal('editProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form id="editProductForm" action="<c:url value='/admin/products/edit' />" method="post">
                <input type="hidden" id="editProductId" name="id">

                <label for="editName">Tên:</label>
                <input type="text" id="editName" name="name" required>

                <label for="editQuantity">Số lượng:</label>
                <input type="number" id="editQuantity" name="quantity" required>

                <label for="editManufacturer">Nhà sản xuất:</label>
                <input type="text" id="editManufacturer" name="manufacturer" required>

                <label for="editColor">Màu:</label>
                <input type="text" id="editColor" name="color" required>

                <label for="editCategory">Thể loại:</label>
                <input type="text" id="editCategory" name="category" required>

                <label for="editInStock">Còn hàng:</label>
                <input type="checkbox" id="editInStock" name="inStock">

                <label for="editPrice">Giá:</label> <!-- Trường chỉnh sửa giá -->
                <input type="number" id="editPrice" name="price" required>

                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('editProductModal')">Đóng</button>
        </div>
    </div>
</div>

<!-- Modal Xóa sản phẩm -->
<div id="deleteProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Xóa sản phẩm</h2>
            <span class="close" onclick="closeModal('deleteProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
            <form id="deleteProductForm" action="<c:url value='/admin/products/delete' />" method="post">
                <input type="hidden" id="deleteProductId" name="id">
                <button type="submit" class="btn btn-danger">Xóa</button>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('deleteProductModal')">Đóng</button>
        </div>
    </div>
</div>

<!-- Modal Hiển thị sản phẩm -->
<div id="viewProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Thông tin sản phẩm</h2>
            <span class="close" onclick="closeModal('viewProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <p><strong>ID:</strong> <span id="viewProductId"></span></p>
            <p><strong>Tên:</strong> <span id="viewProductName"></span></p>
            <p><strong>Số lượng:</strong> <span id="viewProductQuantity"></span></p>
            <p><strong>Nhà sản xuất:</strong> <span id="viewProductManufacturer"></span></p>
            <p><strong>Màu:</strong> <span id="viewProductColor"></span></p>
            <p><strong>Thể loại:</strong> <span id="viewProductCategory"></span></p>
            <p><strong>Còn hàng:</strong> <span id="viewProductInStock"></span></p>
            <p><strong>Giá:</strong> <span id="viewProductPrice"></span></p> <!-- Hiển thị giá -->
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('viewProductModal')">Đóng</button>
        </div>
    </div>
</div>

<script>
    function showModal(modalId, productId) {
        var modal = document.getElementById(modalId);
        if (productId) {
            // Fetch product data and populate form for edit or view
            var url = '<c:url value="/admin/products/get/" />' + productId;
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (modalId === 'editProductModal') {
                        document.getElementById('editProductId').value = data.id;
                        document.getElementById('editName').value = data.name;
                        document.getElementById('editQuantity').value = data.quantity;
                        document.getElementById('editManufacturer').value = data.manufacturer;
                        document.getElementById('editColor').value = data.color;
                        document.getElementById('editCategory').value = data.category;
                        document.getElementById('editInStock').checked = data.inStock;
                        document.getElementById('editPrice').value = data.price; // Set giá cho trường edit
                    } else if (modalId === 'viewProductModal') {
                        document.getElementById('viewProductId').innerText = data.id;
                        document.getElementById('viewProductName').innerText = data.name;
                        document.getElementById('viewProductQuantity').innerText = data.quantity;
                        document.getElementById('viewProductManufacturer').innerText = data.manufacturer;
                        document.getElementById('viewProductColor').innerText = data.color;
                        document.getElementById('viewProductCategory').innerText = data.category;
                        document.getElementById('viewProductInStock').innerText = data.inStock ? 'Có' : 'Không';
                        document.getElementById('viewProductPrice').innerText = data.price; // Hiển thị giá trong view
                    }
                });
        }
        modal.style.display = 'block';
    }

    function closeModal(modalId) {
        var modal = document.getElementById(modalId);
        modal.style.display = 'none';
    }
</script>

</body>
</html>
