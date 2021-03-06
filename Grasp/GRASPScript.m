%% MO 824 - Tópicos em Otimizacao combinatória - Projeto Final


%% Initialization
clear ; close all; clc

%% %% =========== Parte I: Configuracao dos parametros =============

nIteracoes = 5000;
%target = [3.204236; -7.003440; -17.414675; -27.994376; -38.763937];
%target = [3.3644; -6.7233; -16.7181; -26.8746; -37.2134];
%alfa = ['40-100';'40-075';'40-050';'40-025';'40-000'];
target =[-7.0109;  -11.7802;  -17.3638;  -33.5227;  -45.3149;  -34.9688;  -46.6255;  -14.0210;  -97.9997;  -80.8875;  -49.2801;  -15.7621; -117.8695; 2.8919];
alfa = ['026';'050';'068';'070';'072';'087';'092';'123';'125';'137';'151';'155';'164';'166'];
%fprintf('Pressione enter para rodar o GRASP \n');
%pause;

%% =========== Parte II : Grasp =============
% Para a codificação adotada, implemente um grasp. 
%
    
for i=1:14
    for j=1:1
        instancia = sprintf('../instancias/performanceProfile/instance%s.tsp',alfa(i,:));
        [~, valor(i,j), tempoDuracao(i,j)] = graspTSP(0.01,nIteracoes,instancia,-inf);
        %fprintf('Alvo de %f; Valor obtido de %f\n', target(i),valor(i));                                                                  
        fprintf('Tempo instancia %d execucao %d: %f \n',i ,j , tempoDuracao(i,j));
    end
end
save('tabelaGRASP','target','tempoDuracao','valor');
%pause;

%% =========== Parte III : Plotar Trajeto =============

%figure
%plot_mapa(indicesCidades(individuoMaiorFitness))
%title('Algoritmo Genetico Classico')

%% ============================= FIM ================================