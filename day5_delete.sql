
/* ============================== DELETE ===================================  */

    -- DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
    -- Bu komut bir DML komutudur. Dolayısıyla devamında WHERE gibi cümlecikler
    -- kullanılabilir.
    
    
    -- DELETE FROM tablo_adı
    -- WHERE sutun_adi = veri;
    
    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);

    SELECT * FROM ogrenciler;
    
     DROP TABLE ogrenciler;      
     
/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanılabilir. 
===============================================================================*/     

/* -----------------------------------------------------------------------------
  ORNEK1: id'si 124 olan ogrenciyi siliniz.
 -----------------------------------------------------------------------------*/ 
  
      DELETE FROM ogrenciler
      WHERE id = 124;
    
/* -----------------------------------------------------------------------------
  ORNEK2: ismi Kemal Yasa olan satırını siliniz.
 -----------------------------------------------------------------------------*/   
     
      DELETE FROM ogrenciler
      WHERE isim = 'Kemal Yasa';
      
/* -----------------------------------------------------------------------------
  ORNEK3: ismi Nesibe Yilmaz ve Mustafa Bak olan kayıtları silelim.
 -----------------------------------------------------------------------------*/        
      DELETE FROM ogrenciler
      WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak';
  
/* ----------------------------------------------------------------------------
  ORNEK4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
 -----------------------------------------------------------------------------*/    
      
     DELETE FROM ogrenciler
     WHERE isim = 'Ali Can' AND id = 123;
   
/* ----------------------------------------------------------------------------
  ORNEK5: id 'si 126'dan büyük olan kayıtları silelim.
 -----------------------------------------------------------------------------*/  
  
    DELETE FROM ogrenciler
    WHERE id>126;
 
 /* ----------------------------------------------------------------------------
  ORNEK6: id'si 123, 125 ve 126 olanları silelim.
 -----------------------------------------------------------------------------*/     
    
    DELETE FROM ogrenciler
    WHERE id IN(123,125,126);
    
/* ----------------------------------------------------------------------------
  ORNEK7:  TABLODAKİ TÜM KAYITLARI SİLELİM..
 -----------------------------------------------------------------------------*/     
    DELETE FROM ogrenciler; 
    
                    
/* ======================== DELETE - TRUCATE - DROP ============================   
    
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML değil DDL komutudur. 
    
    2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir. TRUNCATE ile 
    kullanılmaz.
    
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri 
    alınabilir.
    
    4-) Truncate ile silinen veriler geri alınması daha zordur. Ancak
    Transaction yöntemi ile geri alınması mümkün olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. Silinen tablo Veritabanının geri dönüşüm kutusuna gider. Silinen 
    tablo aşağıdaki komut ile geri alınabilir. Veya SQL GUI'den geri alınabilir. 
        
     FLASHBACK TABLE tablo_adı TO BEFORE DROP;  -> tabloyu geri alır.
     
     PURGE TABLE tablo_adı;        -> Geri dönüşümdeki tabloyu siler.
            
     DROP TABLE tablo_adı PURGE;  -> Tabloyu tamamen siler

==============================================================================*/ 
    DELETE FROM ogrenciler;  -- Tüm verileri sil.
    ROLLBACK;                -- Silinen Verileri geri getir.
    
        
    DROP TABLE ogrenciler;   -- Tabloyu siler ve Veritabanının Çöp kutusuna 
                             -- gönderir. (DDL komutudur.)
    
    
    -- Çöp kutusundaki tabloyu geri getirir.
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; 
         
    -- Tabloyu tamamen siler (Çöp kutusuna atmaz.)
    DROP TABLE ogrenciler PURGE;  
    
    -- Tüm veriler hassas bir şekilde siler.
    TRUNCATE TABLE ogrenciler; 
 
/* =============================================================================
    Tablolar arasında ilişki var ise veriler nasıl silinebilir?
============================================================================= */ 
    
         
/*============================== ON DELETE CASCADE =============================

  Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliğini aktif hale getirebiliriz.
  
  Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 
    
    CREATE TABLE talebeler
    (
        id CHAR(3),  --PK
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3),
        CONSTRAINT talebe_pk PRIMARY KEY (id)
    );
    
    INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
	INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

     CREATE TABLE notlar 
    ( 
        talebe_id char(3), --FK
        ders_adi varchar2(30), 
        yazili_notu number (3), 
        CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
        REFERENCES talebeler(id) ON DELETE CASCADE
    );

    INSERT INTO notlar VALUES ('123','kimya',75);
    INSERT INTO notlar VALUES ('124', 'fizik',65);
    INSERT INTO notlar VALUES ('125', 'tarih',90);
	INSERT INTO notlar VALUES ('126', 'Matematik',90);
    
    SELECT * FROM TALEBELER;
    SELECT * FROM NOTLAR;
    
    DELETE FROM notlar
    WHERE talebe_id = 124;
    
    DELETE FROM talebeler
    WHERE id = 124;
      