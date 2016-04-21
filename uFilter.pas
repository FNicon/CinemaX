unit uFilter;



interface

	uses uFilm;
	
	var
	Movie : Film;

	procedure genreFilter(
	);
	
	procedure ratingFilter(
	);

implementation

	{prrosedur genre filter}
	procedure genreFilter(
	);
		var
			i, N: integer;
			genre : string;
		begin	
			write('Input genre movie : '); readln(genre);
			 N := Movie.size;
			 for i:=1 to N do
			 begin
				if (genre = Movie.contents[i].genre) then 
					writeln(Movie.contents[i].judul);
			end;
		end;
			
			
	procedure ratingFilter(
	);
		var
			i,N: integer;
			rating : string;
		begin
			write('Input rating viewer : '); readln(rating);
			N := Movie.size;
			for i:=1 to N do
			begin
				if (rating = Movie.contents[i].viewer) then 
					writeln(Movie.contents[i].judul);
			end;
		end;

end.
