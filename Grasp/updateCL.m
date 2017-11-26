function CL = updateCL(solucao,numeroCidades)
    CL = [];
    for i=1:numeroCidades
        if (sum(i==solucao) == 0)
            CL = [CL i];
        end
    end
end