
/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operatorü bir Boolean operatördür ve true - false değer döndürür. 
    EXISTS operatorü sıklıkla Subquery'lerde satırların doğruluğunu test etmek 
    için kullanılır.
    
    Eğer bir subquery (altsorgu) bir satırı döndürürse EXISTS operatörü de TRUE 
    değer döndürür. Aksi takdirde, FALSE değer döndürecektir.
    
    Özellikle altsorgularda hızlı kontrol işlemi gerçekleştirmek için kullanılır
==============================================================================*/CREATE TABLE mart_satislar 
    
    CREATE TABLE mart_satislar
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
   
    DELETE FROM nisan_satislar;
    
       
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/       
    -- tablolara kısa isim vermek mümkündür. Böylece sorgularımızın daha kısa 
    -- gözükmesini sağlabiliriz.
    
    -- AS  -> bir sutuna kısa isim veriyor.
    -- Bir sorgu içerisinde  tabloya da kısa isim vermek mümkün. 
    -- tablo_Adi kısa_isim
    
    SELECT musteri_isim FROM mart_satislar 
    
    WHERE EXISTS  (SELECT urun_id FROM nisan_satislar 
                  WHERE mart_satislar.urun_id = nisan_satislar.urun_id);


   -- WHERE urun_id IN(SELECT urun_id FROM nisan_satislar
   --          WHERE mart_satislar.urun_id = nisan_satislar.urun_id);  
   
   
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız. 
 -----------------------------------------------------------------------------*/
 
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satılmayan ürünlerin URUN_ISIM'lerini 
  ve bu ürünleri NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
 
 
    