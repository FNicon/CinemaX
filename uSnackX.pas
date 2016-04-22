unit uSnackX;
interface

var
   hargasnack : longint;

procedure snack (var hargasnack : longint);

implementation

procedure snack (var hargasnack : longint);
var
pilihan, n1, n2, n3, n4, n5 : integer;

     begin

     hargasnack := 0; n1:=0; n2:=0; n3:=0; n4:=0; n5:=0;
     pilihan := 0;
     while (pilihan <> 6) do
     begin
     writeln;
     writeln ('> SNACK ');
     writeln ('> [1] Pop Corn           @ Rp 23.000,- ');
     writeln ('> [2] French Fries       @ Rp 20.000,- ');
     writeln ('> [3] Nachos             @ Rp 18.000,- ');
     writeln ('> [4] Orange Juice       @ Rp 15.000,- ');
     writeln ('> [5] Soda               @ Rp 10.000,- ');
     writeln ('> [6] Quit ');
     writeln;
     write ('> Pilih snack yang anda inginkan : ');
     readln (pilihan);

     case pilihan of

     1 : begin
            write ('> Masukkan jumlah Pop Corn yang anda inginkan : ');
            readln(n1);
            hargasnack := hargasnack + 23000*n1;
         end;
     2 : begin
            write ('> Masukkan jumlah French Fries yang anda inginkan : ');
            readln(n2);
            hargasnack := hargasnack + 20000*n2;
         end;
     3 : begin
            write ('> Masukkan jumlah Nachos yang anda inginkan : ');
            readln(n3);
            hargasnack := hargasnack + 18000*n3;
         end;
     4 : begin
            write ('> Masukkan jumlah Orange Juice yang anda inginkan : ');
            readln(n4);
            hargasnack := hargasnack + 15000*n4;
         end;
     5 : begin
            write ('> Masukkan jumlah Soda yang anda inginkan : ');
            readln(n5);
            hargasnack := hargasnack + 10000*n5;
         end;
     end;
     end;

     if (n1+n2+n3+n4+n5 > 0) then
        writeln('Harga snack : Rp ', hargasnack, ',-')
     else
        writeln('Anda tidak ada memesan snack');
     readln;






     end;




end.
