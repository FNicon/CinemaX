unit uScheduleFilm;

interface
     uses uConfig, uScheduleData;

     type Schedule = record
          contents : array[1..ARRAY_LIMIT] of ScheduleData;
          size : longint;
     end;
	


implementation
   
end.
