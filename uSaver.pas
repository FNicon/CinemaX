unit uSaver;

interface
    uses uConfig, uMembership, uParser, uFilm, uTransaction, uScheduleFilm, uCapacity;

    procedure saveMembership(
        newMember:Membership;
        filename:string
    );

    procedure saveFilm(
        newFilm:Film;
        filename:string
    );

    procedure saveTransaction(
        newTransaction:Transaction;
        filename:string
    );

    procedure saveSchedule(
        newSchedule:Schedule;
        filename:string
    );

    procedure saveCapacity(
        newCapacity:Capacity;
        filename:string
    );

implementation
var
    selectedDatabase : textfile;
    t : arstring;

    procedure saveMembership(newMember:Membership;filename:string);
    var
        i:longint;
        newSaldo:double;
    begin
        newSaldo := 100000;
        write('Saving Member...');
        assign(selectedDatabase,filename);
        rewrite(selectedDatabase);
        for i:=1 to newMember.size do
        begin
            t[1]:=newMember.contents[i].username;
            t[2]:=newMember.contents[i].password;
            str(newSaldo:0:2,t[3]);
            writeln(selectedDatabase,arrayToString(t,3));
        end;
        close(selectedDatabase);
        writeln('OK');
    end;

    procedure saveFilm(newFilm:Film;filename:string);
    var
        i:longint;
    begin
        write('Saving Film...');
        assign(selectedDatabase,filename);
        rewrite(selectedDatabase);
        for i:=1 to newFilm.size do
        begin
            t[1]:=newFilm.contents[i].judul;
            t[2]:=newFilm.contents[i].genre;
            t[3]:=newFilm.contents[i].viewer;
            t[4]:=newFilm.contents[i].durasi;
            t[5]:=newFilm.contents[i].sinopsis;
            str(newFilm.contents[i].pWeekdays, t[6]);
            str(newFilm.contents[i].pWeekend, t[7]);
            writeln(selectedDatabase,arrayToString(t,7));
        end;
        close(selectedDatabase);
        writeln('OK');
    end;

    procedure saveTransaction(newTransaction:Transaction;filename:string);
    var
        i:longint;
    begin
        write('Saving Transaction...');
        assign(selectedDatabase,filename);
        rewrite(selectedDatabase);
        for i:=1 to newTransaction.size do
        begin
            str(newTransaction.contents[i].nomorpesanan, t[1]);
            if(newTransaction.contents[i].nomorpesanan < 100) and (newTransaction.contents[i].nomorpesanan > 10) then
            begin
                t[1] := '0' + t[1];
            end;
            if(newTransaction.contents[i].nomorpesanan < 10) then
            begin
                t[1] := '00' + t[1];
            end;

            t[2]:=newTransaction.contents[i].namafilm;
            str(newTransaction.contents[i].tanggaltayang, t[3]);
            str(newTransaction.contents[i].bulantayang, t[4]);
            str(newTransaction.contents[i].tahuntayang, t[5]);
            str(newTransaction.contents[i].jamtayang:0:2, t[6]);
            str(newTransaction.contents[i].total, t[7]);
            t[8]:=newTransaction.contents[i].jenispembayaran;
            writeln(selectedDatabase,arrayToString(t,8));
        end;
        close(selectedDatabase);
        writeln('OK');
    end;

    procedure saveSchedule(newSchedule:Schedule;filename:string);
    var
        i:longint;
    begin
        write('Saving Schedule...');
        assign(selectedDatabase,filename);
        rewrite(selectedDatabase);
        for i:=1 to newSchedule.size do
        begin
            t[1]:= newSchedule.contents[i].namafilm;
            str(newSchedule.contents[i].jamtayang:0:2, t[2]);
            str(newSchedule.contents[i].tanggalmulaitayang, t[3]);
            if(newSchedule.contents[i].tanggalmulaitayang < 10) then
            begin
                t[3] := '0' + t[3];
            end;
            str(newSchedule.contents[i].bulanmulaitayang, t[4]);
            if(newSchedule.contents[i].bulanmulaitayang < 10) then
            begin
                t[3] := '0' + t[4];
            end;
            str(newSchedule.contents[i].tahunmulaitayang, t[5]);
            str(newSchedule.contents[i].lamaharitayang, t[6]);
            writeln(selectedDatabase,arrayToString(t,6));
        end;
        close(selectedDatabase);
        writeln('OK');
    end;

    procedure saveCapacity(newCapacity:Capacity;filename:string);
    var
        i:longint;
    begin
        write('Saving Capacity...');
        assign(selectedDatabase,filename);
        rewrite(selectedDatabase);
        for i:=1 to newCapacity.size do
        begin
            t[1]:= newCapacity.contents[i].namafilm;
            str(newCapacity.contents[i].tanggal, t[2]);
            if(newCapacity.contents[i].tanggal < 10) then
            begin
                t[2] := '0' + t[2];
            end;
            str(newCapacity.contents[i].bulan, t[3]);
            if(newCapacity.contents[i].bulan < 10) then
            begin
                t[3] := '0' + t[3];
            end;
            str(newCapacity.contents[i].tahun, t[4]);
            str(newCapacity.contents[i].jam:0:2, t[5]);
            str(newCapacity.contents[i].sisakursi, t[6]);
            writeln(selectedDatabase,arrayToString(t,6));
        end;
        close(selectedDatabase);
        writeln('OK');
    end;

end.