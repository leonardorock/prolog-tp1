% TP1
% Participantes: Leonardo Oliveira, Lonardo Tiso, Rafael Allan, Rafael Borges

% nome, idade, regiao, linguagem, nivel, salario, regime
candidato(leo, 21, cubatao, python, junior, 2000, clt).
candidato(leandro, 48,cubatao, python, junior, 3000, pj).
candidato(rafa, 55, santos, prolog, pleno, 4000, clt).
candidato(rafael, 23, sanos, java, senior, 4000, clt).
candidato(ciro,50, guaruja, java, pleno, 3500, clt).
candidato(piva, 20, guaruja, prolog, senior, 7000, clt).
candidato(antônio, 48, santos, java, junior, 2000, clt).
candidato(mauricio, 40, saovicente, python, pleno, 3500, pj).
candidato(rogerio, 30, cubatao, c, junior, 1900, clt).
candidato(augusto, 34, cubatao, java, master, 12000, clt).
candidato(ana, 28, santos, cmaismais, senior, 5000, clt).
candidato(daniel, 56, santos, c, junior, 2700, pj).
candidato(gilberto, 31, saovicente, java, pleno, 4000, clt).
candidato(juliana, 32, praiagrande, javascript, pleno, 4200, pj).
candidato(amanda, 26, cubatao, javascript, junior, 1800, clt).
candidato(gabriel, 60, saovicente, java, senior, 6000, clt).
candidato(joana, 42, praiagrande, c, master, 10000, clt).
candidato(leonardo, 51, santos, python, junior, 2200, pj).
candidato(patricia, 52, monguagua, cmaismais, junior, 1900, clt).
candidato(pedro, 39, guaruja, python, junior, 1700, clt).
candidato(fernanda, 30, guaruja, python, senior, 1800, clt).

help :- 
    writeln("Menu de Ajuda"),
    writeln("Para descobrir os aptos a participar utilize processo_seletivo(linguagem, cidade, nivel, regime)"),
    writeln(""),
    writeln("Para descobrir as regiões dos participantes utilize regiao"),
    writeln(""),
    writeln("Para descobrir participantes com o salario proposto utilize salario(valor)"),
    writeln(""),
    writeln("Para descobrir se os participantes estão proximos a se aposentar utilize faixa_etaria"),
    writeln(""),
	writeln("Para descobrir se um participante está proximo a se aposentar utilize aposentado(nome)"),
    writeln(""),
    writeln("Para descobrir os participantes compativeis com o regime solicitado utilize regime(regime)"),
    writeln("").


processo_seletivo(LANGUAGE, CITY, LEVEL, CONTRACT_TYPE) :-
    candidato(X, _, CITY, LANGUAGE, LEVEL, Z, CONTRACT_TYPE),
    writeln('nome | level | pretensão'),
    format('~w | ~w | ~w', [X, LEVEL, Z]).

regiao :- 
    candidato(NOME, _,REGIAO, _, _, _, _),
    format('~w ~w ~n', [NOME, REGIAO]).

salario(VALOR) :- 
    candidato(NAME, _, _, _, _, VALOR, _),
    write(NAME).

aposentado(NOME) :- 
    candidato(NOME,B,_,_,_,_,_),
    B > 50,
    write("Aposentado").

aposentado(NOME) :- 
    candidato(NOME,B,_,_,_,_,_),
    B =< 50,
    B > 45,
    write("Proximo a aposentar").

aposentado(NOME) :- 
    candidato(NOME,B,_,_,_,_,_),
    B >= 20,
    B =< 45,
    write("Longe de aposentar").

faixa_etaria :- 
    candidato(NOME,_,_,_,_,_,_),
    format('~w ', [NOME]),
    aposentado(NOME),
    writeln('').
    

regime(CONTRACT_TYPE) :- 
    candidato(NAME, _, _, _, _, _, CONTRACT_TYPE),
    writeln(NAME).