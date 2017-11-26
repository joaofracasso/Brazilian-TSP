%% MO 824 - Tópicos em Otimizacao combinatória - Projeto Final


%% Initialization
clear ; close all; clc

%% %% =========== Parte I: Configuracao dos parametros =============

%instancia = '../instancias/ttt/instance40-000.tsp';
% Número de Individuos
numeroIndividuos = 200;
% Número de Gerações 
numeroGeracoes = 2000;
% Probabilidade Inicial de Mutação
probabilidadeMutacao = 2;
% Probabilidade Inicial de Seleção
probabilidadeReproducao = 0.80;
%Numero de individuos na Disputa
numeroIndividuosDisputa = 0.05;
%Alvo
%target = [3.204236; -7.003440; -17.414675; -27.994376; -38.763937];
%target = [3.3644; -6.7233; -16.7181; -26.8746; -37.2134];
%alfa = ['100';'075';'050';'025';'000'];
%target =[-7.789941;-13.089108;-19.293129;-37.247434;-50.349842;-38.854243;-51.806093;-15.578872 ;-108.888518 ;-89.875003 ;-54.755693 ;-17.513434;-130.966057; 2.628983];
target =[-7.0109;  -11.7802;  -17.3638;  -33.5227;  -45.3149;  -34.9688;  -46.6255;  -14.0210;  -97.9997;  -80.8875;  -49.2801;  -15.7621; -117.8695; 2.8919];
alfa = ['026';'050';'068';'070';'072';'087';'092';'123';'125';'137';'151';'155';'164';'166'];
%fprintf('Pressione enter para rodar o AG \n');
%pause;



%% =========== Parte II : Algoritmo Genético =============
% Para a codificação adotada, implemente um algoritmo genético (AG). 
%

for i=1:14
    for j=1:1
        instancia = sprintf('../instancias/performanceProfile/instance%s.tsp',alfa(i,:));
        [~, valor(i,j), tempoDuracao(i,j)] = algoritmoGenetico(numeroIndividuos,...
                                                                            numeroGeracoes,...
                                                                            probabilidadeMutacao,...
                                                                            probabilidadeReproducao,...
                                                                            numeroIndividuosDisputa,....
                                                                            instancia,...
                                                                            -inf);
    
    %fprintf('Alvo de %f; Valor obtido de %f\n', target(i),valor(i));                                                                  
    fprintf('Tempo instancia %d execucao %d: %f \n',i ,j , tempoDuracao(i,j));
    end
end
save('tabelaAG','target','tempoDuracao','valor');
%fprintf('Pressione enter para plotar os gráfico do trajeto \n');
%pause;

%% =========== Parte III : Plotar Trajeto =============

%figure
%plot_mapa(indicesCidades(individuoMaiorFitness))
%title('Algoritmo Genetico Classico')

%% ============================= FIM ================================