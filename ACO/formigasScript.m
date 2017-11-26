%% MO 824 - Tópicos em Otimizacao combinatória - Projeto Final

%% Initialization
clear ; close all; clc

%% %% =========== Parte I: Configuracao dos parametros =============

nIteracoes = 1200;
%target = [3.204236; -7.003440; -17.414675; -27.994376; -38.763937];
%target = [-inf; -6.7233; -16.7181; -26.8746; -37.2134];
%alfa = ['100';'075';'050';'025';'000']
target =[-7.0109;  -11.7802;  -17.3638;  -33.5227;  -45.3149;  -34.9688;  -46.6255;  -14.0210;  -97.9997;  -80.8875;  -49.2801;  -15.7621; -117.8695; 2.8919];
alfa = ['026';'050';'068';'070';'072';'087';'092';'123';'125';'137';'151';'155';'164';'166'];
rho = 0.9;
alpha = 1; 
beta = 5;
tmax = 5;
tmin = 0.1;
%fprintf('Pressione enter para rodar o GRASP \n');
%pause;

%% =========== Parte II : Colonia de Formigas =============
% Para a codificação adotada, implemente um colonia de formigas (AC). 
%
for i=1:14
    for j=1:1
        instancia = sprintf('../instancias/performanceProfile/instance%s.tsp',alfa(i,:));
        [~, valor(i,j), tempoDuracao(i,j)] = coloniaFormigasTSP(nIteracoes,rho,alpha,beta,tmax,tmin,instancia,-inf); 
        fprintf('Tempo instancia %d execucao %d: %f \n',i ,j , tempoDuracao(i,j));
    end
end
save('tabelaFormiga','target','tempoDuracao','valor');
%fprintf('Pressione enter para plotar os gráfico do trajeto \n');
%pause;

%% =========== Parte III : Plotar Trajeto =============

%for i=1:repeticoes
%    figure
%    plot_mapa(latFronteira,lonFronteira, cidades, individuoMaiorFitness(i,:))
%    title('Colonia de Formigas')
%end


%% ============================= FIM ================================