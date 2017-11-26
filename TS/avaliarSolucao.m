function [f] =  avaliarSolucao(solucao, databaseTSP)
    numeroCidades = size(solucao,2);
    f = 0.0;
    for i=1:(numeroCidades-1)
        cidadePartida = solucao(i);
        cidadeChagada = solucao(i+1);
        f= f + databaseTSP(cidadePartida,cidadeChagada);
    end

    cidadePartida = solucao(numeroCidades);
    cidadeChagada = solucao(1);
    f = f + databaseTSP(cidadePartida,cidadeChagada);
end