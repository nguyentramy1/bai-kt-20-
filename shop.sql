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
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    manufacturer VARCHAR(255) NOT NULL,
    color VARCHAR(50),
    category VARCHAR(50),
    in_stock BOOLEAN DEFAULT TRUE
);
INSERT INTO product (name, quantity, manufacturer, color, category, in_stock)
VALUES 
    ('Áo thun nam', 100, 'Nhà sản xuất A', 'Trắng', 'Áo cộc tay', TRUE),
    ('Áo khoác nữ', 50, 'Nhà sản xuất B', 'Đen', 'Áo khoác', TRUE),
    ('Quần jean nam', 200, 'Nhà sản xuất C', 'Xanh', 'Quần dài', TRUE),
    ('Váy đầm nữ', 80, 'Nhà sản xuất D', 'Đỏ', 'Váy', TRUE),
    ('Áo sơ mi nam', 150, 'Nhà sản xuất E', 'Xanh dương', 'Áo sơ mi', TRUE),
    ('Quần short nữ', 120, 'Nhà sản xuất F', 'Hồng', 'Quần short', TRUE),
    ('Áo khoác da nam', 30, 'Nhà sản xuất G', 'Nâu', 'Áo khoác', TRUE),
    ('Giày thể thao', 60, 'Nhà sản xuất H', 'Trắng', 'Giày', TRUE),
    ('Nón bảo hiểm', 90, 'Nhà sản xuất I', 'Đen', 'Phụ kiện', TRUE),
    ('Túi xách nữ', 70, 'Nhà sản xuất J', 'Xanh lá', 'Phụ kiện', TRUE);
SELECT * FROM product;

