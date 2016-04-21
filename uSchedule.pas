unit USchedule;

interface
	uses uScheduleFilm;

	var
	movie : Schedule;

	function isEarlier(
	d1, m1, y1, d2, m2, y2 : integer
	): boolean;
	
	function isKabisat (
	maind:integer
	): boolean ;
	 
	procedure showSchedule();


implementation

	function isEarlier(
	d1, m1, y1, d2, m2, y2 : integer
	): boolean;
		begin
			if (y1<y2) then {cek tahun}
				isEarlier := True
			else if (y1=y2) then
					begin
						if m1<m2 then {cek bulan}
							isEarlier:=True
						else if m1=m2 then
								begin
									if d1<=d2 then {cek tanggal. asumsi tanggal yg sama berniali benar}
									 isEarlier := True
									else isEarlier := False;
								end;
					end;
		end;


	function isKabisat (maind:integer)  : boolean ; 
		begin
			If (maind mod 100 = 0) Then
			begin
				If (maind  mod 400 = 0) Then 
				begin
					isKabisat:=True; {merupakan tahun kabisat}
				end;
			end else if (maind  mod 4 =0) then
			begin
				isKabisat:=True; {merupakan tahun kabisat}
			end;
		end;

	procedure showSchedule();
	var
		moviename : string;
		t1, b1, th1, t2, b2, th2,d : integer;
		dd, mm, yy : integer;
		i : integer;
	begin
	
		write('Input moviename : '); readln(moviename);
		write('Input date (dd mm yy) :');
		read(dd); read(mm); read(yy);
		
		
		
		for i:=1 to Movie.size do
		begin
			if moviename=Movie.contents[i].namafilm then 
				begin
					t1:=Movie.contents[i].tanggalmulaitayang;
					b1:=Movie.contents[i].bulanmulaitayang;
					th1:=Movie.contents[i].tahunmulaitayang;
					d:=Movie.contents[i].lamaharitayang;
					
					{assign nilai t2, b2, dan th2 sebagai tanggal terakhir film ditayangkan}
				
					if (b1=1) or (b1=3) or (b1=5) or (b1=7) or (b1=8) or (b1=10) then
					begin
						if (t1+d>31) then 
							begin
								t2:=t1+d-31;
								b2:=b1+1;
								th2:=th1;
							end
						else
							begin
								t2:=t1+d;
								b2:=b1;
								th2:=th1;
							end;
					end else
					if (b1=4) or (b1=6) or (b1=9) or (b1=11) then
					begin
						if (t1+d>30) then
							begin
								t2:=t1+d-30;
								b2:=b1+1;
								th2:=th1;
							end
						else
							begin
								t2:=t1+d;
								b2:=b1;
								th2:=th1;
							end;
						
					end	else
					if (b1=12) then
					begin
						if (t1+d>31) then
							begin
								t2:=t1+d-31;
								b2:=1;
								th2:=th1+1;
							end
						else
							begin
								t2:=t1+d;
								b2:=b1;
								th2:=th1;
							end;
					end else
					if (b1=2) then
					begin
						if (t1+d>29) and (isKabisat(th1)=True) then
							begin
								t2:=t1+d-29;
								b2:=b1+1;
								th2:=th1;
							end
							else if (t1+d>28) and (isKabisat(th1)=False) then
							begin
								t2:=t1+d-28;
								b2:=b1+1;
								th2:=th1;
							end
							else 
							begin
								t2:=t1+d;
								b2:=b1;
								th2:=th1;
							end;
					end;
					
					{cek jika tanggal input diantara tanggal mulai tayang dan tanggal terakhir tayang}
					{jika benar maka akan ditampilkan jam tayang}
					if (isEarlier(t1, b1, th1, dd, mm, yy)=True) and (isEarlier(dd, mm, yy, t2, b2, th2)=True) then
						writeln(Movie.contents[i].jamtayang);
				end;
			end;
	end;
		





end.
