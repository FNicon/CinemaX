unit uFilter;



interface

	uses uFilm;
	
	var
	Movie : Film;

	procedure GenreFilter(
	genre : string
	);
	
	procedure RatingFilter(
	rating : string
	);

implementation

	{prrosedur genre filter}
	procedure GenreFilter(
	genre : string {input genre}
	);
		var
			i, N: integer;
		begin	
			 N := Movie.size;
			 for i:=1 to N do
			 begin
				if (genre = Movie.contents[i].genre) then 
					writeln(Movie.contents[i].judul);
			end;
		end;
			
			
	procedure RatingFilter(
	rating : string {input rating}
	);
		var
			i,N: integer;
		begin	
			N := Movie.size;
			for i:=1 to N do
			begin
				if (rating = Movie.contents[i].viewer) then 
					writeln(Movie.contents[i].judul);
			end;
		end;

end.
