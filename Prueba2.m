clc;
clear; 
NumNeuronas=1;
NumeroEntradas=3;
NumeroPatrones=8;
Tipo=0;
%[EPatron,SPatron]=Patrones(NumeroEntradas,NumeroPatrones,Tipo)
EPatron=[0 0 0; 1 0 0;0 1 0;1 1 0;0 0 1; 1 0 1;0 1 1;1 1 1];
SPatron=[0 0 1 1 0 1 1 1];
%EPatron=[0 0 ;0 1 ;1 0;1 1];
%SPatron=[0 1 1 0];
%EPatron=[0 0;0.5 0; 1 0;0 0.5;0.5 0.5; 1 0.5; 0 1;0.5 1;1 1];
%SPatron=[0 1 0 0 0 0 1 1 1 ];
%EPatron=[0 0;0.8148 0.2584;0.3947 0.8441;0.0809 0.3518;0.1872 0.4726;0.8685 0.9857;0.6264 0.4830;0.2887 0.5212;0.6899 0.9682;0.8865 0.0441]
%SPatron=[0 1 1 1 1 0 1 1 0 1];
%EPatron=[0.7055 0.7273;0.7117 0.1939;0.8977 0.5321;0.1896  0.1692;0.3914 0.7471;0.6877 0.1696;0.3924 0.1748;0.7923 0.6446;0.5113 0.3176;0.3712 0.6991;0.1269 0.9398;0.9094 0.0761;0.5817 0.7065;0.6683 0.1160;0.5875 0.4285];
%SPatron=[0 0 0 1 0 1 0 0 1 1 1 1 0 1 1];
%EPatron=[0.700 1.000 ;0.040 0.910 ;0.810 0.180 ;0.510 0.040 ;0.590 0.070 ;0.870 0.830 ;0.040 0.400 ;0.320 0.510 ;0.730 0.430 ;0.760 0.240 ;0.770 0.320 ;0.850 0.980 ;0.900 0.500 ;0.590 0.880 ;0.990 0.520 ];
%SPatron=[1 1 1 0 0 1 1 0 1 1 0 1 1 1 0];
%EPatron=[0.720 0.260 ;0.610 0.330 ;0.060 0.770 ;0.340 0.300 ;0.910 0.930 ;0.030 0.780 ;0.780 0.280 ;0.930 0.570 ;0.480 0.240 ;0.180 0.480 ;0.580 0.730 ;0.310 0.800 ;0.220 0.950 ;0.730 0.270 ;0.040 0.650 ;];
%SPatron=[0 0 0 0 1 0 1 0 0 0 0 0 0 0 0];
%EPatron=[0.350 0.400 ;0.160 0.640 ;0.050 0.590 ;0.320 0.860 ;0.060 0.410 ;0.070 0.000 ;0.140 0.880 ;0.020 0.200 ;0.420 0.510 ;0.520 0.120 ;0.660 0.120 ;0.830 0.230 ;0.200 0.580 ;0.790 0.180 ;0.260 1.000 ;];
%SPatron=[0 1 1 0 1 0 1 0 0 1 0 1 1 0 0 ];



CA=clock;
[NPatrones,NEntradas]=size(EPatron);
PesosW(NumNeuronas,NEntradas+1)=0;
NumVeces(NPatrones)=0;
EPatronSupr=zeros(0,NEntradas);
SPatronSupr=zeros(0,NEntradas);
Gfac=0.05;
itmax=1000;
To=NEntradas;
b=To/itmax;
Fi=2;

EPatron;
SPatron;
Neurona(NumNeuronas,6)=0;
Neurona(:,1)=0;%It
Neurona(:,2)=To;%T
Neurona(:,3)=1;%Tfac
Neurona(:,4)=To;%To
Neurona(:,5)=b;%b
Neurona(:,6)=1;%S
Neurona
itera=0;
i=1;
Ale=randperm(NPatrones);
while (i<=NPatrones)
    
    [Mayoria,Neurona]= Estimular_red_P(EPatron(Ale(i),:),PesosW,Neurona);
    
    if Mayoria~=SPatron(Ale(i))
        [MaxTfac,NumNeurona]=MaxT_NumN_P(Neurona,SPatron(Ale(i)));
        NumVeces(Ale(i))=NumVeces(Ale(i))+1;
        if MaxTfac<Gfac
            %if mod(itera,2)==1
            Neurona;
            [PesosW,Neurona]=Nueva_Neurona_P(PesosW,Neurona);
            [NuNe,NI]=size(Neurona);
            NumNeurona=NuNe;
            itera=itera+1;
            %else
            NumVeces;
            %[EPatron,SPatron,EPatronSupr,SPatronSupr,NumVeces,NPatrones,Neurona]=eliminar_Patrones_P(EPatron,SPatron,EPatronSupr,SPatronSupr,Fi,NumVeces,Neurona);
            EPatronSupr;
            SPatronSupr;
            itera=itera+1;
            CN=clock;
            TiempoN=CN-CA;
            %end
        end
        [PesosW,Neurona]=Entrenar_Neurona_P(EPatron(Ale(i),:),SPatron(Ale(i)),PesosW,Neurona,NumNeurona);
        Aver=Encontrar_P(PesosW,0.5);
        if Aver==1
            PesosW=PesosW/2;
        end
        
        %Dibuja_Red2A_P(EPatron,SPatron,EPatronSupr,SPatronSupr,PesosW)
        Ale=randperm(NPatrones);
        i=0;
    end
    i=i+1;
end
Neurona
CB=clock;
Tiempo=CB-CA;
EPatron
SPatron
PesosW
NPatrones
EPatronSupr
SPatronSupr



if (NEntradas==2)&&(Tipo==0)
    Dibuja_Red2D_P(EPatron,SPatron,PesosW);
elseif (NEntradas==2)&&(Tipo==1)
    Dibuja_Red2A_P(EPatron,SPatron,EPatronSupr,SPatronSupr,PesosW)
elseif (NEntradas==3)&&(NPatrones<=25)
    Dibuja_Red3D_P(EPatron,SPatron,PesosW);
end