
function [EPatron,SPatron]=Cargar_Datos_Arduino(Archivo,NumEntradas)

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

