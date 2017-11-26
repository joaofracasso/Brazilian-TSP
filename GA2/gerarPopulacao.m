function populacao = gerarPopulacao(numeroIndividuos,numeroCidades)

for i=1:numeroIndividuos
    populacao(i,:) = gerarIndividuo(numeroCidades);
end
end


