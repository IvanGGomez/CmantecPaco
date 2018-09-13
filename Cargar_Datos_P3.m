
function [EPatron,SPatron]=Cargar_Datos_P3(Archivo,NumEntradas)

M=textread(Archivo,'%c');
Longitud=length(M);

Longitud=length(M);

for i=0:1:Longitud-1
    X=i;
    
    for j=1:1:NumEntradas
        A=mod(X,2);
        X=fix(X/2);
        Y(i+1,j)=A;
    end
    Y(i+1,NumEntradas+1)=str2double(M(i+1));
end
Y;

EPatron=Y(:,1:NumEntradas);
SPatron=Y(:,NumEntradas+1);