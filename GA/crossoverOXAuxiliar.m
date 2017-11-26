function filho = crossoverOXAuxiliar(individuo1,individuo2,p1,p2)
numeroBits = size(individuo1,2);
filho = zeros(size(individuo1));
frame = individuo2(p1:p2);
filho(p1:p2) = frame;
j=p2+1;
pos = p2+1;
if (j==numeroBits+1)
    j=1;
end
if (pos==numeroBits+1)
    pos=1;
end
while pos~=p1
    if sum(frame == individuo1(j)) == 0
        filho(pos) = individuo1(j);
        pos = pos + 1;
    end
    j = j + 1;
    if (j==numeroBits+1)
        j=1;
    end
    if (pos==numeroBits+1)
        pos=1;
    end
end