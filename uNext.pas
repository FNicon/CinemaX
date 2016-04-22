{Problems : data judul film harus terurut}

{Procedure showNextDay
G : Menerima input tanggal, output semua film yang ada pada esok hari
H : showNextDay(tanggal), output : judul Film esok hari
I : 
J :
K :
L :																																																																																									
}
unit unext;
interface
	uses uLoader, uScheduleFilm, uDateData;
	procedure showNextDay (mainD:Schedule; mainDate : DateData);
	{I.S : Input tanggal}
	{F.S : Menampilkan semua film pada esok hari}

	function isUnique(chars : array of string; search : string) : boolean;
	
implementation
	procedure showNextDay (mainD:Schedule; mainDate : DateData);							{Data from database_schdl.txt}
	{KAMUS}
	var
		tanggal	: DateData;								{tanggal untuk input tanggal}
		i,idx	: integer;							{i counter}
		judul	: array [1..100] of string;
		cek : string;							{simpan sementara data untuk cek}
		found 	: boolean;
	begin
		idx := 1;
		found := false;
		cek:='';
		tanggal.tanggal := mainDate.tanggal + 1;
		tanggal.bulan := mainDate.bulan;
		tanggal.tahun := mainDate.tahun;
		tanggal.hari := mainDate.hari;			{NxtD:=D.h+1;}
		for i:=1 to mainD.size do
		begin
			if (mainD.contents[i].bulanmulaitayang=tanggal.bulan) and (mainD.contents[i].tahunmulaitayang=tanggal.tahun) and (tanggal.tanggal>mainD.contents[i].tanggalmulaitayang) then
			begin
				if mainD.contents[i].namafilm<>cek then
				begin
					if(not(isUnique(judul,mainD.contents[i].namafilm))) then
					begin
						judul[idx] := mainD.contents[i].namafilm;
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
			writeln('Tidak ada film yang ditayangkan pada hari selanjutnya :)');
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

{mainF.contents[i].judul}
