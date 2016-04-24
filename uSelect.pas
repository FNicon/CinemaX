unit uselect;
interface
	uses uLoader,uSnackX,uPriceX, uTransaction, uFilm, uCapacity;
	
	function datetohari (date,month,year:Integer):String;
	procedure tulis (nopesan:Integer);
	procedure selectMovie (mainT:Transaction; mainC:Capacity; mainF: Film);
	
implementation
	function datetohari (date,month,year:Integer):String;
	{I.S : tanggal, bulan, tahun terdefinisi}
	{F.S : Output hari}
	{Prekondisi : Asumsi 01/01/2016 hari jumat, input jumlah hari dan bulan selalu benar dan hanya bisa input tahun 2016}
	
	{Kamus}
	begin
		case (date mod 7) of
			0 : case month of
				1,4,7 	: datetohari:='Kamis';
				2,8 	: datetohari:='Minggu';
				3,11	: datetohari:='Senin';
				5	: datetohari:='Sabtu';
				6	: datetohari:='Selasa';
				9,12	: datetohari:='Rabu';
				10	: datetohari:='Jumat';
				end;
			1 : case month of
				1,4,7 	: datetohari:='Jumat';
				2,8 	: datetohari:='Senin';
				3,11	: datetohari:='Selasa';
				5	: datetohari:='Minggu';
				6	: datetohari:='Rabu';
				9,12	: datetohari:='Kamis';
				10	: datetohari:='Sabtu';
			end;
			2 : case month of
				1,4,7 	: datetohari:='Sabtu';
				2,8 	: datetohari:='Selasa';
				3,11	: datetohari:='Rabu';
				5	: datetohari:='Senin';
				6	: datetohari:='Kamis';
				9,12	: datetohari:='Jumat';
				10	: datetohari:='Minggu';
			end;
			3 : case month of
				1,4,7 	: datetohari:='Minggu';
				10	: datetohari:='Senin';
				5	: datetohari:='Selasa';
				2,8 	: datetohari:='Rabu';
				3,11	: datetohari:='Kamis';
				6	: datetohari:='Jumat';
				9,12	: datetohari:='Sabtu';
			end;
			4 : case month of
				1,4,7 	: datetohari:='Senin';
				10	: datetohari:='Selasa';
				5	: datetohari:='Rabu';
				2,8 	: datetohari:='Kamis';
				3,11	: datetohari:='Jumat';
				6	: datetohari:='Sabtu';
				9,12	: datetohari:='Minggu';
			end;
			5 : case month of
				1,4,7 	: datetohari:='Selasa';
				10	: datetohari:='Rabu';
				5	: datetohari:='Kamis';
				2,8 	: datetohari:='Jumat';
				3,11	: datetohari:='Sabtu';
				6	: datetohari:='Minggu';
				9,12	: datetohari:='Senin';
			end;
			6 : case month of
				1,4,7 	: datetohari:='Rabu';
				10	: datetohari:='Kamis';
				5	: datetohari:='Jumat';
				2,8 	: datetohari:='Sabtu';
				3,11	: datetohari:='Minggu';
				6	: datetohari:='Senin';
				9,12	: datetohari:='Selasa';
			end;
		end;
	end;
	
	procedure tulis (nopesan:Integer);
	{I.S : no pesan terdefinisi}
	{F.S : Output tulis nomor pesan}
	
	{KAMUS}
	begin
		if nopesan<10 then
		begin
			writeln('00',nopesan);
		end
		else if nopesan<100 then
		begin
			writeln('0',nopesan);
		end
		else if nopesan<1000 then
		begin
			writeln(nopesan);
		end;
	end;
			
	procedure selectMovie (mainT:Transaction;mainC:Capacity;mainF: Film);		{Data from Database_Capacity.txt, database_transaction.txt,database_film.txt}
	{I.S : Input database_Capacity,database_transaction,database_film terdefinisi.}
	{F.S : Output nomer pesan,harga yang dibayar}
	
	{KAMUS}
	var
		i:Integer;				{counter}
		jdl: string;				{input judul}
		tgl: integer;				{input tanggal}
		bln: integer;				{input bulan}
		thn : integer;				{input tahun}
		hari:String;				{var hari}
		jm:Real;					{input jam}
		jawaban:char;				{input tanya snack}
		bl:Integer;				{input jml beli}
		nmr:Integer;				{output Nomor pemesanan}
		bayar:Integer;				{output bayar}
		harga1,harga2:Integer;			{var harga tiket}
		hargaS:LongInt;				{var harga Snack}
		kapasitas:Integer;			{var jml kursi}
		idx:Integer;				{tampung data index}
	begin
		harga1:=0;
		harga2:=0;
		nmr:=mainT.size;
		write('Film : ');readln(jdl);
		write('Tanggal tayang (DD MM YYYY) : ');readln(tgl, bln, thn);
		write('Jam tayang : '); readln(jm);
		hari:=datetohari(tgl,bln,thn);				{olah hari}
		for i:=1 to mainC.size do					{cari data film}
		begin
			if (jdl=mainC.contents[i].namafilm) and (tgl=mainC.contents[i].tanggal) and (bln=mainC.contents[i].bulan) and (thn=mainC.contents[i].tahun) and (jm=mainC.contents[i].jam) then
			begin
				writeln('Kapasitas tersisa : ',mainC.contents[i].sisakursi,' orang');
				kapasitas:=mainC.contents[i].sisakursi;
				idx:=i;
			end;
		end;
		repeat
		begin
			write('Masukkan jumlah tiket yang ingin dibeli: ');readln(bl);
			if bl<=mainC.contents[idx].sisakursi then
			begin
				nmr:=nmr+1;
				write('Pemesanan sukses, nomor pemesanan Anda adalah: ');
				tulis(nmr);					{tulis nomor pesan}
				bayar:=hargaM(bl,hari,harga1,harga2);		{olah harga bayar}
				mainC.contents[idx].sisakursi:=mainC.contents[i].sisakursi-bl;

				mainT.contents[nmr].nomorpesanan := nmr;
				mainT.contents[nmr].total:=bayar;
				mainT.contents[nmr].jenispembayaran:='Belum dibayar';
				mainT.size := nmr;
				writeln('Harga yang harus dibayar adalah Rp.',bayar);
				writeln('Apakah anda ingin membeli snack? (Y/N) ');readln(jawaban);
				if jawaban='Y' then
				begin
					snack(hargaS);
				end
				else
				begin
					writeln('Anda tidak memesan Snack');
				end;
				bayar:=bayar+hargaS;
				writeln('Total bayar : Rp.',bayar);
				mainT.contents[idx].total:=bayar;
			end
			else
			begin
				writeln('Pemesanan gagal');
			end;
		end;
		until bl<=mainC.contents[idx].sisakursi;
	end;
end.
