unit uNowPlaying;

interface
	uses uConfig, uFilm, uLoader, uParser;
	procedure nowPlaying (mainf:Film);
	{I.S : mainf bertipe film sudah terdefinisi}
	{F.S : Menampilkan semua film pada hari ini}

implementation
procedure nowPlaying (mainf: Film); 
var i : integer;
begin
	for i:=1 to mainf.size do
	begin
		writeln( mainf.contents[i].judul); {menghasilkan output judul film yang ditayangkan hari ini}
	end;
end;
end.
