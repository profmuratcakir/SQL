
/* ========================================================= 
                        TABLO OLUŞTURMA  (CRUD - Create)                  
============================================================*/
CREATE TABLE student 
(   
    std_id VARCHAR(4),
    std_name VARCHAR(20),
    std_age NUMBER
);
/* ========================================================= 
                     VERİ GİRİŞİ 
===========================================================*/

INSERT INTO student VALUES('1001', 'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYŞE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/* ========================================================= 
                    PARÇALI VERİ GİRİŞİ 
===========================================================*/
-- NOT: Veri girişi yapılmayan değişkenlere NULL atanır.

INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');

/* ========================================================= 
                    TABLODAN VERİ SORGULAMA  (CRUD - Read)  
===========================================================*/

SELECT * FROM student;

/* ========================================================= 
                    TABLO SİLME  (CRUD - Drop )
===========================================================*/

DROP TABLE student;

/*========================================================= 
                         CRUD ÖRNEK  
 ===========================================================
             
 Veritabanımızda urunler adında bir Tablo oluşturalım.
 urun_id  => NUMBER
 urun_adı => VARCHAR2(50)
 fiyat => NUMBER(5,2)
 tett => DATE,      
 stok_adedi => NUMBER(10)  
 Tabloya, Ürün girişi yapalım.Örneğin CİPS, KOLA, AYRAN, BİSKÜVİ,  
 (100, ‘CİPS’, 5.50, ‘01-05-2022’, 500)
 Verilerimizi çekelim.
 ===========================================================*/

CREATE TABLE urunler
(   
    urun_id NUMBER,
    urun_adı VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)
);

INSERT INTO urunler VALUES(101,'CİPS',5.25,'01-05-2022', 1500);
INSERT INTO urunler VALUES(102,'BİSKÜVİ',2.50,'01-07-2024',300);
INSERT INTO urunler VALUES(103,'GOFRET',1.50,'05-09-2023',120);
INSERT INTO urunler VALUES(104,'KOLA',4.50,'21-09-2025',50);
INSERT INTO urunler VALUES(105,'AYRAN',2.50,'01-05-2021',5);

SELECT * FROM urunler;

/* ===========================================================*/

