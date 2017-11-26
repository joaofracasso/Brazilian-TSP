function [app]=atribuirCidadeInicialFormiga(m,n)
    app = zeros(m,1);
    for i=1:m
        app(i,1)=fix(1+rand*(n-1));%ants primary placing.
    end
end