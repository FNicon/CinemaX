unit uCapacityData;

interface
     type
          CapacityData = record
              namafilm : string;
              tanggal : longint;
              bulan : longint;
              tahun : longint;
              jam : real;
              sisakursi : longint;
          end;

     function CapacityDataCons(
              nf : string;
              t : longint;
              b : longint;
              thn : longint;
              j : real;
              sk : longint
     ):CapacityData;

implementation
     function CapacityDataCons(
              nf : string;
              t : longint;
              b : longint;
              thn : longint;
              j : real;
              sk : longint
     ):CapacityData;     
     begin
     
        CapacityDataCons.namafilm := nf;
        CapacityDataCons.tanggal := t;
        CapacityDataCons.bulan := b;
        CapacityDataCons.tahun := thn;
        CapacityDataCons.jam := j;
        CapacityDataCons.sisakursi := sk;
       
		
     end;
end.
