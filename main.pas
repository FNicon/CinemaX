Program main;

uses uConfig, uSaver, crt, uMembership, uFilm, uLoader, uParser, uNowPlaying, uUpComing, uDateData, uTransaction, uCapacity, uShow, uNext, uScheduleFilm;

type u = record
          nama : array [1..50] of string;
          size : integer;
     end;

type p = record
          saldo : array [1..50] of longint;
          size : integer;
     end;


var
    m : Membership;
    mainMembership : Membership;
    mainFilm : Film;
    mainSchedule : Schedule;
    mainDate : DateData;
    mainTransaction : Transaction;
    mainCapacity : Capacity;
    namas : u;
    saldo : p;
    sizes : integer;
    ic : integer;
    command : string;


procedure loadAll() forward; {F1}
procedure showMembership(var content : u) forward;
procedure saveAll() forward;
procedure prompt() forward;
procedure greeting() forward;
procedure help() forward;

procedure loadAll();
begin
    mainMembership := loadMembership(DATABASE_MEMBER_FILENAME);
    mainFilm := loadFilm(DATABASE_FILM_FILENAME);
    mainSchedule := loadSchedule(DATABASE_SCHEDULE_FILENAME);
    mainDate := loadDate (DATABASE_DATE_FILENAME);
    mainTransaction := loadTransaction (DATABASE_TRANSACTION_FILENAME);
    mainCapacity := loadCapacity (DATABASE_CAPACITY_FILENAME);
end;

procedure saveAll();
begin
    saveMembership(mainMembership,DATABASE_MEMBER_FILENAME);
    saveFilm(mainFilm,DATABASE_FILM_FILENAME);
    saveSchedule(mainSchedule,DATABASE_SCHEDULE_FILENAME);
    saveTransaction(mainTransaction,DATABASE_TRANSACTION_FILENAME);
    saveCapacity(mainCapacity,DATABASE_CAPACITY_FILENAME);
end;

procedure showMembership(var content : u);
var
    i : integer;
begin
    for i:= 1 to mainMembership.size do
    begin
        content.nama[i] := mainMembership.contents[i].username;
    end;
    content.size := i;
end;


procedure showFilm(var content : p);
var
    i : integer;
begin
    for i:= 1 to mainFilm.size do
    begin
        content.saldo[i] := mainFilm.contents[i].pWeekend;
    end;
    content.size := i;
end;

procedure prompt();
begin
    write('> ');
end;

procedure help();
var
    i:longint;
begin
    writeln('Command Available:');
    for i:=1 to COMMAND_NUMBER do
        writeln('- ', COMMAND_LIST[i]);
end;

procedure greeting();
begin
    writeln('                  _             _                         ');
    writeln('                 (_)           (_)                        ');
    writeln(' ____   ___ _   _ _ _____  ____ _ ____  _____ ____  _____ ');
    writeln('|    \ / _ \ | | | | ___ |/ ___) |  _ \| ___ |    \(____ |');
    writeln('| | | | |_| \ V /| | ____( (___| | | | | ____| | | / ___ |');
    writeln('|_|_|_|\___/ \_/ |_|_____)\____)_|_| |_|_____)_|_|_\_____|');
    writeln('                       version 0.0.1                      ');
    delay(5000);
    clrscr;
end;

function validCommand(inputcommand : string) : boolean;
var
    i : integer;
    found : boolean;
begin
    found := false;
    for i:= 1 to COMMAND_NUMBER do
    begin
        if(COMMAND_LIST[i] = inputcommand) then
        begin
            found := true;
        end;
    end;
    if (not found) then
    begin
        writeln('Sorry, command not found!');
        writeln('type help for see list of command');
    end;
    validCommand := found;
end;

procedure actioncommand(coms : string);
begin
    if(coms = 'nowPlaying') then nowPlaying(mainFilm)
    else if(coms = 'help') then help()
    else if(coms = 'showMovie') then showMovie(mainFilm)
    else if(coms = 'showNextDay') then showNextDay(mainSchedule, mainDate);
end;


begin
    greeting();
    loadAll();
    repeat
        repeat
            prompt();
            readln(command);
        until (validCommand(command));
    actioncommand(command);
    until (command = 'exit'); {//F17}
    saveAll();
end.
