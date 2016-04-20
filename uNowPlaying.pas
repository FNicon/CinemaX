unit uNowPlaying;

interface
	uses uConfig, uFilm, uLoader, uParser;
	procedure nowplaying (mainf:Film);

implementation
procedure nowplaying (mainf: Film); {menampilkan film apa saja yang ditayangkan hari ini}
var i : integer;
begin
	for i:=1 to mainf.size do
	begin
		write ('>');
		writeln( mainf.contents[i].judul); {menghasilkan output judul film yang ditayangkan hari ini}
	end;
end;
end.
