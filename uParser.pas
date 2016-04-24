unit uParser; //Service

interface
    uses uConfig, uAlgorithm, uFilm;

    type
        arString = array[1..ARRAY_LIMIT] of string;

    function stringToArray(s:ansistring):arString;

    function arrayToString(ar:arString;sz:integer):ansistring;

    function stringMatching(text, pattern:string):boolean;

    function getSimilarSynopsis(command:string; mainFilm : Film):arString;

    function getSimilarJudul(command:string; mainFilm : Film):arString;

    function getSimilarGenre(command:string; mainFilm : Film):arString;

    procedure cekJudul(command:string; mainFilm : Film);

    procedure cekGenre(command:string; mainFilm : Film);

    procedure cekSynopsis(command:string; mainFilm : Film);

implementation
    function getSimilarSynopsis(command:string; mainFilm : Film):arString;
    {getSimilarCommand adalah fungsi untuk mencari suatu string di command list yang mirip dengan input user}
    var
        i,size:longint;
    begin
        size:=0;
        for i:=1 to MainFilm.size do
        begin
            if (editDistance(command,mainFilm.contents[i].sinopsis) <= 2) then
            begin
                size := size + 1;
                getSimilarSynopsis[size] := mainFilm.contents[i].judul;
            end;
        end;
        getSimilarSynopsis[size+1] := '#';
    end;

    function getSimilarJudul(command:string; mainFilm : Film):arString;
    {getSimilarCommand adalah fungsi untuk mencari suatu string di command list yang mirip dengan input user}
    var
        i,size:longint;
    begin
        size:=0;
        for i:=1 to MainFilm.size do
        begin
            if (editDistance(command,mainFilm.contents[i].judul) <= 2) then
            begin
                size := size + 1;
                getSimilarJudul[size] := mainFilm.contents[i].judul;
            end;
        end;
        getSimilarJudul[size+1] := '#';
    end;

    function getSimilarGenre(command:string; mainFilm : Film):arString;
    {getSimilarCommand adalah fungsi untuk mencari suatu string di command list yang mirip dengan input user}
    var
        i,size:longint;
    begin
        size:=0;
        for i:=1 to MainFilm.size do
        begin
            if (editDistance(command,mainFilm.contents[i].genre) <= 2) then
            begin
                size := size + 1;
                getSimilarGenre[size] := mainFilm.contents[i].judul;
            end;
        end;
        getSimilarGenre[size+1] := '#';
    end;


    procedure cekJudul(command:string; mainFilm : Film);
    {validCommand adalah fungsi untuk memeriksa apakah command dari user valid}
    var 
        i : integer;
        found : boolean;
        similarCommand : arString;
    begin
        found := false;
        for i:=1 to MainFilm.size do
        begin
            if (MainFilm.contents[i].judul = command) then
                found := true;
        end;
        if (not found) then
        begin
            writeln('Sorry, command not found');
            similarCommand := getSimilarJudul(command, mainFilm);
            if (similarCommand[1] = '#') then
            begin
                writeln('Cannot found the suitable title');
            end
            else
            begin
                writeln('Similar title based on your keyword:');
                i:=1;
                while (similarCommand[i] <> '#') do
                begin
                    writeln('- ',similarCommand[i]);
                    i:=i+1;
                end;
            end;
        end;
    end;

    procedure cekGenre(command:string; mainFilm : Film);
    {validCommand adalah fungsi untuk memeriksa apakah command dari user valid}
    var 
        i : integer;
        found : boolean;
        similarCommand : arString;
    begin
        found := false;
        for i:=1 to MainFilm.size do
        begin
            if (MainFilm.contents[i].genre = command) then
                found := true;
        end;
        if (not found) then
        begin
            writeln('Sorry, command not found');
            similarCommand := getSimilarGenre(command, mainFilm);
            if (similarCommand[1] = '#') then
            begin
                writeln('Cannot found the suitable title');
            end
            else
            begin
                writeln('Similar title based on your keyword:');
                i:=1;
                while (similarCommand[i] <> '#') do
                begin
                    writeln('- ',similarCommand[i]);
                    i:=i+1;
                end;
            end;
        end;
    end;

    procedure cekSynopsis(command:string; mainFilm : Film);
    {validCommand adalah fungsi untuk memeriksa apakah command dari user valid}
    var 
        i : integer;
        found : boolean;
        similarCommand : arString;
    begin
        found := false;
        for i:=1 to MainFilm.size do
        begin
            if (MainFilm.contents[i].sinopsis = command) then
                found := true;
        end;
        if (not found) then
        begin
            writeln('Sorry, command not found');
            similarCommand := getSimilarSynopsis(command, mainFilm);
            if (similarCommand[1] = '#') then
            begin
                writeln('Cannot found the suitable title');
            end
            else
            begin
                writeln('Similar title based on your keyword:');
                i:=1;
                while (similarCommand[i] <> '#') do
                begin
                    writeln('- ',similarCommand[i]);
                    i:=i+1;
                end;
            end;
        end;
    end;


    function stringToArray(s:ansistring):arString;
    {stringToArray akan mengubah suatu string dengan format pada database menjadi array yang berisi string yang merupakan isi dari data tersebut}
    var
        i, posAkhir, indexArray:longint;
        returnArray : arString;
    begin
        indexArray := 1;
        posAkhir := 1;
        for i:=1 to length(s) do
        begin
            if (s[i] = '|') then
            begin
                returnArray[indexArray] := copy(s, posAkhir, i-posAkhir-1);
                posAkhir := i+2;
                indexArray := indexArray +1;
            end;
        end ;
        returnArray[indexArray] := copy(s, posAkhir, length(s)-posAkhir+1);
        stringToArray := returnArray;
    end;

    function arrayToString(ar:arString;sz:integer):ansistring;
    {arrayToString akan mengubah suatu array of string menjadi satu string untuk ditulis di database}
    var
        i:integer;
        returnString:ansistring;
    begin
        returnString:='';
        for i:=1 to sz-1 do
        begin
            returnString:=returnString+ar[i]+' | ';
        end;
        returnString:=returnString+ar[sz];
        arrayToString:=returnString;
    end;

    function stringMatching(text, pattern:string):boolean;
    var
        i, j, n, m, t : longint;
        P : array of integer;
        found : boolean;
    begin
        n:= length(text);
        m:= length(pattern);
        SetLength(P, m+5);
        P[0]:=0; P[1]:=0; t:=0;
        for j:=2 to m do
        begin
            while (t>0) and (pattern[t+1]<>pattern[j]) do t:=P[t];
            if pattern[t+1]=pattern[j] then t:=t+1;
            P[j]:=t;
        end;
        i:=1; j:=0; found:=False;
        while (i<=n-m+1) and (not found) do
        begin
            j:=P[j];
            while ((j<m)and(pattern[j+1]=text[i+j])) do j:=j+1;
            if j=m then found:=True;
            i:=i+max(1,j-P[j]);
        end;
        stringMatching := found;
    end;
end.
