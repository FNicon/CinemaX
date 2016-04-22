unit uLoginMember;
interface
         uses uMembership;
    type
    login = record
      mem : Membership;
      idx : integer;
      cond : boolean;
    end;


procedure loginMember (m : Membership; var l : login);

implementation

procedure loginMember (m : Membership; var l : login);

    var
           i, yn : integer;
           us, pa : string; {username, password}

begin

   l.cond := false;
   yn := 1;

while (yn = 1) do
begin
     writeln;
     write('> Masukkan username : ');readln(us);
     write('> Masukkan password : ');readln(pa);

   for i:=1 to m.size do
   begin
       if(m.contents[i].username = us) then
       begin
            if(m.contents[i].password = pa) then
            begin
                 l.idx := i;
                 l.cond := true;
            end;
       end;
   end;

   if (l.cond = true) then
   begin
        writeln;
        writeln('> Login berhasil!');
   end else
   begin
       writeln;
       writeln('> Username atau password salah!');
       writeln;
       writeln('> [1] Coba kembali login');
       writeln('> [2] Kembali ke menu utama');
       write('> Masukkan pilihan : '); readln(yn);
            while (not(yn=1) and not(yn=2)) do
            begin
                 writeln('> Pilihan tidak valid!');
                 write('> Masukkan pilihan : '); readln(yn);
            end;
   end;
end;


end;

end.
