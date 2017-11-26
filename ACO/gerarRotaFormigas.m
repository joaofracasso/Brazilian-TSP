function [rotaFormigas]=gerarRotaFormigas(cidadeInicial,nFormigas,numeroCidades,visaoFormiga,tFeromonio,alpha,beta)
    rotaFormigas = [];
    for i=1:nFormigas
        mh=visaoFormiga;
        rotaFormiga = cidadeInicial(i);
        for j=1:numeroCidades-1
            cidadeAtual = rotaFormiga(j);
            mh(:,cidadeAtual)=0;
            temp=(tFeromonio(cidadeAtual,:).^alpha).*(mh(cidadeAtual,:).^beta);
            cidadesNaoVisitadas = 1:numeroCidades;
            cidadesNaoVisitadas(rotaFormiga) = [];
            s=(sum((tFeromonio(cidadeAtual,cidadesNaoVisitadas).^alpha).*(mh(cidadeAtual,cidadesNaoVisitadas).^beta)));
            p=(1/s).*temp;
            q=rand;
            q0=0;
            for k=1:numeroCidades
                q0=q0+p(k);
                if q<=q0
                    rotaFormiga = [rotaFormiga k];
                    break
                end
            end
        end
        rotaFormigas = [rotaFormigas ; rotaFormiga];
    end
end
