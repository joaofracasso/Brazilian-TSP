function [fitnessPopulacao] =  computeFitnessPopulacao(populacao,databaseTSP)
    numeroIndividuos = size(populacao,1);
    fitnessPopulacao = [];
    for i=1:numeroIndividuos
        fitnessPopulacao = [fitnessPopulacao; computeFitnessIndividuo(populacao(i,:), databaseTSP)];
    end
end