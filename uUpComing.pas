unit uUpComing;

interface
	uses uConfig, uDate, uScheduleFilm, uLoader, uParser;
	procedure upcoming (mains:Schedule; maind :Date);
	function cekkabisat (maind: Date) : boolean;
implementation
function cekkabisat (maind:Date)  : boolean ; {fungsi untuk mencek tahun merupakan tahun kabisat atau bukan}
begin
	If (maind.tahun mod 100 = 0) Then
	begin
		If (maind.tahun  mod 400 = 0) Then 
		begin
			cekkabisat:=True; {merupakan tahun kabisat}
		end;
	end else if (maind.tahun  mod 4 =0) then
	begin
		cekkabisat:=True; {merupakan tahun kabisat}
	end;
end;
		
procedure upcoming (mains:Schedule; maind :Date); {menampilkan film apa saja yang akan ditayangkan minggu depan. minggu depan adalah 7 hari setelah hari ini}
var i : integer;
	a,b: longint;
begin
	for i:=1 to mains.size do
	begin
		if (maind.tanggal+7>31) and ((maind.bulan=01) or (maind.bulan=03) or (maind.bulan=05) or (maind.bulan=07) or (maind.bulan=08) or (maind.bulan=10) or (maind.bulan=12)) and (maind.tahun=mains.contents[i].tahunmulaitayang)  then
		begin
			a:= maind.tanggal+7-31; {jika tanggal hari ini lebih besar dari tanggal minggu depan}
			b:= maind.bulan+1; {jika bulan hari ini lebih kecil dari bulan minggu depan}
			if (a=mains.contents[i].tanggalmulaitayang) and (b=mains.contents[i].bulanmulaitayang) then
			begin
				writeln('>',mains.contents[i].namafilm);
			end;
		end else if (maind.tanggal+7>30) and ((maind.bulan=04) or (maind.bulan=06) or (maind.bulan=09) or (maind.bulan=11)) then
		begin
			a:= maind.tanggal+7-30; {jika tanggal hari ini lebih besar dari tanggal minggu depan}
			b:= maind.bulan+1; {jika bulan hari ini lebih kecil dari bulan minggu depan}
			if (a=mains.contents[i].tanggalmulaitayang) and (b=mains.contents[i].bulanmulaitayang) then
			begin
				writeln('>',mains.contents[i].namafilm);
			end;
		end else if (maind.tanggal+7>29) and (maind.bulan=02) and ((cekkabisat (maind))=True) Then
		begin
			a:= maind.tanggal+7-29; {jika tanggal hari ini lebih besar dari tanggal minggu depan}
			b:= maind.bulan+1; {jika bulan hari ini lebih kecil dari bulan minggu depan}
			if (a=mains.contents[i].tanggalmulaitayang) and (b=mains.contents[i].bulanmulaitayang) then
			begin
				writeln('>',mains.contents[i].namafilm);
			end;
		end else if (maind.tanggal+7>28) and (maind.bulan=02) and ((cekkabisat (maind))=False) Then
		begin
			a:= maind.tanggal+7-28; {jika tanggal hari ini lebih besar dari tanggal minggu depan}
			b:= maind.bulan+1; {jika bulan hari ini lebih kecil dari bulan minggu depan}
			if (a=mains.contents[i].tanggalmulaitayang) and (b=mains.contents[i].bulanmulaitayang) then
			begin
				writeln('>',mains.contents[i].namafilm);
			end;
		end else if (maind.tanggal+7=mains.contents[i].tanggalmulaitayang) then {jika tanggal hari ini lebih kecil dari tanggal minggu depan}
		begin
			writeln('>',mains.contents[i].namafilm);
		end else if (maind.tanggal+7>31) and (maind.bulan=12) and (maind.tahun<mains.contents[i].tahunmulaitayang)  then
		begin
			a:= maind.tanggal+7-31; {jika tanggal hari ini lebih besar dari tanggal minggu depan}
			b:= maind.bulan-11; {jika bulan hari ini lebih besar dari bulan minggu depan}
			if (a=mains.contents[i].tanggalmulaitayang) and (b=mains.contents[i].bulanmulaitayang) then
			begin
				writeln('>',mains.contents[i].namafilm);
			end;
		end;
	end;
end;
end.
