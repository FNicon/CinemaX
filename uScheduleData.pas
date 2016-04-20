unit uScheduleData;

interface

     type
          ScheduleData = record
               namafilm : string;
               jamtayang : real;
               tanggalmulaitayang : longint;
               bulanmulaitayang : longint;
               tahunmulaitayang : longint;
               lamaharitayang : longint;

          end;

     function ScheduleDataCons(
         n : string;
         j : real;
         t : longint;
         b : longint;
         thn : longint;
         l : longint
     ):ScheduleData;

implementation
     function ScheduleDataCons(
         n : string;
         j : real;
         t : longint;
         b : longint;
         thn : longint;
         l : longint
     ):ScheduleData;
     begin
        ScheduleDataCons.namafilm := n;
		ScheduleDataCons.jamtayang := j;
		ScheduleDataCons.tanggalmulaitayang := t;
		ScheduleDataCons.bulanmulaitayang := b;
		ScheduleDataCons.tahunmulaitayang := thn;
		ScheduleDataCons.lamaharitayang := l;
     end;
end.
