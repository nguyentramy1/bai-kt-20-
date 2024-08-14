use springbootwebshopguide;

CREATE TABLE role(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

CREATE TABLE user (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  username VARCHAR(150) NOT NULL,
  password VARCHAR(150) NOT NULL,
  fullname VARCHAR(150) NULL,
  status int NOT NULL,
  roleid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id);

insert into role(code,name) values('ADMIN','ADMIN');
insert into role(code,name) values('USER','USER');

insert into user(username,password,fullname,status, roleid) values('admin','123456','admin',1,1);
insert into user(username,password,fullname,status, roleid) values('nguyenvana','123456','nguyen van a',1,2);
insert into user(username,password,fullname,status, roleid) values('nguyenvanb','123456','nguyen van b',1,2);



CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_san_pham VARCHAR(255) NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    gia_khuyen_mai DECIMAL(10, 2),
    url_anh VARCHAR(255),
    mo_ta TEXT,
    danh_muc VARCHAR(255) NOT NULL, 
    trang_thai VARCHAR(255) NOT NULL 
);


INSERT INTO product (ten_san_pham, gia, gia_khuyen_mai, url_anh, mo_ta, danh_muc, trang_thai)
VALUES 
    ('Áo thun', 19.99, 15.99, 'https://resource.nhuahvt.com/0x0/tmp/anh-quan-ao-noi-bat-1596646502.jpg', 'Áo thun cotton thoải mái.', 'Danh mục 1', 'Có sẵn'),
    ('Quần jeans', 49.99, 39.99, 'https://resource.nhuahvt.com/0x0/tmp/anh-quan-ao-noi-bat-1596646502.jpg', 'Quần jeans xanh thời trang.', 'Danh mục 2', 'Có sẵn'),
    ('Giày thể thao', 69.99, 59.99, 'https://resource.nhuahvt.com/0x0/tmp/anh-quan-ao-noi-bat-1596646502.jpg', 'Giày thể thao thoải mái.', 'Danh mục 3', 'Hết hàng'),
    ('Áo khoác', 99.99, 79.99, 'https://resource.nhuahvt.com/0x0/tmp/anh-quan-ao-noi-bat-1596646502.jpg', 'Áo khoác ấm mùa đông.', 'Danh mục 1', 'Có sẵn'),
    ('Mũ', 14.99, 9.99, 'https://resource.nhuahvt.com/0x0/tmp/anh-quan-ao-noi-bat-1596646502.jpg', 'Mũ baseball thời trang.', 'Danh mục 2', 'Có sẵn');
SELECT * FROM product;



