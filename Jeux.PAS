program Jeux;

uses crt,Graph;


procedure initjeu;

var
	i:integer;

begin
	for i:=3 to 50 do
	begin
		GotoXY(i,4);
		write('.');
		GotoXY(i,20);
		write('.');
	end;
	for i:=5 to 20 do
	begin
		GotoXY(3,i);
		write('|');
		GotoXY(50,i);
		write('|');
	end;
	GotoXY(21, 2);
	write('Dungeon''s Reaper !');
end;


procedure defilement(text:string;b:integer);

var
	i,a:integer;
	lettre:string;
	
begin
	a:=4;
	for i:=1 to length(text) do
	begin
		lettre:=Copy(text,i,1);
		Delay(50);
		GotoXY(a,b);
		write(lettre);
		a:=a+1;
		if a>45 then
		begin
			if (lettre=' ') OR (lettre=',') OR (lettre='.') then
			begin
				b:=b+1;
				a:=4;
			end;
		end;
	end;
end;


procedure clrtext;
var
	i:integer;
begin
	for i:=22 to 30 do
	begin
		GotoXY(2,i);
		clrEOl;
	end;
end;


procedure histoire;
begin
	cursoroff;
	initjeu;
	GotoXY(10,12);
	write('|__  o   __ _|_   __  o  __   ___ ');
	GotoXY(10,13);
	write('|  ) | __)   |_, (__) | |  '' (__/_');
	
	defilement('   Le monde d''Yggdrasill est en paix, et ce depuis plus de cent ans. Les seuls assauts que les humains se doivent de repousser sont ceux des creatures arpentant les terres qu''ils ont conquises par le temps et la tenacite.',22);
	Delay(3000);
	clrtext;
	defilement('Les guerres qui ont un jour secoue le royaume entier ont cesse, des alliances ont ete conclues de longues dates et les accords sont depuis respectes. Jusqu''au jour ou, ce mage apparut et detruisi tout sur son passage.',22);
	Delay(3000);
	clrtext;
	defilement('Vous etes maintenant dans son donjon, trouver le et tuer le ! Bon jeu !',22);
	Delay(5000);
	cursoron;
end;


procedure personnage(pseudo:string;PDV,F,Intel,Ag,Arme,P,PO:integer);
var
	i:integer;
begin

	for i:=52 to 72 do
	begin
		GotoXY(i,6);
		write('.');
		GotoXY(i,16);
		write('.');
		GotoXY(i,8);
		write('.');
		GotoXY(i,14);
		write('.');
		GotoXY(i,18);
		write('.');
	end;
	for i:=7 to 18 do
	begin
		GotoXY(52,i);
		write('|');
		GotoXY(72,i);
		write('|');
	end;

	GotoXY(52,5);
	write('Piece d''or :',PO);//65,5
	GotoXY((62-(length(pseudo) DIV 2)),7);
	write(pseudo);
	GotoXY(54,9);
	write('[Caracteristique]');
	GotoXY(53,10);
	write('PDV  :',PDV);//59,10
	GotoXY(53,11);
	write('Force:',F);//59,11
	GotoXY(53,12);
	write('Intel:',Intel);//59,12
	GotoXY(53,13);
	write('Agi  :',Ag);//59,13
	GotoXY(53,15);
	write('DPS  :',F+Arme);//59,15
	GotoXY(63,15);
	write('Potion:',P);//70,15
	GotoXY(53,17);
	write('Choix:');//59,17

end;


procedure village(pseudo:string;PDV,F,Intel,Ag,Arme,P,PO:integer);
var
	reponse:char;
	nbr,POt,choix,CArme:integer;
