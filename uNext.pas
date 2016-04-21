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
	uses uLoader;
	type tgl = record
		d:Integer;									{tanggal}
		m:Integer;									{bulan}
		y:Integer;									{tahun}
	end;
	procedure showNextDay (mainD:Schedule);
	{I.S : Input tanggal}
	{F.S : Menampilkan semua film pada esok hari}
	
implementation
begin
	procedure showNextDay (mainD:Schedule);			{Data from database_schdl.txt}
	{KAMUS}
	var
		tanggal	: tgl;								{tanggal untuk input tanggal}
		i		: Integer;							{i counter}
		cek		: string;							{simpan sementara data untuk cek}
	begin
	cek:='';
	readln(tanggal.d, tanggal.m, tanggal.y);
	tanggal.d:=tanggal.d+1;					{NxtD:=D.h+1;}
		for i:=1 to mainD.size do
		begin
			if (mainD.contents[i].bulanmulaitayang=tanggal.m) and (mainD.contents[i].tahunmulaitayang=tanggal.y) and (tanggal.d>mainD.contents[i].tanggalmulaitayang) then
			begin
				if mainD.contents[i].namafilm<>cek then
				begin
					writeln(mainD.contents[i].namafilm);
					cek:=mainD.contens[i].namafilm;
				end;
			end;
		end;
	end;
end.

{mainF.contents[i].judul}