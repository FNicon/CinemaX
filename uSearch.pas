unit uSearch;
interface
	uses uFilm, uParser;

	procedure searchMovie(Movie : Film);


implementation


	procedure searchMovie(Movie : Film);
	var
		keyword: string;
		pil : integer;
		Cek : boolean;

	begin
		cek := false;

		while(not(cek)) do
		begin
		writeln('Search based on : ');
		writeln(' 1. Title');
		writeln(' 2. Genre');
		writeln(' 3. Synopsis');
		write('Masukkan pilihan : ');
		readln(pil);
			if(pil = 1) then
			begin
				write('Input keyword: '); readln(keyword);
				cek := true;
				cekJudul(keyword,Movie);
			end
			else if(pil = 2) then
			begin
				write('Input keyword: '); readln(keyword);
				cek := true;
				cekGenre(keyword, Movie);
			end
			else if(pil = 3) then
			begin
				write('Input keyword: '); readln(keyword);
				cek := true;
				cekSynopsis(keyword,Movie);
			end;
		end;
	end;
end.
