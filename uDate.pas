unit uDate;

interface
     uses uConfig, uDateData;

     type Date = record
          contents : array[1..ARRAY_LIMIT] of DateData;
          size : longint;
     end;



implementation
   
end.
