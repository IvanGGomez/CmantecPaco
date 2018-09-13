function Mayoria= Estimular_red__Prob_P(Entrada,Pesos)

Phi=(Pesos*[Entrada 1]');
ContUno=0;
ContCero=0;
for i=1:1:length(Phi)
    if Phi(i)>=0
        ContUno=ContUno+1;
    else
        ContCero=ContCero+1;
    end
end

if ContUno>= ContCero
    Mayoria=1;
else
    Mayoria=0;
end