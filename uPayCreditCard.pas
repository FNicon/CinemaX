unit uPayCreditCard;

interface
uses uTransaction, uPriceX, uSnackX, uFilm, uSelect;

procedure payCreditCard (var t : Transaction; f : Film);

implementation


procedure payCreditCard (var t : Transaction; f : Film);

var
noPesan: longint;
noCredit : ansistring;
price, snay : longint;
i, r : integer;

begin
	      write('Masukkan nomor pemesanan : ');
          readln(noPesan);
if(t.contents[noPesan].namafilm <> '') and (t.contents[noPesan].jenispembayaran <> 'Member') and (t.contents[noPesan].jenispembayaran <> 'Sudah Dibayar') then
begin
        hari := datetohari(t.contents[noPesan].tanggaltayang,t.contents[noPesan].bulantayang,t.contents[noPesan].tahuntayang);
        if(hari = 'Sabtu') or (hari = 'Minggu') then
        begin
            for i:= 1 to f.size do
            begin
              if(f.contents[i].judul = t.contents[noPesan].namafilm) then
              begin
                seat := t.contents[noPesan].total div f.contents[i].pWeekend;
                pW1 := f.contents[i].pWeekdays;
                pW2 := f.contents[i].pWeekend;
              end;
            end;
        end
        else
        begin
          for i:= 1 to f.size do
            begin
              if(f.contents[i].judul = t.contents[noPesan].namafilm) then
              begin
                seat := t.contents[noPesan].total div f.contents[i].pWeekdays;
                pW1 := f.contents[i].pWeekdays;
                pW2 := f.contents[i].pWeekend;
              end;
            end;
        end;
        writeln(seat);
        writeln(hari);
        price := hargaCC(seat, hari, pW1, pW2);
        writeln(price);

        {BEGIN SNACK}
                writeln;
                writeln('Apakah Anda ingin membeli snack?');
                writeln;
                writeln(' [1] Ya, beli snack');
                writeln(' [2] Tidak, lanjutkan ke pembayaran');
                write('Masukkan pilihan : '); readln(r);
                while (not(r=1) and not(r=2)) do
                begin
                   writeln('Pilihan tidak valid!');
                   write('Masukkan pilihan : '); readln(r);
                end;
                if (r=1) then
                begin
                     snack (snay);
                     price := price + snay;
                end;

        {END SNACK}

                t.contents[noPesan].total := price;

          	  write('Total harga yang harus dibayar : Rp ', price, ',-');
          	  writeln;
              noCredit := '';
              while(length(noCredit) <> 15) do
              begin
             	   write('Masukkan nomor kartu kredit (15 digit) : ');
          	     readln(noCredit);
              end;
              t.contents[noPesan].jenispembayaran := 'Sudah Dibayar';

              writeln('Pembayaran berhasil!');
end
else if(t.contents[noPesan].namafilm = '') then
begin
    writeln('Nomor transaksi tidak ada :)');
end
else if(t.contents[noPesan].jenispembayaran = 'Member') or (t.contents[noPesan].jenispembayaran = 'Sudah Dibayar') then
begin
    writeln('Nomor transaksi ', noPesan, ' sudah dibayarkan');
end;
end;

end.
