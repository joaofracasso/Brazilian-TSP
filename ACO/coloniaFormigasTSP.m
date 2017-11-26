function [best,costopt,tempoDuracao] = coloniaFormigasTSP(nIteracoes,rho,alpha,beta,tmax,tmin,instancia,target)    
    
    [numeroCidades, ~ , ~, databaseTSP] =  abrirInstancia(instancia);
    databaseTSPSemSegativo = databaseTSP - 1.1*min(databaseTSP(:));
    visaoFormiga = 1./databaseTSPSemSegativo;
    nFormigas=numeroCidades;
    melhorFitness = Inf;
    t = 0;
    t1 = clock;
    tFeromonio=tmax*ones(numeroCidades);
    
    while (~isequal(t,nIteracoes) && (etime(clock,t1)<900))
        t= t+1;
        cidadeInicial = atribuirCidadeInicialFormiga(nFormigas,numeroCidades);
        rotasFormigas = gerarRotaFormigas(cidadeInicial,nFormigas,numeroCidades,visaoFormiga,tFeromonio,alpha,beta); %find the complete tour for each ant
        
        custoRotas = avaliarRotaFormigas(rotasFormigas,databaseTSP);
                
        [custoMelhorRota(t),number]=min(custoRotas);
        melhorRota(t,:)=rotasFormigas(number,:);

        [tFeromonio] = atualizarFeromonio(tFeromonio,melhorRota(t,:),rho,tmax,tmin);
            
        if (custoMelhorRota(t) <= melhorFitness)
            melhorFitness = custoMelhorRota(t);
            melhorSolucao = melhorRota(t,:);
            t2 = clock;
            tempoDuracao = etime(t2,t1);
        end
        if (melhorFitness <= target)
            break;
        end  

        fprintf('Iteracao %d: %f\n', t, custoMelhorRota(t));
    end
    
    costopt=melhorFitness;  
    best = melhorSolucao;
end