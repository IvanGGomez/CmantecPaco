function [PesosW]=CMantec_P_B(EPatron,SPatron)

CA=clock;
[NPatrones,NEntradas]=size(EPatron);
PesosW(1,NEntradas+1)=0;
NumVeces(NPatrones)=0;

Gfac=0.01;
itmax=16000;
To=NEntradas;
b=To/itmax;
Fi=2;

Neurona(1,1)=0;%It
Neurona(1,2)=To;%T
Neurona(1,3)=1;%Tfac
Neurona(1,4)=To;%To
Neurona(1,5)=b;%b
Neurona(1,6)=1;%S

i=1;
Ale=randperm(NPatrones);
while (i<=NPatrones)
    
    [Mayoria,Neurona]= Estimular_red_P(EPatron(Ale(i),:),PesosW,Neurona);
    
    if Mayoria~=SPatron(Ale(i)) 
        [MaxTfac,NumNeurona]=MaxT_NumN_P(Neurona,SPatron(Ale(i)));
        NumVeces(Ale(i))=NumVeces(Ale(i))+1;
        if MaxTfac<Gfac
            [PesosW,Neurona]=Nueva_Neurona_P(PesosW,Neurona)
            [NuNe,NI]=size(Neurona);
            NumNeurona=NuNe;
            %[EPatron,NumVeces,NPatrones]=eliminar_Patrones_P(EPatron,Fi,NumVeces);
            CN=clock;
            TiempoN=CN-CA
        end
        [PesosW,Neurona]=Entrenar_Neurona_P(EPatron(Ale(i),:),SPatron(Ale(i)),PesosW,Neurona,NumNeurona);
        Ale=randperm(NPatrones);
        i=0;
    end
    i=i+1;
end
CB=clock;
Tiempo=CB-CA
PesosW;
NPatrones;

%PesosW=[ -5484 -4925 4255 ;-1794 -2653 1393 ;1556 2534 -1522 ;621 1176 -1090 ;];


if NEntradas==2
    Dibuja_Red2D_P(NPatrones,EPatron,SPatron,Neurona,PesosW);
elseif (NEntradas==3)&&(NPatrones<=25)
    Dibuja_Red3D_P(NPatrones,EPatron,SPatron,Neurona,PesosW);
end




