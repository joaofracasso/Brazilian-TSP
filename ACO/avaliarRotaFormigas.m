function [custoRotas] =  avaliarRotaFormigas(rotasFormigas,databaseTSP)
    numeroFormigas = size(rotasFormigas,1);
    custoRotas = [];
    for i=1:numeroFormigas
        custoRotas = [custoRotas; avaliarRotaFormiga(rotasFormigas(i,:), databaseTSP)];
    end
end