%% IA707 - Computação Evolutiva - Primeira Lista de Exercícios - Ex 1

%  Instruções
%  ------------
% 1

%  Considere o conjunto de N números naturais disponível no arquivo de dados 
%  numeros_particao.txt. Deseja-se dividir estes números em dois grupos – A e B – 
%  tal que a diferença entre a soma total dos números pertencentes aos subconjuntos
%  (ou às partições) seja a menor possível.
%

%% Initialization
clear ; close all; clc

%% %% =========== Parte I: Configuracao dos parametros =============


alfa = ['000-50';'005-50';'010-50';'015-50';'020-50';'025-50';'030-50';'035-50';'040-50';'045-50';'050-50';'055-50';'060-50';'065-50';'070-50';'075-50';'080-50';'085-50';'090-50';'095-50';'100-50'];

%fprintf('Pressione enter para rodar o PLI \n');
%pause;

%% =========== Parte II : Algoritmo Genético =============
% Para a codificação adotada, implemente um algoritmo genético (AG). 
%
for i=1:21
    for j=1:1
        instancia = sprintf('../instancias/pareto/instance%s.tsp',alfa(i,:));
        [valor(i,j), solucao(i,:), tempoDuracao(i,j)]= PLI_caixeiro(instancia);
        %fprintf('Alvo de %f; Valor obtido de %f\n', target(i),valor(i));                                                                  
        fprintf('Tempo instancia %d execucao %d: %f \n',i ,j , tempoDuracao(i,j));
    end
end
save('solucaoParetoPLI','solucao');
%fprintf('Pressione enter para plotar os gráfico do trajeto \n');
%pause;

%% =========== Parte III : Plotar Trajeto =============

%figure
%plot_mapa(indicesCidades(individuoMaiorFitness))

%% ============================= FIM ================================