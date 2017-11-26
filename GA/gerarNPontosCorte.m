function [pontosCorte]= gerarNPontosCorte(numeroBits,numeroPontos)
    pontosCorte = randperm(numeroBits,numeroPontos);
    pontosCorte = sort(pontosCorte);
end