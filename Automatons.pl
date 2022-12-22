estados([0,1,2,3]).
alfabeto([a,b]).
estadoInicial(0).
estadosFinales([3]).
transicion(origen(0) , destino(1) , simbolo(a)).
transicion(origen(0) , destino(0) , simbolo(b)).
transicion(origen(1) , destino(1) , simbolo(a)).
transicion(origen(1) , destino(2) , simbolo(b)).
transicion(origen(2) , destino(1) , simbolo(a)).
transicion(origen(2) , destino(3) , simbolo(b)).
transicion(origen(3) , destino(0) , simbolo(b)).
transicion(origen(3) , destino(1) , simbolo(a)).

alcanza([X],EO,ED):-transicion(origen(EO),destino(ED),simbolo(X)).
alcanza([X|L],EO,ED):-transicion(origen(EO),destino(I),simbolo(X)),
                       alcanza(L,I,ED).

acepta(Cadena) :- estadoInicial(EO), acepta(Cadena, EO).
acepta([],E) :-estadosFinales(ED),member(E, ED). 
acepta([X|R], E) :-
    transicion(origen(E), destino(SiguienteEstado), simbolo(X)),
    acepta(R, SiguienteEstado). 