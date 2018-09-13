%si tipo =0 los patrones seran booleanos,
%si tipo =1 los patrones son entre 0 y 1;

function [EPatron,SPatron]=Patrones(NumeroEntradas,NumeroPatrones,tipo)
EPatron=zeros(0, NumeroEntradas);
NPatrones=0;
repe=0;

if tipo ==0
        maximo=min(pow2(NumeroEntradas),NumeroPatrones);
else
       maximo=NumeroPatrones;
end

while (NPatrones < maximo)
    if tipo ==0
        Patron=round(rand(1,NumeroEntradas));
    else
       Patron=(rand(1,NumeroEntradas));
    end
    
    for j=1:1:NPatrones
        if Patron==EPatron(j,:)
            repe=1;
        end
    end
    if repe~=1
        EPatron(NPatrones+1,:)=Patron;
        [NPatrones,NEntradas]=size(EPatron);
    end
    repe=0;
end

EPatron;
SPatron=round(rand(1,NPatrones));