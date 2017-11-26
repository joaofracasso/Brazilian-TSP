function [f] =  computeFitnessIndividuo(individuo, databaseTSP)
    numeroCidades = size(individuo,2);
    f = 0.0;
    for i=1:(numeroCidades-1)
        cidadePartida = individuo(i);
        cidadeChagada = individuo(i+1);
        f= f + databaseTSP(cidadePartida,cidadeChagada);
    end

    cidadePartida = individuo(numeroCidades);
    cidadeChagada = individuo(1);
    f = f + databaseTSP(cidadePartida,cidadeChagada);
end