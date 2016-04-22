unit uPriceX;

interface
{pW1 dan pW2 adalah harga weekdays dan weekend}
var
seat : integer;
hari : string;
pW1, pW2 : longint;

function hargaCC (seat : integer; hari : string; pW1, pW2 : longint) : longint;

function hargaM (seat : integer; hari : string; pW1, pW2 : longint) : longint;




implementation


function hargaCC (seat : integer; hari : string; pW1, pW2 : longint) : longint;
	begin
		if (hari='Sabtu') then
			begin
                    if(seat >= 2) then
                    begin
                   	 hargaCC := pW2 * (seat - 1);
                    end else {seat=1}
                    begin
                         hargaCC := pW2 * seat
                    end;
			end else
		if (hari='Minggu') then
			begin
			hargaCC := pW2 * seat;
			end else
        {Senin/Selasa/Rabu/Kamis/Jumat}
			begin
			hargaCC := pW1 * seat;
			end;
	end;

function hargaM (seat : integer; hari : string; pW1, pW2 : longint) : longint;
    begin
        if ((hari='Sabtu') or (hari='Minggu')) then
			begin
			hargaM := pW2 * seat;
			end else
        {Senin/Selasa/Rabu/Kamis/Jumat}
			begin
			hargaM := pW1 * seat;
			end;
    end;















end.
