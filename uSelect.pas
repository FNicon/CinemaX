{problems : butuh type tanggal untuk input tanggal}
unit uselect;
interface
	uses uLoader,uSnackX,uPrice;
	
	procedure selectMovie (mainT:Transaction,mainC:Capacity,mainF: Film);
	procedure tulis (nopesan:Integer);
	
implementation
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
			
	procedure selectMovie (mainT:Transaction,mainC:Capacity,mainF: Film,mainS:Snack);		{Data from Database_Capacity.txt, database_transaction.txt,database_film.txt}
	{I.S : Data dari database_Capacity terdefinisi.}
	{F.S : Output nomer pesan,harga yang dibayar}
	
	{KAMUS}
	var
		i:Integer;				{counter}
		j:Integer				{counter}
		jdl: string;				{input judul}
		tgl: integer;				{input tanggal}
		bln: integer;				{input bulan}
		thn : integer;				{input tahun}
		jawaban:char				{input tanya snack}
		pilihan:string;				{input pilihan snack}
		jm:jam;					{input jam}
		bl:Integer;				{input jml beli}
		nmr:Integer;				{output Nomor pemesanan}
		harga:Integer				{output harga}
	begin
		for j:=1 to mainT.size do
		begin
			nmr:=mainT.contents[j].nomorpemesanan;
			mainT.contents[j].nomorpemesanan:=mainT.contents[j].nomorpemesanan+1;
		end;
		readln('> Film : ',jdl);
		readln('> Tanggal tayang (DD MM YYYY) : ',tgl, bln, thn);	{<<<< Gantiin dong Ray... T_T>>>>}
		readln('> Jam tayang: ',jm);
		for i:=1 to mainT.size do
		begin
			if (jdl=mainC.contents[i].judul) and (tgl=mainC.contents[i].tanggal) and (bln=mainC.contents[i].bulan) and (thn=mainC.contents[i].tahun) and (jm=mainC.contents[i].jam) then
			begin
				writeln('> Kapasitas tersisa: ',mainC.contents[i].sisakursi,' orang');
				repeat
				begin
					readln('> Masukkan jumlah tiket yang ingin dibeli: ',bl);
					if bl<=mainC.contents[i].sisakursi then
					begin
						nmr:=nmr+1;
						write('> Pemesanan sukses, nomor pemesanan Anda adalah: ');
						tulis(nmr);
						mainC.contents[i].sisakursi:=mainC.contents[i].sisakursi-bl;
						mainT.contents[i].nomorpemesanan:=nmr;
						harga:=mainF.contents[i].pWeekdays*bl;
						writeln('> Harga yang harus dibayar adalah Rp.',harga);
						writeln('> Apakah anda ingin membeli snack? (Y/N) ',jawaban);
						mainT.contents[i].total:=harga;
						snack();{
						if jawaban='Y' then
						begin
							writeln('> Soda		(Rp. 5000');
							writeln('> Pop Corn	(Rp. 3000');
							readln('> Pilihan Anda?',pilihan);
							while (pilihan<>'Soda') and (pilihan<>'Pop Corn') do
							begin
								if pilihan='Soda' then
								begin
									harga:=harga+5000;
								end
								else if pilihan:='Pop Corn' then
								begin
									harga:=harga+3000;
								end;
								readln('> Pilihan belum tepat! Pilihan? ',pilihan);
							end;
						end;}
						harga:=harga+mainS.harga;
						writeln('Total harga : Rp.',harga);
						mainT.contents[i].total:=harga;
						mainT.contents[i].jenisPembayaran:='Belum dibayar';
					end
					else
					begin
						writeln('> Pemesanan gagal');
					end;
				end;
				until mainT.contents[i].nomorpemesanan=nmr;
			end;
		end;
	end;
end.

{mainF.contents[i].judul}
