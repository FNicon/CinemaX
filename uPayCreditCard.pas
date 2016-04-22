unit uPayCreditCard;

interface
uses uTransaction, uPriceX, uSnackX;

procedure payCreditCard (t : Transaction);

implementation


procedure payCreditCard (t : Transaction);

var
noPesan, noCredit : longint;
price, snay : longint;
i, idxt, r : integer;

begin
	      write('> Masukkan nomor pemesanan : ');
          readln(noPesan);
               for i:=1 to t.size do
                 begin
                   if(t.contents[i].nomorpesanan = noPesan)then
                   begin
                        idxt := i;
                   end;
                 end;

      price := hargaM (seat, hari, pW1, pW2);

      {BEGIN SNACK}
              writeln;
              writeln('> Apakah Anda ingin membeli snack?');
              writeln;
              writeln('> [1] Ya, beli snack');
              writeln('> [2] Tidak, lanjutkan ke pembayaran');
              write('> Masukkan pilihan : '); readln(r);
              while (not(r=1) and not(r=2)) do
              begin
                 writeln('> Pilihan tidak valid!');
                 write('> Masukkan pilihan : '); readln(r);
              end;
              if (r=1) then
              begin
                   snack (snay);
                   price := price + snay;
              end;

      {END SNACK}

      t.contents[idxt].total := price;

	  write('> Total harga yang harus dibayar : Rp ', price, ',-');
	  writeln;

   	write('> Masukkan nomor kartu kredit (15 digit) : ');
	readln(noCredit);

    t.contents[idxt].jenispembayaran := 'Sudah Dibayar';

    writeln('> Pembayaran berhasil!');
    readln;
end;







end.
