function [SN]=Encontrar_P(Pesos,nivel)

[a,b]=size(Pesos);

for i=1:1:a
    for j=1:1:b
        if Pesos(i,j)>=nivel
            SN=1;
            return;
        end;
    end;
end;
SN=0;