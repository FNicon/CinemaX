Program main;

uses uConfig, uSaver, crt, uMembership, uFilm, uLoader, uParser, uNowPlaying, uUpComing, uDateData, uTransaction, uCapacity, uShow, uNext, uScheduleFilm, uRegMember, uStart, uLoginMember, uFilter, uSchedule, uSelect, uPayMember, uPayCreditCard;

var
    session : login;
    mainMembership : Membership;
    mainFilm : Film;
    mainSchedule : Schedule;
    mainDate : DateData;
    mainTransaction : Transaction;
    mainCapacity : Capacity;
    command : string;


procedure loadAll() forward; {F1}
procedure saveAll() forward;
procedure prompt() forward;
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

procedure prompt();
begin
    if(session.cond) then
    begin
        writeln('Hi, ', session.user, ' !' );
    end;
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
    else if(coms = 'showNextDay') then showNextDay(mainSchedule, mainDate)
    else if(coms = 'showUpcoming') then showUpcoming(mainSchedule, mainDate)
    else if(coms = 'register') then regMember(mainMembership)
    else if(coms = 'login') then loginMember(mainMembership,session)
    else if(coms = 'genreFilter') then genreFilter(mainFilm)
    else if(coms = 'ratingFilter') then ratingFilter(mainFilm)
    else if(coms = 'showSchedule') then showSchedule(mainSchedule)
    else if(coms = 'selectMovie') then selectMovie(mainTransaction,mainCapacity,mainFilm)
    else if(coms = 'payMember') then payMember(mainTransaction,mainMembership,session)
    else if(coms = 'payCreditCard') then payCreditCard(mainTransaction, mainFilm);
end;


begin
    start();
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
