
sublista(L,SL):-append(L1,L2,L),append(SL,L3,L2).
reemplazar(L,SL,Ree,LRee):-append(L1,L2,L),append(SL,L3,L2),append(Ree,L3,L2R),append(L1,L2R,LRee).

regla(o,[[sn,G,N],[sv,N]]).
regla([sn,G,N],[[det,G,N],[n,G,N]]).
regla([sv,N],[[vt,N],[sn,G,N]]).
regla([sv,N],[[vi,N]]).
regla([det,m,sg],[el]).
reglaD([det,m,sg],[un]).
reglaD([det,f,sg],[la]).
reglaD([det,f,sg],[una]).
reglaD([det,m,pl],[los]).
reglaD([det,m,pl],[unos]).
reglaD([det,f,pl],[las]).
reglaD([det,f,pl],[unas]).
regla([n,m,sg],[perro]).
regla([n,m,pl],[perros]).
regla([n,f,sg],[perra]).
regla([n,f,pl],[perras]).
regla([n,m,sg],[hueso]).
regla([n,m,pl],[huesos]).
regla([vi,sg],[ladra]).
regla([vt,sg],[muerde]).
regla([vt,pl],[muerden]).

basico([]).
basico([E|R]):-regla([det,_,_],L),member(E,L),basico(R).
basico([E|R]):-regla([n,_,_],L),member(E,L),basico(R).
basico([E|R]):-regla([vi,_],L),member(E,L),basico(R).
basico([E|R]):-regla([vt,_],L),member(E,L),basico(R).

deriva([],[]).
deriva([E|R],A):-regla(E,L),deriva(R,PR),append(L,PR,A).
deriva([E|R],[E|PR]):-not(regla(E,L)),deriva(R,PR).

genera(I,I):-basico(I),!.
genera(I,R):-deriva(I,RI),not(basico(I)),genera(RI,R).

gramaticaGenera(O):-genera([o],O).

valida([r]).
valida(F):- sublista(F,SL),regla(NT,SL),reemplazar(F,SL,[NT],FR),valida(FR).
