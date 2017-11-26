function [tFeromonio]=atualizarFeromonio(tFeromonio,melhorRota,rho,tmax,tmin)
    %if custoMelhorRota >= min(custoMelhorRota(1:end-1))
    %    Q = 2*10^(numel(num2str(round(custoMelhorRota*0.02)))-1);
    %else
    %    Q = 10^(numel(num2str(round(custoMelhorRota*0.02)))+1);
    %end
    Q = 2;
    dt = 0.5;
    %dt = Q/custoMelhorRota;

    tFeromonio = rho.*tFeromonio;

    for j=1:size(tFeromonio,1)-1
        tFeromonio(melhorRota(j),melhorRota(j+1)) = tFeromonio(melhorRota(j),melhorRota(j+1)) + dt;
    end
    tFeromonio(melhorRota(j+1),melhorRota(1)) = tFeromonio(melhorRota(j+1),melhorRota(1)) + dt;
    tFeromonio(tFeromonio>tmax) = tmax;
    tFeromonio(tFeromonio<tmin) = tmin;

end