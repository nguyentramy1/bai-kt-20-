<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Sản phẩm</title>
    <style>
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
        img {
            max-width: 200px;
            height: auto;
        }
    </style>
</head>
<body>
<!-- Header -->
<div id="navbar">
    <div class="navbar-container">
        <div class="navbar-header">
            <a href="/admin/home" class="navbar-brand">Trang chủ</a>
        </div>
        <div class="navbar-buttons">
            <ul>
                <li><a href="#">Xin chào, ${userName}</a></li>
                <li><a href="/admin/logout">Đăng xuất</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- End Header -->

<!-- Menu -->
<div id="sidebar">
    <ul class="nav-list">
        <li><a href="#" onclick="showProducts()">Quản lý hàng hóa</a></li>
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
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Giá khuyến mại</th>
                    <th>Ảnh</th>
                    <th>Mô tả</th>
                    <th>Danh mục</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><c:out value="${product.id}" /></td>
                        <td><c:out value="${product.name}" /></td>
                        <td><c:out value="${product.price}" /></td>
                        <td><c:out value="${product.discountPrice}" /></td>
                        <td><img src="<c:out value="${product.imageUrl}" />" alt="Ảnh sản phẩm" width="100" /></td>
                        <td><c:out value="${product.description}" /></td>
                        <td><c:out value="${product.category}" /></td>
                        <td><c:out value="${product.status}" /></td>
                        <td>
                            <button class="btn btn-warning" onclick="showModal('editProductModal', ${product.id})">Sửa</button>
                            <button class="btn btn-danger" onclick="showModal('deleteProductModal', ${product.id})">Xóa</button>
                            <button class="btn btn-info" onclick="showModal('viewProductModal', ${product.id} )">Hiển thị</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- End body -->

<!-- Modal Thêm Sản phẩm -->
<div id="addProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Thêm sản phẩm</h2>
            <span class="close" onclick="closeModal('addProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form id="addProductForm" action="<c:url value='/admin/products/add' />" method="post">
                <label for="name">Tên sản phẩm:</label>
                <input type="text" id="name" name="name" required>

                <label for="price">Giá:</label>
                <input type="text" id="price" name="price" required>

                <label for="discountPrice">Giá khuyến mại:</label>
                <input type="text" id="discountPrice" name="discountPrice">

                <label for="imageUrl">URL ảnh:</label>
                <input type="text" id="imageUrl" name="imageUrl">

                <label for="description">Mô tả:</label>
                <textarea id="description" name="description"></textarea>

                <label for="category">Danh mục:</label>
                <select id="category" name="category" required>
                    <option value="Danh mục 1">Danh mục 1</option>
                    <option value="Danh mục 2">Danh mục 2</option>
                    <option value="Danh mục 3">Danh mục 3</option>
                </select>

                <label for="status">Trạng thái:</label>
                <select id="status" name="status" required>
                    <option value="Có sẵn">Có sẵn</option>
                    <option value="Hết hàng">Hết hàng</option>
                    <option value="Ngừng kinh doanh">Ngừng kinh doanh</option>
                </select>

                <button type="submit" class="btn btn-primary">Thêm</button>
            </form>
        </div>
    </div>
</div>

<!-- Modal Sửa Sản phẩm -->
<div id="editProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Sửa sản phẩm</h2>
            <span class="close" onclick="closeModal('editProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form id="editProductForm" action="<c:url value='/admin/products/edit' />" method="post">
                <input type="hidden" id="editProductId" name="id">

                <label for="editName">Tên sản phẩm:</label>
                <input type="text" id="editName" name="name" required>

                <label for="editPrice">Giá:</label>
                <input type="text" id="editPrice" name="price" required>

                <label for="editDiscountPrice">Giá khuyến mại:</label>
                <input type="text" id="editDiscountPrice" name="discountPrice">

                <label for="editImageUrl">URL ảnh:</label>
                <input type="text" id="editImageUrl" name="imageUrl">

                <label for="editDescription">Mô tả:</label>
                <textarea id="editDescription" name="description"></textarea>

                <label for="editCategory">Danh mục:</label>
                <select id="editCategory" name="category" required>
                    <option value="Danh mục 1">Danh mục 1</option>
                    <option value="Danh mục 2">Danh mục 2</option>
                    <option value="Danh mục 3">Danh mục 3</option>
                </select>

                <label for="editStatus">Trạng thái:</label>
                <select id="editStatus" name="status" required>
                    <option value="Có sẵn">Có sẵn</option>
                    <option value="Hết hàng">Hết hàng</option>
                    <option value="Ngừng kinh doanh">Ngừng kinh doanh</option>
                </select>

                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </form>
        </div>
    </div>
