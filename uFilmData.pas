unit uFilmData;

interface

     type
          FilmData = record
               judul : string;
               genre : string;
               viewer : string;
               durasi : string;
               sinopsis : string;
               pWeekdays : longint;
               pWeekend : longint;
          end;

     function FilmDataCons(
          j : string;
          g : string;
          v : string;
          d : string;
          s : string;
          pDays : longint;
          pEnds : longint
     ):FilmData;

implementation
     function FilmDataCons(
          j : string;
          g : string;
          v : string;
          d : string;
          s : string;
          pDays : longint;
          pEnds : longint
     ):FilmData;
     begin
          FilmDataCons.judul := j;
          FilmDataCons.genre := g;
          FilmDataCons.viewer := v;
          FilmDataCons.durasi := d;
          FilmDataCons.sinopsis := s;
          FilmDataCons.pWeekDays := pDays;
          FilmDataCons.pWeekend := pEnds;
     end;
end.
