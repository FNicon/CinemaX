unit uTransaction;

interface
     uses uConfig, uTransactionData;

     type Transaction = record
          contents : array[1..ARRAY_LIMIT] of TransactionData;
          size : longint;
     end;



implementation
   
end.
