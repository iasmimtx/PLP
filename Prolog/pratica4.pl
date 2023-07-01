set_novo_maior_valor(_, MaiorValor, IndexNovoValor, NovoValor, IndexNovoValor, NovoValor) :- NovoValor > MaiorValor.
set_novo_maior_valor(IndexMaiorValor, MaiorValor, _, _, IndexMaiorValor, MaiorValor).  

maior_da_lista([H| T], MaiorValor, IndexMaiorValor) :-
    maior_da_lista(2, 1, H, T, MaiorValor, IndexMaiorValor).
    
maior_da_lista(_, IndexMaiorValor, MaiorValor, [], MaiorValor, IndexMaiorValor).
maior_da_lista(I, IndexMaior, MaiorValor, [H | T], ResultadoMaiorValor, ResultadoIndexMaiorValor) :-
    set_novo_maior_valor(IndexMaior, MaiorValor, I, H, NovoIndexMaior, NovoMaiorValor),
    NovoIndex is I + 1,
    maior_da_lista(NovoIndex,NovoIndexMaior, NovoMaiorValor, T, ResultadoMaiorValor, ResultadoIndexMaiorValor).
    
maior_da_matriz([H | T], Resultado) :-
    maior_da_lista(H, MaiorValor, IndexMaiorValor),
    maior_da_matriz(2, 1, IndexMaiorValor, MaiorValor, T, Resultado).

set_novo_maior_matriz(_, _, Maior, LinhaNovoValor, ColunaNovoValor, NovoValor, LinhaNovoValor, ColunaNovoValor, NovoValor):-
    NovoValor > Maior.
set_novo_maior_matriz(LinhaMaior, ColunaMaior, Maior, _, _, _, LinhaMaior, ColunaMaior, Maior).


maior_da_matriz(_, LinhaMaiorValor, ColunaMaiorValor, _, [], Resultado) :-    
    number_codes(LinhaMaiorValor, LinhaString),
    number_codes(ColunaMaiorValor, ColunaString),
    atom_chars(LinhaAtom, LinhaString),
    atom_chars(ColunaAtom, ColunaString),
    atom_concat(LinhaAtom, ' ', AuxAtom),
    atom_concat(AuxAtom, ColunaAtom, ResultadoAtom),
    atom_string(ResultadoAtom, Resultado).
maior_da_matriz(I, LinhaMaiorValor, ColunaMaiorValor, MaiorValor, [H | T], Resultado) :-
        maior_da_lista(H, MaiorLista, IndexMaiorLista),
        set_novo_maior_matriz(LinhaMaiorValor, ColunaMaiorValor, MaiorValor, I, IndexMaiorLista, MaiorLista, NovaLinhaMaiorValor, NovaColunaMaiorValor, NovoMaiorValor),
        NovoIndex is I + 1,
        maior_da_matriz(NovoIndex, NovaLinhaMaiorValor, NovaColunaMaiorValor, NovoMaiorValor, T, Resultado).
    
main :-
    read(Matriz),
    maior_da_matriz(Matriz, Resultado),
    write(Resultado),
    half.