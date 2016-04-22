unit uPayMember;


interface
uses uTransaction, uMembership, uLoginMember, uPriceX, uSnackX;

procedure payMember (t : Transaction; m : Membership; log : login);

implementation

procedure payMember (t : Transaction; m : Membership; log : login);

var
   noPesan : longint;
   price, snax : longint;
   i, idxt, q : integer;

begin

  if (log.cond = true) then
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

      price := hargaCC (seat, hari, pW1, pW2);

      {BEGIN SNACK}
              writeln;
              writeln('> Apakah Anda ingin membeli snack?');
              writeln;
              writeln('> [1] Ya, beli snack');
              writeln('> [2] Tidak, lanjutkan ke pembayaran');
              write('> Masukkan pilihan : '); readln(q);
              while (not(q=1) and not(q=2)) do
              begin
                 writeln('> Pilihan tidak valid!');
                 write('> Masukkan pilihan : '); readln(q);
              end;
              if (q=1) then
              begin
                   snack (snax);
                   price := price + snax;
              end;

      {END SNACK}

      t.contents[idxt].total := price;

	  write('> Total harga yang harus dibayar : Rp ', price, ',-');
	  writeln;

      if (m.contents[log.idx].saldo >= price) then
      begin
           writeln('> Pembayaran berhasil!');
           m.contents[log.idx].saldo := m.contents[log.idx].saldo - price;
           t.contents[idxt].jenispembayaran := 'Member';
           writeln;
           writeln('> Anda mendapatkan cashback 10% sebesar ', price*0.1);
           m.contents[log.idx].saldo := m.contents[log.idx].saldo + price * 0.1;
           readln;


      end else
      begin
           writeln('> Saldo anda tidak mencukupi. Silahkan pilih cara pembayaran yang lain.');
           readln;
      end;


  end else

    begin
        writeln('Maaf, anda belum login. Silahkan login terlebih dahulu.');
    end;

end;

end.

