unit uSearch;



interface
	uses uFilm;

	procedure searchMovie(Movie : Film);


implementation


	procedure searchMovie(Movie : Film);

	var
		keyword : string;
		i, j, k, idk, l, tulis : integer;
		Cek : boolean;

	begin
		tulis:=0;
		write('Input keyword: '); readln(keyword);

		
		For j:=1 to Movie.size do 
		begin
		Cek := False;
		k:=1;
		
			while (k<length(Movie.contents[j].judul)) and Cek=False do {akses ke tiap element di array}
			begin
			if keyword[1]=Movie.contents[j].judul[k] then {jika huruf pertama keyword sama dengan sebuah huruf di judul}
				begin
					{cek untuk huruf pada keyword selanjutnya, apakah sama dengan huruf selanjutnya di judul}
					idk:=1;
					i:=1;
					l:=k;
					while (keyword[i]=Movie.contents[j].judul[l]) and (i<length(keyword)) do
						begin
							idk:=idk+1;
							i:=i+1;
							l:=l+1;
						end;
						
					if idk=length(keyword) then {jika keyword ditemukan di judul}
						begin
							writeln(Movie.contents[j].judul);
							Cek:=True;
							tulis:=tulis+1;
						end
					else
						begin
							k:=k+1;
						end;
				end else
							k:=k+1;
			end;
		
			
		end;
		
		if tulis=0 then {Jika tidak ditemukan keyword]
		writeln('Keyword not found');
	end;
end.
