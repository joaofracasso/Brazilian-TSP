function [populacaoSelecionada,indice] = selecaoAletoria(populacao,numeroIndividuosSelecionados)

index = randperm(size(populacao,1),numeroIndividuosSelecionados);

for j = 1:numeroIndividuosSelecionados 
    populacaoSelecionada(j,:) = populacao(index(j),:);
    indice(j) = index(j);
end
end 