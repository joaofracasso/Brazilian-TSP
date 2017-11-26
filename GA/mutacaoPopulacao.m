function populacaoMutante  = mutacaoPopulacao (populacao, probabilidadeMutacao,numeroCortes)
    populacaoMutante = zeros(size(populacao));
    for i = 1:size(populacao,1)
        populacaoMutante(i,:) = mutacaoIndividuo(populacao(i,:),probabilidadeMutacao,numeroCortes);
    end
end