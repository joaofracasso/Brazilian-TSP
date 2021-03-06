function [p] = buscaLocal(p,D)
%EXCHANGE2 Improve tour p by 2-opt heuristics (pairwise exchange of edges).
%   The basic operation is to exchange the edge pair (ab,cd) with the pair
%   (ac,bd). The algoritm examines all possible edge pairs in the tour and
%   applies the best exchange. This procedure continues as long as the
%   tour length decreases. The resulting tour is called 2-optimal.

    n = numel(p);
    zmin = -1;

    % Iterate until the tour is 2-optimal
    %while zmin < 0

        zmin = 0;
        i = 0;
        b = p(n);

        % Loop over all edge pairs (ab,cd)
        while i < n-2
            a = b;
            i = i+1;
            b = p(i);
            Dab = D(a,b);
            j = i+1;
            d = p(j);
            while j < n
                c = d;
                j = j+1;
                d = p(j);
                % Tour length diff z
                % Note: a == d will occur and give z = 0
                z = (D(a,c) - D(c,d)) + D(b,d) - Dab;
                % Keep best exchange
                if z < zmin
                    zmin = z;
                    imin = i;
                    jmin = j;
                end
            end
        end

        % Apply exchange
        if zmin < 0
            p(imin:jmin-1) = p(jmin-1:-1:imin);
        end

    %end
    % Tour length
    q = double(p);
    ind = sub2ind([n,n],q,[q(2:n),q(1)]);
    L = sum(D(ind));
end