unit uSearch;

interface
	uses uFilm;

	var
	Movie : Film;
	
	procedure searchMovie(
	);

implementation

	procedure searchMovie(
	);
	var
	keyword : string;
	i, j, k, l, idk: integer;
	
	begin
		write('Input keyword: '); readln(keyword);
		
		for j:=1 to Movie.size do {akses ke tiap element di array}
		begin
			for k:=1 to length(Movie.contents[j].judul) do {akses ke judul}
			begin
				if keyword[1]=Movie.contents[j].judul[k] then {jika huruf pertama keyword sama dengan sebuah huruf di judul}
					begin
						{cek untuk huruf pada keyword selanjutnya, apakah sama dengan huruf selanjutnya di judul}
						idk:=1;
						i:=1;
						l:=k;
						while (keyword[i]=Movie.contents[j].judul[l]) and (i<=length(keyword)) do
						begin
							idk:=idk+1;
							i:=i+1;
							l:=l+1;								
						end;
						
						if idk=length(keyword) then {jika keyword ditemukan di judul}
							writeln(Movie.contents[j].judul);
					end;
			end;
			
			for k:=1 to length(Movie.contents[j].genre) do
			begin
				if keyword[1]=Movie.contents[j].genre[k] then
					begin
						idk:=1;
						i:=1;
						l:=k;
						while (keyword[i]=Movie.contents[j].genre[l]) and (i<=length(keyword)) do
						begin
							idk:=idk+1;
							i:=i+1;
							l:=l+1;								
						end;
						
						if idk=length(keyword) then
							writeln(Movie.contents[j].judul);
					end;
			end;
			
			for k:=1 to length(Movie.contents[j].sinopsis) do
			begin
				if keyword[1]=Movie.contents[j].sinopsis[k] then
					begin
						idk:=1;
						i:=1;
						l:=k;
						while (keyword[i]=Movie.contents[j].sinopsis[l]) and (i<=length(keyword)) do
						begin
							idk:=idk+1;
							i:=i+1;
							l:=l+1;								
						end;
						
						if idk=length(keyword) then
							writeln(Movie.contents[j].judul);
					end;
			end;
			
		end;
	end;

end.
