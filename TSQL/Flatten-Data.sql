/* Flatten data */
/* 
  Source: https://stackoverflow.com/questions/54135039/flatten-table-rows-into-columns-in-sql-server
  Example:
    From: 
      Code          Data
      SL Payroll    22
      SL Payroll    33
      SL Payroll    43
      ..            .....
   To:
      Code         Data1   Data2   Data3  ..
      SL Payroll   22       33      43    ....  
*/

select code,
       max(case when seqnum = 1 then code end) as code_1,
       max(case when seqnum = 2 then code end) as code_2,
       max(case when seqnum = 3 then code end) as code_3
from (select t.*,
             row_number() over (partition by code order by data) as seqnum
      from t
     ) t
group by code;
