unit uFilter;



interface
	uses uFilm, sysutils;

	procedure genreFilter(Movie : Film
	);
	procedure ratingFilter(Movie : Film
	);

implementation

	{prrosedur genre filter}
	procedure genreFilter(Movie : Film
	);
		var
			i, N: integer;
			genre : string;
		begin	
			write('Input genre movie : '); readln(genre);
			 N := Movie.size;
			 for i:=1 to N do
			 begin
				if (genre = Movie.contents[i].genre) or (genre = LowerCase(Movie.contents[i].genre)) or (genre = UpperCase(Movie.contents[i].genre)) then 
					writeln(Movie.contents[i].judul);
			end;
		end;

	procedure ratingFilter(Movie : Film
	);
		var
			i,N: integer;
			rating : string;
		begin
			write('Input rating viewer : '); readln(rating);
			N := Movie.size;
			for i:=1 to N do
			begin
				if (rating = Movie.contents[i].viewer) or (rating = LowerCase(Movie.contents[i].viewer)) or (rating = UpperCase(Movie.contents[i].viewer)) then 
					writeln(Movie.contents[i].judul);
			end;
		end;

end.

