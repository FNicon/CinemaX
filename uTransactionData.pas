unit uTransactionData;

interface

     type
          TransactionData = record
              nomorpesanan : longint;
              namafilm : string;
              tanggaltayang : longint;
              bulantayang : longint;
              tahuntayang : longint;
              jamtayang : real;
              total : longint;
              jenispembayaran : string;

          end;

     function TransactionDataCons(
              np : longint;
              nf : string;
              tt : longint;
              bt : longint;
              thnt : longint;
              jt : real;
              tot : longint;
              jp : string
     ):TransactionData;

implementation
     function TransactionDataCons(
              np : longint;
              nf : string;
              tt : longint;
              bt : longint;
              thnt : longint;
              jt : real;
              tot : longint;
              jp : string
     ):TransactionData;     
     begin
     
        TransactionDataCons.nomorpesanan := np;
        TransactionDataCons.namafilm := nf;
        TransactionDataCons.tanggaltayang := tt;
        TransactionDataCons.bulantayang := bt;
        TransactionDataCons.tahuntayang := thnt;
        TransactionDataCons.jamtayang := jt;
        TransactionDataCons.total := tot;
        TransactionDataCons.jenispembayaran := jp;
		
     end;
end.
