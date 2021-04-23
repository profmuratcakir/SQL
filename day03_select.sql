
/* ======================= SELECT - WHERE ==================================*/

    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler;
    
/* ============================================================================
   Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adıWHERE koşul;
==============================================================================*/
  
/* -----------------------------------------------------------------------------
  ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/  
    SELECT * FROM ogrenciler 
    WHERE sinav_notu>80;
    
    -- notu 80 den büyük olanların sadece isim ve not bilgilerini listeleme
    SELECT isim,sinav_notu
    FROM ogrenciler 
    WHERE sinav_notu>80;
    
 /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
    
 /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
    SELECT * FROM ogrenciler
    WHERE id = 124;
    
            
/* ======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yılmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayşe Can', 4000);

    SELECT * FROM personel;
    
    -- NOT:BETWEEN iki mantıksal ifade ile tanımlayabileceğimiz durumları 
    -- tek komutla yazabilme imkânı verir. Yazdığımız 2 sınır da aralığa dahildir.
    
/*============================================================================*/
   
/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasında olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
    --1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST LİMİTLER DAHİLDİR.
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Yılmaz' AND 'Veli Han';
    
/* -----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasında olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir

    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    --1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     --2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004);   
    
/* -----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.

    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adıWHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile başlayanları listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diğer harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';

/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile başlamayanları listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';

 /* -----------------------------------------------------------------------------
  ORNEK16:  maaşının son 2 hanesi 00 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';

/* -----------------------------------------------------------------------------
  ORNEK17:  maaşının 4000 olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
 /* -----------------------------------------------------------------------------
  ORNEK18: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
  /* -----------------------------------------------------------------------------
  ORNEK19: maaşının  5 haneli olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  

    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    

    
   
    
    
    
    
    











