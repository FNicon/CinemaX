unit uLoader;

interface
     uses uMembership, uMembershipData, uFilm, uFilmData, uScheduleFilm, uScheduleData, uCapacity, uCapacityData, uTransaction, uTransactionData, uDateData, uConfig, uParser;

     function loadMembership(filename:string):Membership;
     function loadFilm(filename:string):Film;
     function loadSchedule(filename:string):Schedule;
     function loadCapacity(filename:string):Capacity;
     function loadTransaction(filename:string):Transaction;
     function loadDate(filename:string):DateData;

implementation
var
     selectedDatabase : textfile;
     size : longint;
     line : ansistring;
     t : arString;

    function loadMembership(filename:string):Membership;
    var
        returnObject : Membership;
        i : array[0..50] of longint;

    begin
        write('Loading Membership Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
        size := 0;
        while not eof(selectedDatabase) do
        begin
            readln(selectedDatabase,line);
            t := stringToArray(line);
            size := size + 1;
            val(t[3], i[1]); {Mengubah data saldo string menjadi integer}
            returnObject.contents[size] := MembershipDataCons(t[1], t[2], i[1]);
        end;
        returnObject.size := size;
        loadMembership := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;

    function loadFilm(filename:string):Film;
    var
        returnObject : Film;
        i : array[0..50] of longint;

    begin
        write('Loading Film Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
        size := 0;
        while not eof(selectedDatabase) do
        begin
            readln(selectedDatabase,line);
            t := stringToArray(line);
            size := size + 1;
            val(t[6], i[1]); {Mengubah data harga weekdays string menjadi integer}
            val(t[7], i[2]); {Mengubah data harga weekend string menjadi integer}
            returnObject.contents[size] := FilmDataCons(t[1], t[2], t[3], t[4], t[5], i[1], i[2]);
        end;
        returnObject.size := size;
        loadFilm := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;
	function loadSchedule(filename:string):Schedule;
	var
        returnObject : Schedule;
        i : array[0..50] of longint;
        r : array[0..50] of real;

    begin
        write('Loading Schedule Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
        size := 0;
        while not eof(selectedDatabase) do
        begin
            readln(selectedDatabase,line);
            t := stringToArray(line);
            size := size + 1;
            val(t[2], r[1]); {Mengubah data jam string menjadi real}
            val(t[3], i[1]); {Mengubah data tanggal tayang string menjadi integer}
            val(t[4], i[2]); {Mengubah data bulan tayang string menjadi integer}
            val(t[5], i[3]); {Mengubah data tahun tayang string menjadi integer}
            val(t[6], i[4]); {Mengubah data lama tayang string menjadi integer}
            returnObject.contents[size] := ScheduleDataCons(t[1], r[1], i[1], i[2], i[3], i[4]);
        end;
        returnObject.size := size;
        loadSchedule := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;
    function loadCapacity(filename:string):Capacity;
    var
        returnObject : Capacity;
        i : array[0..50] of longint;
        r : array [0..50] of real ;

    begin
        write('Loading Capacity Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
        size := 0;
        while not eof(selectedDatabase) do
        begin
            readln(selectedDatabase,line);
            t := stringToArray(line);
            size := size + 1;
            val(t[2], i[1]); {Mengubah data tanggal string menjadi integer}
            val(t[3], i[2]); {Mengubah data bulan string menjadi integer}
            val(t[4], i[3]); {Mengubah data tahun string menjadi integer}
            val(t[5], r[1]); {Mengubah data jam string menjadi real}
            val(t[6], i[4]); {Mengubah data sisakursi string menjadi integer}
            returnObject.contents[size] := CapacityDataCons(t[1], i[1], i[2], i[3], r[1], i[4]);
        end;
        returnObject.size := size;
        loadCapacity := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;
    function loadTransaction(filename:string):Transaction;
    var
        returnObject : Transaction;
        i : array[0..50] of longint;
        r : array [0..50] of real;

    begin
        write('Loading Transaction Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
        size := 0;
        while not eof(selectedDatabase) do
        begin
            readln(selectedDatabase,line);
            t := stringToArray(line);
            size := size + 1;
            val(t[1], i[1]); {Mengubah data nomor pesanan string menjadi integer}
            val(t[3], i[2]); {Mengubah data tanggal tayang string menjadi integer}
            val(t[4], i[3]); {Mengubah data bulan tayang string menjadi integer}
            val(t[5], i[4]); {Mengubah data tahun tayang string menjadi integer}
            val(t[6], r[1]); {Mengubah data jam tayang string menjadi real}
            val(t[7], i[5]); {Mengubah data total string menjadi integer}
            returnObject.contents[size] := TransactionDataCons(i[1], t[2], i[2], i[3], i[4], r[1], i[5], t[8]);
        end;
        returnObject.size := size;
        loadTransaction := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;
    function loadDate(filename:string):DateData;
    var
        returnObject : DateData;
        i : array[0..50] of longint;

    begin
        write('Loading Date Data...');
        assign(selectedDatabase,filename);
        reset(selectedDatabase);
            readln(selectedDatabase,line);
            t := stringToArray(line);
            val(t[1], i[1]); {Mengubah data tanggal string menjadi integer}
            val(t[2], i[2]); {Mengubah data bulan string menjadi integer}
            val(t[3], i[3]); {Mengubah data tahun string menjadi integer}
            returnObject := DateDataCons(i[1], i[2], i[3], t[4]);
        loadDate := returnObject;
        close(selectedDatabase);
        writeln('OK');
    end;
end.
