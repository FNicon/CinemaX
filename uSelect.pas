unit uselect;
interface
	uses uLoader,uSnackX,uPriceX, uTransaction, uFilm, uCapacity, sysutils, uConfig;
	
	type
		recordJam = record
			jam : real;
			idx : integer;
	end;
	type
		arJam = record
			jam : array [1..10] of recordJam;
			size : integer;
	end;
	function datetohari (date,month,year:Integer):String;
	procedure tulis (nopesan:Integer);
	procedure selectMovie (var mainT:Transaction; var mainC:Capacity; mainF: Film);
	
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
			
	procedure selectMovie (var mainT:Transaction;var mainC:Capacity; mainF: Film);		{Data from Database_Capacity.txt, database_transaction.txt,database_film.txt}
	{I.S : Input database_Capacity,database_transaction,database_film terdefinisi.}
	{F.S : Output nomer pesan,harga yang dibayar}
	
	{KAMUS}
	var
		judul : string;
		i,idx, iC : longint;
		priceDay, priceEnd, price : longint;
		jam : real;
		d,m,y : integer;
		jlhkursi : longint;
		foundJudul : boolean;
		RecsJam : arJam;
		nopes : string;
	begin
		foundJudul := false;
		while(foundJudul = false) do
		begin
			write('Film : '); readln(judul);
			for i:=1 to mainF.size do
			begin
				if(judul = lowercase(mainF.contents[i].judul)) or (judul = mainF.contents[i].judul) or (judul = uppercase(mainF.contents[i].judul)) then
				begin
					foundJudul := true;
					priceDay := mainF.contents[i].pWeekdays;
					priceEnd := mainF.contents[i].pWeekend;
				end;
			end;
		end;

		write('Tanggal Tayang (d m y) : ');
		readln(d,m,y);
		idx := 1;
			for i:=1 to mainC.size do
			begin
				if (judul = mainC.contents[i].namafilm) and (d = mainC.contents[i].tanggal) and (m = mainC.contents[i].bulan) and (y = mainC.contents[i].tahun) then
				begin
					RecsJam.jam[idx].jam := mainC.contents[i].jam;
					RecsJam.jam[idx].idx := i;
					idx := idx + 1;
				end;
			end;
			RecsJam.size := idx - 1;

		if (datetohari(d,m,y) = 'Sabtu') or (datetohari(d,m,y) = 'Minggu') then
		begin
			price := priceEnd;
		end else
		begin
			price := priceDay;
		end;

		write('Jam tayang : ');readln(jam);
		for i:=1 to RecsJam.size do
		begin
			if(jam = RecsJam.jam[i].jam) then
			begin
				iC := RecsJam.jam[i].idx;
			end;
		end;

		jlhkursi := mainC.contents[iC].sisakursi + 1;
		if(mainC.contents[iC].sisakursi > 0) then
		begin
			writeln('Kapasitas tersisa : ', mainC.contents[iC].sisakursi);
			while(jlhkursi > mainC.contents[iC].sisakursi ) do
			begin
				write('Masukkan jumlah tiket yang ingin dibeli : '); readln(jlhkursi);
			end;
			str(mainT.size+1, nopes);
			if((mainT.size+1) < 100) and ((mainT.size+1) > 10) then
			begin
				nopes := '0' + nopes;
			end else if((mainT.size+1) < 10) then
			begin
				nopes := '00' + nopes;
			end;
 			writeln('Pemesanan sukses, nomor pemesanan anda adalah : ', nopes);
 			mainT.size := mainT.size + 1;
 			mainC.contents[iC].sisakursi := mainC.contents[iC].sisakursi - jlhkursi;
 			mainT.contents[mainT.size].nomorpesanan := mainT.size;
 			mainT.contents[mainT.size].namafilm := mainC.contents[iC].namafilm;
 			mainT.contents[mainT.size].tanggaltayang := mainC.contents[iC].tanggal;
 			mainT.contents[mainT.size].bulantayang := mainC.contents[iC].bulan;
 			mainT.contents[mainT.size].tahuntayang := mainC.contents[iC].tahun;
 			mainT.contents[mainT.size].jamtayang := mainC.contents[iC].jam;
 			mainT.contents[mainT.size].total := price * jlhkursi;
 			mainT.contents[mainT.size].jenispembayaran := 'Belum Dibayar';
		end
		else
		begin
			writeln('Woops, kursi sudah habis :)');
		end;
	end;
end.