begin

	cursoroff;
	clrscr;
	defilement('Chargement du village........',1);
	Delay(2000);
	cursoron;

	clrscr;
	initjeu;
	personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
	GotoXY(10,12);
	write('     o |   |    __   __   ___  ');
	GotoXY(10,13);
	write('(__| | |_, |_, (__( (__| (__/_ ');
	GotoXY(10,14);
	write('                     __/       ');
	
	repeat
	begin
		clrtext;
		GotoXY(5,22);
		write('Bienvenue au village !');
		GotoXY(6,23);
		write('1- Potion');	
		GotoXY(6,24);
		write('2- Arme');
		GotoXY(6,25);
		write('0- Quitter');

		GotoXY(59,17);
		readln(choix);
		GotoXY(59,17);
		write(' ');
		case choix of
			1:
			begin
				repeat
				begin
					clrtext;
					GotoXY(5,22);
					write('Voulez-vous achete une potion ? O/N');
					GotoXY(7,23);
					write('Reponse:');
					readln(reponse);
					reponse:=UpCase(reponse);
					if reponse='O' then
					begin
						GotoXY(5,24);
						write('Combien ? 50po/u');
						GotoXY(7,25);
						write('|');
						readln(nbr);
						POt:=nbr*50;
						if (POt<=PO) AND (PO<>0) then
						begin
							GotoXY(7,26);
							write('Vous venez d''acheter ', nbr, ' potion(s)');
							P:=P+nbr;
							PO:=POt-PO;
							personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
						end
						else if nbr=0 then
						begin
							GotoXY(7,26);
							write('Erreur');
						end
						else
						begin
							GotoXY(7,26);
							write('Vous n''avez pas asser d''argent');
						end;
						Delay(2000);
					end;
				end;
				until (reponse='N') OR (reponse='O');
			end;
	
			2:
			begin
				repeat
				begin
					clrtext;
					GotoXY(5,22);
					write('Voulez-vous achete une arme ? O/N');
					GotoXY(7,23);
					write('Reponse:');
					readln(reponse);
					reponse:=UpCase(reponse);
					
					if (reponse='O') then
					begin
						GotoXY(5,24);
						write('Voici la liste des armes disponible :');
						GotoXY(7,25);
						write('1- Epee du debutant (+1 DPS)');
						GotoXY(7,26);
						write('2- Epee en fer (+2 DPS)');
						GotoXY(7,27);
						write('3- Epee en acier (+3 DPS)');
						GotoXY(7,28);
						write('4- Epee en argent (+4 DPS)');
						GotoXY(7,29);
						write('0- Quitter');
						GotoXY(7,30);
						write('Choix:');
						readln(CArme);
						
						case CArme of
							1:
							begin
								POt:=100;
								if (POt<=PO) AND (PO<>0) then
								begin
									clrtext;
									GotoXY(5,24);
									write('Vous venez d''acheter l''epee du debutant.');
									Arme:=1;
									PO:=POt-PO;
									personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
									Delay(2000);
								end
								else
								begin
								clrtext;
									GotoXY(5,24);
									write('Vous n''avez pas asser d''argent');
								end;
								Delay(2000);
							end;
							
							
							2:
							begin
								POt:=200;
								if (POt<=PO) AND (PO<>0) then
								begin
									clrtext;
									GotoXY(5,24);
									write('Vous venez d''acheter l''epee en fer.');
									Arme:=2;
									PO:=POt-PO;
									personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
									Delay(2000);
								end
								else
								begin
								clrtext;
									GotoXY(5,24);
									write('Vous n''avez pas asser d''argent');
								end;
								Delay(2000);
							end;
							
							
							3:
							begin
								POt:=300;
								if (POt<=PO) AND (PO<>0) then
								begin
									clrtext;
									GotoXY(5,24);
									write('Vous venez d''acheter l''epee en acier.');
									Arme:=2;
									PO:=POt-PO;
									personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
									Delay(2000);
								end
								else
								begin
								clrtext;
									GotoXY(5,24);
									write('Vous n''avez pas asser d''argent');
								end;
								Delay(2000);
							end;
							
							
							4:
							begin
								POt:=400;
								if (POt<=PO) AND (PO<>0) then
								begin
									clrtext;
									GotoXY(5,24);
									write('Vous venez d''acheter l''epee en argent.');
									Arme:=4;
									PO:=POt-PO;
									personnage(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
									Delay(2000);
								end
								else
								begin
								clrtext;
									GotoXY(5,24);
									write('Vous n''avez pas asser d''argent');
								end;
								Delay(2000);
							end;
							
							0:
							begin
							end
							
							else write('erreur');
							
							
						end;
						
					end;
				end;
				until (reponse='N') OR (reponse='O');
			end
	

		end;
	end;
	until choix=0;
end;



//Programme principal
VAR
	PDV,F,Intel,Ag,Arme,P,PO:integer;
	pseudo,text,lettre:string;

BEGIN
clrscr;
Window(2,2,90,35);

histoire;	//prelude du jeu (histoire)
clrscr;

//Choix pseudo
write('Bonjour hero ! ', #13#10, 'Entrez votre pseudo : ');
repeat
begin
	readln(pseudo);
	if length(pseudo)>8 then
	begin
		writeln('Erreur 8 Caractere max.');
	end
	else if length(pseudo)<3 then
	begin
		writeln('Erreur 3 Caractere min.');
	end;
end;
until (length(pseudo)<9) AND (length(pseudo)>3);
pseudo:=UpCase(pseudo);
//Fin Choix pseudo


clrscr;
cursoroff;
defilement(pseudo + ', le mage est dans son donjon ! Avant tout autre chose vous devriez vous equipez au village.',1);
Delay(5000);
cursoron;


//Caracteristique de base personnage
PDV:=10;
F:=4;
Intel:=2;
Ag:=3;
Arme:=0;
P:=0;
PO:=100;
//FIN


//Partie village
village(pseudo,PDV,F,Intel,Ag,Arme,P,PO);
//FIN

//Partie donjon


readln;
END.
