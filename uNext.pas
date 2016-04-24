unit unext;
interface
	uses uLoader, uScheduleFilm, uDateData;
	procedure showNextDay (mainD:Schedule; mainDate : DateData);
	{I.S : Input tanggal}
	{F.S : Menampilkan semua film pada esok hari}

	function isUnique(chars : array of string; search : string) : boolean;
	{I.S : Input chars dan search terdefinisi}
	{F.S : Output True jika data ditemukan, False jika tidak}
	
implementation
	procedure showNextDay (mainD:Schedule; mainDate : DateData);				{Data from database_scehdule.txt}
	{KAMUS}
	var
		Date	: DateData;								{tanggal untuk input tanggal}
		i,idx	: integer;								{i counter}
		judul	: array [1..100] of string;						{judul untuk cek}
		cek : string;									{simpan sementara data untuk cek}
		found 	: boolean;
	begin
		idx := 1;
		found := false;
		cek:='';
		Date.tanggal := mainDate.tanggal + 1;
		Date.bulan := mainDate.bulan;
		Date.tahun := mainDate.tahun;
		for i:=1 to mainD.size do
		begin
			if (Date.bulan=mainD.contents[i].bulanmulaitayang) and (Date.tahun=mainD.contents[i].tahunmulaitayang) and (Date.tanggal=mainD.contents[i].tanggalmulaitayang) then
			begin
				if mainD.contents[i].namafilm<>cek then
				begin
					if(not(isUnique(judul,mainD.contents[i].namafilm))) then
					begin
						judul[idx] := mainD.contents[i].namafilm;
						cek:=judul[idx];
						idx:=idx+1;
					end;
					found := true;
				end;
			end;
		end;

		if (found) then
		begin
			for i:=1 to idx-1 do
				writeln(judul[i]);
		end else
		begin
			writeln('Tidak ada film yang ditayangkan pada hari selanjutnya');
		end;

	end;

	function isUnique(chars : array of string; search : string) : boolean;
	var
		num, i : integer;
		found : boolean;
	begin
		found := false;
		num := high(chars) - low(chars) + 1;
		i:=1;
		while(i<=num) and (not(found)) do
		begin
			if(chars[i] = search) then
				found := true
			else
				i:=i+1;
		end;
		isUnique := found;
	end;
end.
