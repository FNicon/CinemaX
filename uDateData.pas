unit uDateData;

interface

     type
          DateData = record
              tanggal : longint;
              bulan : longint;
              tahun : longint;
              hari : string;

          end;

     function DateDataCons(
              t : longint;
              b : longint;
              thn : longint;
              h : string
     ):DateData;

implementation
     function DateDataCons(
              t : longint;
              b : longint;
              thn : longint;
              h : string
     ):DateData;     
     begin
     
        DateDataCons.tanggal := t;
        DateDataCons.bulan := b;
        DateDataCons.tahun := thn;
        DateDataCons.hari := h;
        
     end;
end.
