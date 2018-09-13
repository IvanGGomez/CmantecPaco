function [Mayoria,Neurona]= Estimular_red_P(Entrada,Pesos,Neurona,Parameter)

Phi=(Pesos*[Entrada 1]');
T=(1-(Neurona(:,1)/Parameter.itmax))*Parameter.To;
Exponencial=exp(-(abs(Phi)./T));
Neurona(:,2)=T/Parameter.To.*Exponencial;
ContUno=0;
ContCero=0;
for i=1:1:length(Phi)
    if Phi(i)>=0
        Neurona(i,3)=1;
        ContUno=ContUno+1;
    else
        Neurona(i,3)=0;
        ContCero=ContCero+1;
    end
end

if ContUno>= ContCero
    Mayoria=1;
else
    Mayoria=0;
end
