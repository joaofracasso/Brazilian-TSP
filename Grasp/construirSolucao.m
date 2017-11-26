function solucao = construirSolucao(alfa,numeroCidades, databaseTSP)
    solucao = randi([1 numeroCidades],1,1);
    CL = updateCL(solucao,numeroCidades);
    RCL = [];
    while ~isequal(length(CL),0)
        maxCost = -inf; 
        minCost = inf;
        for i=1:length(CL)
            deltaCost = databaseTSP(solucao(end),CL(i));
			if (deltaCost < minCost)
				minCost = deltaCost;
            end
			if (deltaCost > maxCost)
				maxCost = deltaCost;
            end
        end
        
        for i=1:length(CL)
            deltaCost = databaseTSP(solucao(end),CL(i));
			if (deltaCost <= minCost + alfa * (maxCost - minCost))
                RCL = [RCL CL(i)];
            end
        end
        
        rndIndex = randperm(length(RCL),1);
		solucao = [solucao  RCL(rndIndex)];
		CL = updateCL(solucao,numeroCidades);
		RCL = [];
    end
		        
    
end