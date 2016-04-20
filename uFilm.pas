unit uFilm;

interface
     uses uConfig, uFilmData;

     type Film = record
          contents : array[1..ARRAY_LIMIT] of FilmData;
          size : longint;
     end;

implementation
end.
