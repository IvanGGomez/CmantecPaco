
function [EPatron,SPatron]=Cargar_Datos_P3A(Archivo,NumEntradas)

M=textRead(Archivo,'%c'); 
N = str2num(M);

for NP=0:1:length(N)-1;
    X=NP;
    for i=1:1:NumEntradas    
        A=mod(X,2);
        X=fix(X/2);
        EPatron(NP+1,i)=A;
    end
end
SPatron=N;
