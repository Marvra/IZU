% Zadani c. 47:
% Napiste program resici ukol dany predikatem u47(LIN,VIN,VOUT), kde LIN 
% vstupni ciselny seznam s nejmene jednim prvkem, VIN je vstupni promenna,  
% jejiz hodnotu je prirozene cislo a VOUT je promenna, ve ktere se vraci hodnota 
% souctu cisel seznamu LIN s mensim indexem, nez je hodnota ve VIN. Uvazujte, 
% ze indexovani zacina jednickou, tj. ze prvni prvek seznamu LIN ma index 1.


% Testovaci predikaty:                                             % VOUT
u47_1:- u47([5,7,9,-10,23,-4],5, VOUT),write(VOUT).	           % 11
u47_2:- u47([1,2.1,3.2,-9],20,VOUT),write(VOUT).     		   % -2.7
u47_3:- u47([-1,2.3,4.7,9.6,10.1,12],-1,VOUT),write(VOUT).         % 0
u47_r:- write('Zadej LIN: '),read(LIN),
        write('Zadej VIN: '),read(VIN),u47(LIN,VIN,VOUT),write(VOUT).

% Reseni:
u47(LIN,VIN,VOUT):-
	length(LIN, Length),
	NewVin is VIN - 1,
	(   
		NewVin >= Length ->
			sum_list(LIN, VOUT);
   		NewVin < 0 ->
			VOUT is 0;
		length(WantedIndexes, NewVin),
		append(WantedIndexes, _, LIN),       
		sum_list(WantedIndexes, VOUT)
	).
