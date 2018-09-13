function [Network]=CMantec_P(Datos,Parameter)

[NumFil,NumCol]=size(Datos.Train);
Datos.Supr=zeros(0,NumCol);
NumPat=NumFil;
NumInp=NumCol-1;

Network=zeros(1,NumInp+1);

Parameter.To=NumInp;

NumVeces=zeros(NumPat,1);

Neurona(1,1)=0;%It
Neurona(1,2)=1;%Tfac
Neurona(1,3)=1;%S

i=1;
A=randperm(NumPat);
while (i<=NumPat)
    Patron=Datos.Train(A(i),1:NumInp);
    Salida=Datos.Train(A(i),NumInp+1);
    [Mayoria,Neurona]= Estimular_red_P(Patron,Network,Neurona,Parameter);
    
    if Mayoria~=Salida 
        [MaxTfac,NumNeurona]=MaxT_NumN_P(Neurona,Salida);
        NumVeces(A(i))=NumVeces(A(i))+1;
        if MaxTfac<Parameter.Gfac
            [Network,Neurona]=Nueva_Neurona_P(Network,Neurona);
           % Tamano=length(Neurona(:,1));
            [Datos,NumVeces,Neurona,NumPat]=eliminar_Patrones_P(Datos,Parameter,NumVeces,Neurona);
        end
        [Network,Neurona]=Entrenar_Neurona_P(Patron,Salida,Network,Neurona,NumNeurona);
        A=randperm(NumPat);
        i=0;
    end
    i=i+1;
    
end

if (NumInp==2)&&(Tipo==0)
    Dibuja_Red2D_P(Datos.Train(:,1:NumInp),Datos.Train(:,NumInp+1),Network);
elseif (NumInp==2)&&(Tipo==1)
    Dibuja_Red2A_P(EPatron,SPatron,EPatronSupr,SPatronSupr,PesosW)
elseif (NumInp==3)&&(NumPat<=25)
    Dibuja_Red3D_P(Datos.Train(:,1:NumInp),Datos.Train(:,NumInp+1),Network);
end


