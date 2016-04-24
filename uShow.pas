unit ushow;

interface
	uses uFilm;

	procedure showMovie (mainF: Film);
	{I.S : Judul terdefinisi}
	{F.S : Menampilkan properties lain dari film}

implementation
	procedure showMovie (mainF: Film);									{data from database_film.txt}
	{KAMUS}
	var
		i : integer;											{counter}
		judul : string;											{input judul}

	begin
		readln('> Masukkan judul : ',judul);								{input}
		for i:=1 to mainF.size do									{cek hingga batas array}
		begin
			if judul=mainF.contents[i].judul then							{Bila nemu judul, tampilkan yang lain}
			begin
				writeln('Genre 		    	: ',mainF.contents[i].genre);			{output}
				writeln('ViewerRating 		: ',mainF.contents[i].viewer);			{output}
				writeln('Durasi		    	: ',mainF.contents[i].durasi);			{output}
				writeln('Sinopsis		: ',mainF.contents[i].sinopsis);		{output}
				writeln('HargaWeekdays		: ',mainF.contents[i].pWeekdays);		{output}
				writeln('HargaWeekdend		: ',mainF.contents[i].pWeekend);		{output}
			end;
		end;
	end;
end.
