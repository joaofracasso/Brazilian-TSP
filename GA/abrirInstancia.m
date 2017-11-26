function [numeroCidades, alfa, indicesCidades, databaseTSP] =  abrirInstancia(filename)
    fileID = fopen(filename);
    c = textscan(fileID,'%f');
    fclose(fileID);
    cVetor = c{1};
    numeroCidades = round(cVetor(1));
    alfa = cVetor(2);
    indicesCidades = floor(cVetor(3:2+numeroCidades));
    databaseTSP = reshape(cVetor(3+numeroCidades:end),numeroCidades,numeroCidades);
end