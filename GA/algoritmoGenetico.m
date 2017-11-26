function [individuoMaiorFitness,fitnessMelhorIndividuo,tempoDuracao] = algoritmoGenetico(numeroIndividuos,...
                                                                                        numeroGeracoes,...
                                                                                        probabilidadeMutacao,...
                                                                                        probabilidadeReproducao,...
                                                                                        numeroIndividuosDisputa,....
                                                                                        instancia,...
                                                                                        target)
                                                              
[numeroCidades, ~ , ~, databaseTSP] =  abrirInstancia(instancia);    
numeroIndividuosDisputa = round(numeroIndividuosDisputa*numeroIndividuos);
populacao = gerarPopulacao(numeroIndividuos,numeroCidades);
t = 0;
t1 = clock;
fitnessPassado = Inf;
sat = 0;
limite=log(numeroCidades)*100;

melhorFitness = Inf;

while (~isequal(t,numeroGeracoes) && (etime(clock,t1)<900))
    t = t + 1;
    populacao = reproducaoPopulacao(populacao,2*numeroIndividuos,probabilidadeReproducao);
    populacao = mutacaoPopulacao(populacao,probabilidadeMutacao/numeroCidades,2);
    fitnessPopulacao = computeFitnessPopulacao(populacao, databaseTSP);
    %maiorFitnessGeracao(t) = max(fitnessPopulacao);
    %mediaFitnessGeracao(t) = mean(fitnessPopulacao);
    [menorFitnessGeracao, index]= min(fitnessPopulacao);
    if (menorFitnessGeracao <= melhorFitness)
        melhorFitness = menorFitnessGeracao;
        melhorSolucao = populacao(index,:);
        t2 = clock;
        tempoDuracao = etime(t2,t1);
    end
    
    if (melhorFitness <= target)
        break;
    end
    fprintf('Geracao: %d, fitness: %f\n',t,melhorFitness);
    populacao = selecaoTorneio(populacao,numeroIndividuos,numeroIndividuosDisputa,fitnessPopulacao);  
end

fitnessMelhorIndividuo = melhorFitness;
individuoMaiorFitness =  melhorSolucao;
%fprintf('Result for irace=%g\n',fitnessMelhorIndividuo);

%% =========== Parte II : Curvas de Fitness =============
% Curvas de fitness maximo, médio e minimo em função do número de gerações
%  
%

% fig = figure;
% plot(maiorFitnessGeracao)
%     hold on
%     plot(mediaFitnessGeracao)
%     hold on
%     plot(menorFitnessGeracao)
%     titulo = title(['Curvas de fitness']);
%     set(titulo,'FontSize',14,'Interpreter','Latex')
%     xlabel('Gera\c{c}\~oes $(t)$','FontSize',14,'Interpreter','Latex');
%     ylabel('Fitness','FontSize',14,'Interpreter','Latex');
%     legenda = legend('Pior individuo',...
%                      'M\''edia da popula\c{c}\~ao',...
%                      'Melhor individuo',...
%                      'Location','northeast');
%     set(legenda,'FontSize',14,'Interpreter','Latex')
    

end