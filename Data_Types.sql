/* DATA TYPES */

-- Exact Numeric Types
bit (0 to 1, 1 byte)
tinyint (0 to 255, 1 byte)
smallint (-32768 to +32767, 2 bytes)
int (-2147483648 to +2147483647, 4 bytes)
bigint (-9223372036854775808 to +9223372036854775807, 8 bytes)
smallmoney (-$214748.3648 to +$214748.3647, 4 bytes)
money (-$9223372036854775808 to +$9223372036854775807, 8 bytes)

-- Approximate Numeric Types
Real, float(24), single-precision
Float(53), double-precision (-1.79E308 to +1.79E308, up to 17 bytes) (mantissaEexponent)

-- Date
-- Automatically filled with today's date-time
Date 2019-10-22
DateTime 2019-10-22 00:00:00.000
DateTime2 2019-10-22 00:00:00.0000000
DateTimeOffset 2019-10-22 00:00:00.0000000 +02:00
SmallDateTime 2019-10-22 00:00:00
Time 17:00:00.0000000
TimeStamp 0x00000000000007D1

-- Character strings
char(n) (ANSI, fixed 1 to 8000, 1 byte per character)
varchar(n) (ANSI, variable 1 to 8000, 1 byte per character used)
nchar(n) (UNICODE, fixed 1 to 4000, 2 bytes per character)
nvarchar(n) (UNICODE, variable 1 to 4000, 2 bytes per character used)
varchar(max) (2 GB)
nvarchar(max) (2 GB)

-- Spatial data
geometry (e.g. Latitude, Longitude)
geography
SET geography = GEOGRAPHY::Point(Latitude, Longitude, spatial_reference_ID)
  Select * from sys.spatial_reference_systems
  
-- Binary data (es. images)
SELECT * FROM OPENROWSET(BULK N'C:\image.png', SINGLE_BLOB) as imagefile

/* Converting data types */

-- CAST Syntax:  
CAST ( expression AS data_type [ ( length ) ] )  
  SELECT Date, CAST(Date as char(50)) AS TextDate 
  
-- CONVERT Syntax:  
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  
  SELECT Date, CONVERT(char(50), Date, 101) AS TextDate
  
  Styles: 100 mes gg aaa hh:miAM (or PM)
          1 mm/gg/aa (Predefined)
          101 mm/gg/aaaa
          2 aa.mm.gg (ANSI)
          102 aaaa.mm.gg
          3 gg/mm/aa (UK)
          103 gg/mm/aaaa
          4 gg.mm.aa (German)
          104 gg.mm.aaaa
          5 gg-mm-aa (Italian)
          105 gg-mm-aaaa
          


  
