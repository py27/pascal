{Program: Halfpill }
{By - rkunt}

Program HalfPills_rkunt;
{ Half pills generator, it will calculate the probability of choosing a
* pill out of a bottle every time and track the ratios.}

type
	bottle = array of integer;
var
	no_days,no_pills : integer;
	pills,ran_dom,count,prob : integer;
	a,n,i,k : integer;
    b,bot:bottle;
		   
begin
	writeln('Enter Number of Pills in the bottle: ');
    readln(no_pills);
	
	pills:=no_pills;
    n:=0;
	i:=0;
    no_days:=0;		{Keeping count of the number of days left}
    count:=no_pills;		{Keeping count of the number of pills left}
    setlength(b,100);
    setlength(bot,100);

	{Fill the bottle using the random number generator}
	Randomize;
	
	{Generating pills equal to "no_pills" entered by user}
	for a:=1 to no_pills do		
		begin 
			b[a]:=a;
		end;
		
        begin	{Randomizing the pills}
            n:=Random(no_pills)+1;
            k:= b[1];
			b[1]:=b[n];
            b[n]:=k;
        end;
		
	for a:=1 to no_pills do		
        begin
			bot[a]:=b[a]*2;
        end;


	while((i+pills)<>0) do
        begin
            ran_dom:=1+Random(no_pills);
            no_days:=no_days+1;
            if ((bot[ran_dom]/2=b[ran_dom]) AND (bot[ran_dom]<>0)) then {For picking a full pill}
                begin
					
                    writeln('Take out a pill from the bottle.');
                    writeln('This is a full pill. You only need half.');
                    writeln('Break the pill in half and swallow one of the halves, and put the other half back in the bottle.!');
                    writeln('It has been ',no_days, ' days since you started eating the pills.');
                    prob=i/(i+pills):5:3);
                    writeln('The probability for picking this pill was ',prob;
                    b[ran_dom]:=0;
                    i:=i+1;
                    pills:=pills-1;
                    count:=i+pills;
                    writeln(count, ' pills are left in the bottle!');
					writeln();
                end
            else if((b[ran_dom]=0) AND (bot[ran_dom] <>0)) then		{For picking a half pill}
				begin
                    writeln('Take out a pill from the bottle.');
                    writeln('This is a half pill and you can swallow that half pill. ');
                    writeln('It has been ',no_days, ' days since you started eating the pills.'); 
                    prob=i/(i+pills):5:3);
                    writeln('The probability for picking this was ',prob;
                    i:=i-1;
                    bot[ran_dom]:=0;
                    count:=i+pills;
                    writeln(count, ' pills are left in the bottle!');
                    writeln();
                end
            else	{For empty bottle}
                begin
                    no_days:=no_days-1;
                end;
			
        end;  
			writeln('You have eaten all the pills in the bottle!');
			writeln('Press ENTER to exit the program.');
			readln();
end.
