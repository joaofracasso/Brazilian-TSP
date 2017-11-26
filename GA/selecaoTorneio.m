function [populacaoSelecionada] = selecaoTorneio(populacao,numeroIndividuosSelecionados,numeroIndividuosDisputa, fitnessPopulacao)
    numeroAlelos= size(populacao, 2);
    populacaoSelecionada = zeros(numeroIndividuosSelecionados,numeroAlelos);
    numeroIndividuosDisputa = max(2,numeroIndividuosDisputa);

    for j=1:numeroIndividuosSelecionados
        [~,indices] = selecaoAletoria(populacao,numeroIndividuosDisputa);
        [~,posicaoMin] = min(fitnessPopulacao(indices));
        populacaoSelecionada(j,:) = populacao(indices(posicaoMin),:);
    end
end 
