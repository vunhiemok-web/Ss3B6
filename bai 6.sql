-- ========================
-- 1. Tạo bảng (DDL)
-- ========================
CREATE TABLE products (
    product_id VARCHAR(5) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    size VARCHAR(5) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

-- ========================
-- 2. Insert dữ liệu
-- ========================
INSERT INTO products (product_id, product_name, size, price) VALUES
('P01', 'Áo sơ mi trắng', 'L', 250000),
('P02', 'Quần Jean xanh', 'M', 450000),
('P03', 'Áo thun Basic', 'XL', 150000),
('P04', 'Áo hoodie', 'M', 200000); -- đã sửa lỗi NULL + giá âm

-- ========================
-- 3. Update dữ liệu
-- ========================

-- Cập nhật giá P02
UPDATE products
SET price = 400000
WHERE product_id = 'P02';

-- Tăng toàn bộ giá lên 10%
UPDATE products
SET price = price * 1.1;

-- ========================
-- 4. Delete dữ liệu
-- ========================
DELETE FROM products
WHERE product_id = 'P03';

-- ========================
-- 5. Truy vấn (SELECT)
-- ========================

-- Xem toàn bộ sản phẩm
SELECT * FROM products;

-- In nhãn (Tên + Size)
SELECT product_name, size FROM products;

-- Sản phẩm giá > 300000
SELECT * FROM products WHERE price > 300000;