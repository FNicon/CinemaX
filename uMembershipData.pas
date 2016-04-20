unit uMembershipData;

interface

     type
          MembershipData = record
               username : string;
               password : string;
               saldo : longint;
          end;

     function MembershipDataCons(
          u : string;
          p : string;
          s : longint
     ):MembershipData;

implementation
     function MembershipDataCons(
          u : string;
          p : string;
          s : longint
     ):MembershipData;
     begin
          MembershipDataCons.username := u;
          MembershipDataCons.password := p;
          MembershipDataCons.saldo := s;
     end;
end.
