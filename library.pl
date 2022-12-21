siglo('XVIII',1700,1799).
siglo('XIX',1800,1899).
siglo('XX',1900,1999).
biblioteca(nombre('Cervantes'),idiomas(['Frances','Español','Portugues','Italiano'])).
biblioteca(nombre('Dickens'),idiomas(['Ingles','Aleman','Ruso','Danes','Frances'])).
biblioteca(nombre('Homero'),idiomas(['Arabe','Griego clasico','Griego antiguo'])).
libro('Todo se desmorona','Chinua Achebe',1958,'Nigeria','Ingles').
libro('Cuentos infantiles','Hans Christian Andersen',1837,'Dinamarca','Danes').
libro('Divina comedia','Dante Alighieri',1321,'Italia','Italiano').
libro('Papa Goriot','Honore de Balzac',1835,'Francia','Frances').
libro('Decameron','Giovanni Boccaccio',1353,'Ravena','Italiano').
libro('Ficciones','Jorge Luis Borges',1944,'Argentina','Español').
libro('Cumbres Borrascosas','Emily Bront',1847,'Reino Unido','Ingles').
libro('El extranjero','Albert Camus',1942,'Argelia','Frances').
libro('Viaje al fin de la noche','Louis-Ferdinand Celine',1932,'Francia','Frances').
libro('Don Quijote de la Mancha','Miguel de Cervantes',1605,'España','Español').
libro('Los cuentos de Canterbury','Geoffrey Chaucer',1400,'Inglaterra','Ingles').
libro('Relatos cortos','Anton Chejov',1886,'Rusia','Ruso').
libro('Nostromo','Joseph Conrad',1904,'Reino Unido','Ingles').
libro('Grandes Esperanzas','Char les Dickens',1861,'Reino Unido','Ingles').
libro('Jacques el fatalista','Denis Diderot',1796,'Francia','Frances').
libro('Berlin Alexanderplatz','Alfred Dublin',1929,'Alemania','Aleman').
libro('Crimen y castigo','Fiodor Dostoievski',1866,'Rusia','Ruso').
libro('Middlemarch','George Eliot',1871,'Reino Unido','Ingles').
libro('El hombre invisible','Ralph Ellison',1952,'Estados Unidos','Ingles').
libro('Medea','Euripides',-431,'Imperio ateniense','Griego clasico').
libro('Absalom','William Faulkner',1936,'Estados Unidos','Ingles').
libro('La educacion sentimental','Gustave Flaubert',1869,'Francia','Frances').
libro('Romancero gitano','Federico Garcia Lorca',1928,'España','Español').
libro('Cien a os de soledad','Gabriel Garcia Marquez',1967,'Colombia','Español').
libro('Almas muertas','Nikolai Gogol',1842,'Ucrania','Ruso').
libro('Gran Serton: Veredas','Jogo Guimares Rosa',1956,'Brasil','Portugues').
libro('Hambre','Knut HamsunÊ',1890,'Noruega','Noruego').
libro('El viejo y el mar','Ernest Hemingway',1952,'Estados Unidos','Ingles').

libroSigloBiblioteca(T,S,B):-
    libro(T,_,A,_,I),siglo(S,A1,A2),
    A>=A1,
    A=<A2,
    biblioteca(nombre(B),idiomas(L)),
    member(I,L).
autoresIdiomaSiglo(Autores,I,S):-
    armarListaAutores(Autores,I,S,[]).
   armarListaAutores([X|L],I,S,Aux):-
    libro(_,X,AN,_,I),siglo(S,A1,A2),
     AN>=A1, AN=<A2,
    not(member(X, Aux)), !, append(Aux, [X], Aux2), 
 armarListaAutores(L,I,S,Aux2). 
armarListaAutores([],_,_,Aux).
  
numeroAutoresPorPais(P,N):-
   armarListaPais(L,P,[]),length(L,N).
   armarListaPais([X|L],P,Aux):-
   libro(_,X,_,P,_),
   not(member(X, Aux)), !, append(Aux,[X],Aux2), 
   armarListaPais(L,P,Aux2). 
   armarListaPais([],_,Aux).
    
    
    