</div>

<!-- Modal Xóa Sản phẩm -->
<div id="deleteProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Xóa sản phẩm</h2>
            <span class="close" onclick="closeModal('deleteProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <form id="deleteProductForm" action="<c:url value='/admin/products/delete' />" method="post">
                <input type="hidden" id="deleteProductId" name="id">
                <p>Bạn có chắc chắn muốn xóa sản phẩm này không?</p>
                <button type="submit" class="btn btn-danger">Xóa</button>
                <button type="button" class="btn btn-secondary" onclick="closeModal('deleteProductModal')">Hủy</button>
            </form>
        </div>
    </div>
</div>

<!-- Modal Xem Sản phẩm -->
<div id="viewProductModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h2>Xem sản phẩm</h2>
            <span class="close" onclick="closeModal('viewProductModal')">&times;</span>
        </div>
        <div class="modal-body">
            <p><strong>ID:</strong> <span id="viewProductId"></span></p>
            <p><strong>Tên sản phẩm:</strong> <span id="viewProductName"></span></p>
            <p><strong>Giá:</strong> <span id="viewProductPrice"></span></p>
            <p><strong>Giá khuyến mại:</strong> <span id="viewProductDiscountPrice"></span></p>
            <p><strong>URL ảnh:</strong> <img id="viewProductImage" src="" alt="Ảnh sản phẩm"></p>
            <p><strong>Mô tả:</strong> <span id="viewProductDescription"></span></p>
            <p><strong>Danh mục:</strong> <span id="viewProductCategory"></span></p>
            <p><strong>Trạng thái:</strong> <span id="viewProductStatus"></span></p>
        </div>
    </div>
</div>

<script>
    // Function to show modal
    function showModal(modalId, productId) {
        // Show the correct modal
        document.getElementById(modalId).style.display = 'block';

        // Populate the form fields for edit or delete modal
        if (modalId === 'editProductModal') {
            // Fetch product details and populate the form (this is just an example)
            fetch(`/admin/products/${productId}`)
                .then(response => response.json())
                .then(product => {
                    document.getElementById('editProductId').value = product.id;
                    document.getElementById('editName').value = product.name;
                    document.getElementById('editPrice').value = product.price;
                    document.getElementById('editDiscountPrice').value = product.discountPrice;
                    document.getElementById('editImageUrl').value = product.imageUrl;
                    document.getElementById('editDescription').value = product.description;
                    document.getElementById('editCategory').value = product.category;
                    document.getElementById('editStatus').value = product.status;
                });
        } else if (modalId === 'deleteProductModal') {
            document.getElementById('deleteProductId').value = productId;
        } else if (modalId === 'viewProductModal') {
            // Populate view modal fields using AJAX or server-side rendering
            fetch(`/admin/products/${productId}`)
                .then(response => response.json())
                .then(product => {
                    document.getElementById('viewProductId').textContent = product.id;
                    document.getElementById('viewProductName').textContent = product.name;
                    document.getElementById('viewProductPrice').textContent = product.price;
                    document.getElementById('viewProductDiscountPrice').textContent = product.discountPrice;
                    document.getElementById('viewProductImage').src = product.imageUrl;
                    document.getElementById('viewProductDescription').textContent = product.description;
                    document.getElementById('viewProductCategory').textContent = product.category;
                    document.getElementById('viewProductStatus').textContent = product.status;
                });
        }
    }

    // Function to close modal
    function closeModal(modalId) {
        document.getElementById(modalId).style.display = 'none';
    }

    // Show products list on page load
    document.addEventListener('DOMContentLoaded', showProducts);
</script>
</body>
</html>
