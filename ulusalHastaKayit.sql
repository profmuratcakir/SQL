/* ========================== HASTA PROJESI =================================*/   
    
     
    CREATE TABLE hastaneler
    (
        id CHAR(5) PRIMARY KEY,
        isim VARCHAR2(50),
        sehir VARCHAR2(10),
        ozel CHAR(1)
    );
    
    INSERT INTO hastaneler VALUES('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
    INSERT INTO hastaneler VALUES('H102', 'HASZEKI HASTANESI', 'İSTANBUL', 'N');
    INSERT INTO hastaneler VALUES('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
    INSERT INTO hastaneler VALUES('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'Y');
    
    CREATE TABLE bolumler
    (
        bolum_id CHAR(5) PRIMARY KEY,
        bolum_adi VARCHAR2(20)
    ); 
    
    INSERT INTO bolumler VALUES('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES('KBB', 'Kulak-Burun-Boğaz');
    INSERT INTO bolumler VALUES('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES('GAST', 'Gastoroloji');
    INSERT INTO bolumler VALUES('KARD', 'Kardioloji');
    INSERT INTO bolumler VALUES('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES('GOZ', 'Goz Hastaliklari');
     
    CREATE TABLE hastalar
    (
        kimlik_no CHAR(11) PRIMARY KEY,
        isim VARCHAR2(20),
        teshis VARCHAR2(30)
    );
    
    INSERT INTO hastalar VALUES('12345678901', 'Ali Can','Gizli Seker');
    INSERT INTO hastalar VALUES('45678901121', 'Ayşe Yılmaz','Hipertansiyon');
    INSERT INTO hastalar VALUES('78901123451', 'Steve Job','Pankreatit');
    INSERT INTO hastalar VALUES('12344321251', 'Tom Hanks','COVID19');
    
    CREATE TABLE hasta_kayitlar
    (
        kimlik_no CHAR(11),
        hast_isim VARCHAR2(20),
        hastane_adi VARCHAR2(50),
        bolum_adi VARCHAR2(20), 
        teshis VARCHAR2(30)
    ); 
    
    INSERT INTO hasta_kayıtlar VALUES('1111','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('2222','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('3333','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('4444','NONAME','','','');
    INSERT INTO hasta_kayıtlar VALUES('5555','NONAME','','','');
   
    DROP TABLE HASTA_KAYITLAR ;
   DROP TABLE HASTALAR ;
  DROP TABLE BOLUMLER;
  DROP TABLE HASTANELER 
   

    SELECT * FROM hastaneler;
    SELECT * FROM bolumler;
    SELECT * FROM hastalar;
    SELECT * FROM hasta_kayitlar;
  
    
    UPDATE hasta_kayitlar
    SET hast_isim = (SELECT isim FROM hastalar
                    WHERE isim = 'Ali Can'),
                    
        hastane_adi = (SELECT isim FROM hastaneler
                        WHERE id = 'H104'),            
    
        bolum_adi = (SELECT bolum_adi FROM bolumler
                        WHERE bolum_id = 'DHL'), 
                        
        teshis = (SELECT teshis FROM hastalar
                    WHERE isim  = 'Ali Can'),
                    
        kimlik_no = (SELECT kimlik_no FROM hastalar
                    WHERE isim  = 'Ali Can')
    
    WHERE kimlik_no = '1111';
   
   
    UPDATE hasta_kayitlar
    SET hast_isim = (SELECT isim FROM hastalar
                    WHERE isim = 'Ayşe Yılmaz'),
                    
        hastane_adi = (SELECT isim FROM hastaneler
                        WHERE id = 'H103'),            
    
        bolum_adi = (SELECT bolum_adi FROM bolumler
                        WHERE bolum_id = 'KBB'), 
                        
        teshis = (SELECT teshis FROM hastalar
                    WHERE isim  = 'Tom Hanks'),
                    
        kimlik_no = (SELECT kimlik_no FROM hastalar
                    WHERE isim  = 'Steve Job')
    
    WHERE kimlik_no = '2222';
   
   	UPDATE hasta_kayitlar
   	
   	SET hast_isim = 'Salvadore Dali',
                    
        hastane_adi = 'John Hopkins',           
    
        bolum_adi = 'Noroloji', 
                        
        teshis = 'Parkinson',
                    
        kimlik_no = '99991111222'
       
    WHERE kimlik_no = '3333';
   
   
   
   
   
    