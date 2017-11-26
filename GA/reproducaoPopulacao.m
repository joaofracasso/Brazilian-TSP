function [populacaoReproduzida] = reproducaoPopulacao(populacao,numeroPopulacaoGerada,probabilidadeReproducao)
    [numeroIndividuos, numeroCromossomos] = size(populacao);
    populacaoReproduzida = zeros(numeroPopulacaoGerada,numeroCromossomos);
    
    %[dumb,pos] = max(fitnessPopulacao);
    %individuoAleatorio1 = populacao(pos,:);
    i = 1;
    while (i < numeroPopulacaoGerada)
        individuoAleatorio1 = populacao(randi([1 numeroIndividuos],1,1),:);
        individuoAleatorio2 = populacao(randi([1 numeroIndividuos],1,1),:);
        if (rand() < probabilidadeReproducao)
            [f1,f2] = crossoverOX(individuoAleatorio1,individuoAleatorio2);  
            populacaoReproduzida(i,:) = f1;
            populacaoReproduzida(i+1,:) = f2;
            i = i + 2;
        else
            populacaoReproduzida(i,:) = individuoAleatorio1;
            populacaoReproduzida(i+1,:) = individuoAleatorio2;
            i = i + 2;
        end
    end
end