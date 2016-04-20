unit uMembership;

interface
     uses uConfig, uMembershipData;

     type Membership = record
          contents : array[1..ARRAY_LIMIT] of MembershipData;
          size : longint;
     end;

     function registerMember(
          u : MembershipData
     ):Membership;

implementation
     function registerMember(
          u : MembershipData
     ):Membership;
     begin
     end;
end.
