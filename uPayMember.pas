unit uPayMember;


interface
uses uTransaction, uFilm, uMembership, uLoginMember, uPriceX, uSnackX;

procedure payMember (var t : Transaction; var m : Membership; var log : login);

implementation

procedure payMember (var t : Transaction; var m : Membership; var log : login);

var
   noPesan : longint;
   price, snax : longint;
   i, q : integer;
   cx : boolean;
   pw1, pw2 : longint;
   seat : integer;
   hari : string;

begin
cx := true;
while(cx) do
begin
  if (log.cond = true) then
  begin
          write('Masukkan nomor pemesanan : ');
          readln(noPesan);
          price := t.contents[noPesan].total;

      {BEGIN SNACK}
              writeln;
              writeln('Apakah Anda ingin membeli snack?');
              writeln;
              writeln(' [1] Ya, beli snack');
              writeln(' [2] Tidak, lanjutkan ke pembayaran');
              write('Masukkan pilihan : '); readln(q);
              while (not(q=1) and not(q=2)) do
              begin
                 writeln('Pilihan tidak valid!');
                 write('Masukkan pilihan : '); readln(q);
              end;
              if (q=1) then
              begin
                   snack (snax);
                   price := price + snax;
              end;

      {END SNACK}

	  write('Total harga yang harus dibayar : Rp ', price, ',-');

      if (m.contents[log.idx].saldo >= price) then
      begin
           writeln('Pembayaran berhasil!');
           t.contents[noPesan].total := price;
           m.contents[log.idx].saldo := m.contents[log.idx].saldo - price;
           t.contents[noPesan].jenispembayaran := 'Member';
           writeln;
           writeln('Anda mendapatkan cashback 10% sebesar ', price div 10);
           m.contents[log.idx].saldo := m.contents[log.idx].saldo + price div 10;
           cx := false;

      end else
      begin
           writeln('Saldo anda tidak mencukupi. Silahkan pilih cara pembayaran yang lain.');
           readln;
           cx := false;
      end;


  end else

    begin
        writeln('Maaf, anda belum login. Silahkan login terlebih dahulu.');
        loginMember(m, log);
    end;

end;
end;

end.

