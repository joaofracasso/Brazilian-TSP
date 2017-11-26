function [melhorSolucao, resultadoMelhorSolucao, tempoDuracao] = graspTSP(alfa,nIteracoes,instancia,target)
    [numeroCidades, ~ , ~, databaseTSP] =  abrirInstancia(instancia);    

    t = 0;
    t1 = clock;
    resultadoMelhorSolucao = inf;
    while (~isequal(t,nIteracoes) && (etime(clock,t1)<900))
        t = t+1;
        solucao = construirSolucao(alfa,numeroCidades, databaseTSP);
        solucao = buscaLocal(solucao, databaseTSP);
        resultadoSolucao = avaliarSolucao(solucao, databaseTSP);
        if resultadoSolucao < resultadoMelhorSolucao
            melhorSolucao = solucao;
            resultadoMelhorSolucao = resultadoSolucao;
            t2 = clock;
            tempoDuracao = etime(t2,t1);
        end
        if (resultadoMelhorSolucao <= target)
            break;
        end
        
        fprintf('Itaracao: %d, fitness: %f\n',t,resultadoMelhorSolucao);
    end
end