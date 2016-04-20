unit uParser; //Service

interface
    uses uConfig;

    type
        arString = array[1..ARRAY_LIMIT] of string;

    function stringToArray(s:ansistring):arString;

    function arrayToString(ar:arString;sz:integer):ansistring;



implementation
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


end.
