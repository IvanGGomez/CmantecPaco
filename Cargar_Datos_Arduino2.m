
function [EPatron,SPatron,Salida]=Cargar_Datos_Arduino2(Archivo,NumEntradas)

M = load(Archivo);


for NP=1:1:length(M);
    Valor=mod(M(NP),10);
    SPatron(NP)=Valor;
    EPatron(NP)=0;
    for NE=NumEntradas-1:-1:0
        
        M(NP)=M(NP)-Valor;
        M(NP)=M(NP)/10;
        Valor=mod(M(NP),10);
             
        
            EPatron(NP)=EPatron(NP)+Valor*pow2(NE);
            
    end
   
end

NP=1;
while NP<length(M);
              
    if EPatron(NP)>EPatron(NP+1)
        int=EPatron(NP);
        EPatron(NP)=EPatron(NP+1);
        EPatron(NP+1)=int;
        int=SPatron(NP);
        SPatron(NP)=SPatron(NP+1);
        SPatron(NP+1)=int;
        NP=1;
    else
        
        NP=NP+1;
    end
end

Salida=zeros(1,length(M)/8);

for NP=1:1:length(M)/8
    for j=1:1:8
        Salida(NP)=Salida(NP)+SPatron(j+(NP-1)*8)*pow2(j-1);
    end
end
