function [f] =  avaliarRotaFormiga(rotasFormiga, databaseTSP)
    numeroCidades = size(rotasFormiga,2);
    f = 0.0;
    for i=1:(numeroCidades-1)
        cidadePartida = rotasFormiga(i);
        cidadeChagada = rotasFormiga(i+1);
        f= f + databaseTSP(cidadePartida,cidadeChagada);
    end

    cidadePartida = rotasFormiga(numeroCidades);
    cidadeChagada = rotasFormiga(1);
    f = f + databaseTSP(cidadePartida,cidadeChagada);
end