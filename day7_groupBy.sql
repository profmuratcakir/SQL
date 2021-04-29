 
 /*============================= GROUP BY =====================================
    
    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine göre satılan toplam meyve miktarlarını gösteren sorguyu 
  yazınız.
------------------------------------------------------------------------------*/  
    SELECT isim, SUM(urun_miktari) AS toplam_urun 
    FROM manav
    GROUP BY isim;
   
/* ----------------------------------------------------------------------------
  ORNEK2: satılan meyve türüne (urun_adi) göre urun alan kişi sayısını gösteren
  sorguyu yazınız. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
    -- GROUP by ile birlikte WHERE cümleciği kullanılabilir.
        
    SELECT urun_adi, COUNT(isim) AS kisi_sayisi
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi;
    
    SELECT * FROM manav;
    
   
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyve türüne (urun_adi) göre satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak listeyen sorguyu 
  yazınız.
-----------------------------------------------------------------------------*/ 
    SELECT urun_adi,MIN(urun_miktari) min_miktar, MAX(urun_miktari) maks_miktar
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY MAX(urun_miktari) DESC;
    
/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/ 
     SELECT isim, urun_adi, SUM(urun_miktari) as toplam_miktar
     FROM manav
     WHERE urun_adi IS NOT NULL
     GROUP BY isim, urun_adi
     ORDER BY isim DESC;
     
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun adına göre satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak listeyen sorguyu yazınız.
 -----------------------------------------------------------------------------*/  
     SELECT isim, urun_adi, SUM(urun_miktari) as toplam_miktar
     FROM manav
     GROUP BY isim, urun_adi
     HAVING SUM(urun_miktari) >= 3
     ORDER BY SUM(urun_miktari) DESC;
     
    -- AGGREGATE fonksiyonları ile ilgili bir koşul koymak için GROUP BY'dan 
    -- sonra HAVING cümleciği kullanılır.
 
 /* ----------------------------------------------------------------------------
  ORNEK6: satılan urun_adi'na göre MAX urun sayılarını sıralayarak listeyen 
  sorguyu yazınız. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
 -----------------------------------------------------------------------------*/    
     SELECT urun_adi, MAX(urun_miktari)
     FROM manav
     GROUP BY urun_adi
     HAVING MAX(urun_miktari) <> MIN(urun_miktari)
     ORDER BY MAX(urun_miktari);


 /*============================= DISTINCT =====================================
    
    DISTINCT cümleciği bir SORGU ifadesinde benzer olan satırları flitrelemek
    için kullanılır. Dolayısıyla seçilen sutun yada sutunlar için benzersiz veri
    içeren satırlar oluşturmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, satin_adi3
    FROM  tablo_adı;
==============================================================================*/
    
     
/* ----------------------------------------------------------------------------
  ORNEK1: satılan farklı meyve türlerinin sayısını listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/   
    
    SELECT COUNT(DISTINCT urun_adi) AS urun_sayisi 
    FROM manav;

/* -----------------------------------------------------------------------------
  ORNEK2: satılan meyve ve isimlerin farklı olanlarını listeyen sorguyu yazınız.
------------------------------------------------------------------------------*/
     SELECT DISTINCT urun_adi,isim   -- 2 sutun icin beraber degerlendirirek
                                     -- benzerli olanları cikariyor.
     FROM manav; 
     
/* ----------------------------------------------------------------------------
  ORNEK3: satılan meyvelerin urun_mikarlarinin benzersiz  olanlarının 
  toplamlarini listeyen sorguyu yazınız.
-----------------------------------------------------------------------------*/     
     SELECT SUM(DISTINCT urun_miktari) AS urun_sayisi 
     FROM manav;
      
     
     
     
     