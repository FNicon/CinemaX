unit uRegMember;

interface
    uses uMembershipData, uMembership, uSaver, uConfig;

    procedure regMember(
        var mainM : Membership
    );

implementation
    procedure regMember(var mainM : Membership);
    var
        u, p : string;
    begin
        writeln('Selamat datang!');
        writeln('Untuk memulai proses registrasi, silakan isi form di bawah ini :)');
        write('username  : '); readln(u);
        write('password  : '); readln(p);
        mainM.contents[mainM.size+1].username := u;
        mainM.contents[mainM.size+1].password := p;
        mainM.contents[mainM.size+1].saldo := 100000;
        mainM.size := mainM.size + 1;
        saveMembership(mainM, DATABASE_MEMBER_FILENAME);
    end;
end.