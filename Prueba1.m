clear; 
Gfac=0.05;
clc;

EPatron=[0 0 0; 0 0 1;0 1 0;0 1 1;1 0 0; 1 0 1;1 1 0;1 1 1];
SPatron=[0 1 1 0 1 0 0 1];

%EPatron=[0 0 ; 0 1;1 0 ;1 1];
%SPatron=[0 1 1 0];


[NPatrones,NEntradas]=size(EPatron);
PesosW(1,NEntradas+1)=0;

[PesosW,Neurona]=Nueva_Neurona_P(PesosW,0);

i=1;
while (i<=NPatrones)
    
    [Mayoria,Neurona]= Estimular_red_P(EPatron(i,:),PesosW,Neurona);
    %SPat=SPatron(i);
    if Mayoria~=SPatron(i)
        [MaxTfac,NumNeurona]=MaxT_NumN_P(Neurona,SPatron(i));
        if MaxTfac<Gfac
            [PesosW,Neurona]=Nueva_Neurona_P(PesosW,Neurona);
            [NuNe,NI]=size(Neurona);
            NumNeurona=NuNe;
        end
        [PesosW,Neurona]=Entrenar_Neurona_P(EPatron(i,:),SPatron(i),PesosW,Neurona,NumNeurona);
        i=0;
    end
    i=i+1;
end
PesosW

PesosW=[746 800 -2293 -531;-2151 1218 412 815;2318 -2666 2563 -1528]

%Dibuja_Red2D_P(NPatrones,EPatron,SPatron,Neurona,PesosW);
Dibuja_Red3D_P(NPatrones,EPatron,SPatron,Neurona,PesosW);




