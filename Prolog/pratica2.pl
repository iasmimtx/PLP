pegaEntrada(-1, P,M,G,R,Qtd) :-
    calculaPorcentagem(P, M, G, R),
    Qtd is (P + M + G).

pegaEntrada(Entrada, P,M,G,R,Qtd) :-
    incrementaTamanho(Entrada, P, M, G, NP, NM,NG),
    read(NovaEntrada),
    pegaEntrada(NovaEntrada, NP, NM,NG, R, Qtd).
    
calculaPorcentagem(P,M,G,R) :-
    calculaP(P, RP), 
    calculaM(M, RM),
    calculaG(G, RG),
    R is RP + RM + RG.

calculaP(P, 8) :- P >= 4.
calculaP(_,0).

calculaM(M,6) :- M >= 4.
calculaM(_,0).

calculaG(G, 4) :- G >= 4.
calculaG(_,0).

incrementaTamanho('p', P, M, G, NP, M, G) :-
    NP is P + 1.
    
incrementaTamanho('m', P, M, G, P, NM, G) :-
    NM is M + 1.

incrementaTamanho('g', P, M, G, P, M, NG) :-
    NG is G + 1.
    
incrementaTamanho(_, P, M, G, P, M, G).

    
main :-
    read(Preco),
    pegaEntrada('a', 0,0,0, R,QtdUniforme),
    NovoPreco is Preco * QtdUniforme,
    Desconto is (NovoPreco * R) / 100,
    Resultado is NovoPreco - Desconto,
    format('~2f~n', [Resultado]),
    nl,
    halt.
    
