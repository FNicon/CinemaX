unit uNowPlaying;

interface
	uses uConfig, uFilm, uLoader, uParser;
	procedure nowPlaying (mainf:Film);

implementation
procedure nowPlaying (mainf: Film); {menampilkan film apa saja yang ditayangkan hari ini}
var i : integer;
begin
	for i:=1 to mainf.size do
	begin
		write ('>');
		writeln( mainf.contents[i].judul); {menghasilkan output judul film yang ditayangkan hari ini}
	end;
end;
end.
