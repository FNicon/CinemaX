unit uCapacity;

interface
     uses uConfig, uCapacityData;

     type Capacity = record
          contents : array[1..ARRAY_LIMIT] of CapacityData;
          size : longint;
     end;



implementation
   
end.
