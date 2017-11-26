function fitnessAleatorios = selecionarIndividuosAleatoria(populacao,fitnessPopulacao,numeroIndividuosSelecionados)
numeroIndividuos = size(populacao,1);
fitnessAleatorios = zeros(numeroIndividuosSelecionados,1);
individuosAleatorios = randperm(numeroIndividuos,numeroIndividuosSelecionados);
for j=1:numeroIndividuosSelecionados
fitnessAleatorios(j) = fitnessPopulacao(individuosAleatorios(j));
end