function [individuoMutante] =  mutacaoIndividuo(individuo, probabilidadeMutacao,numeroCortes)
numeroBits = size(individuo,2);
individuoMutante = individuo;
    if (rand()<probabilidadeMutacao)
        pontos = gerarNPontosCorte(numeroBits,numeroCortes);
        for i=1:2:length(pontos)
            individuoMutante(pontos(i):pontos(i+1)) = fliplr(individuo(pontos(i):pontos(i+1)));
        end
    end
end