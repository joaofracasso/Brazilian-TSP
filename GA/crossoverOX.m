function [filho1,filho2,p1,p2]= crossoverOX(individuo1,individuo2)
    numeroBits = size(individuo1,2);
    pontos = gerarNPontosCorte(numeroBits,2);
    filho1 = crossoverOXAuxiliar(individuo1,individuo2,pontos(1),pontos(2));
    filho2 = crossoverOXAuxiliar(individuo2,individuo1,pontos(1),pontos(2));
end
