SELECT * FROM ds.orders;
SELECT * FROM ds.products;

-- semua produk berkategori sepatu
SELECT * FROM products
WHERE category = 'Sepatu';

-- jumlah produk
SELECT COUNT(name) AS total_produk
FROM products;

-- total penjualan
SELECT SUM(total_amount) AS total_penjualan
FROM orders;

-- performa setiap  kategori produk - total penjualan perkategori produk
SELECT pr.category, SUM(o.total_amount) AS total_penjualan
FROM orders o
JOIN products pr ON o.product_id = pr.id
GROUP BY pr.category
ORDER BY total_penjualan DESC;

-- top 3 produk
SELECT pr.name AS nama_produk, SUM(o.quantity) AS total_terjual
FROM orders o
JOIN products pr ON o.product_id = pr.id
GROUP BY nama_produk
ORDER BY total_terjual DESC, nama_produk ASC
LIMIT 3;