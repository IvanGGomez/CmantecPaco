function [Datos,NumVeces,Neurona,NumPat]=eliminar_Patrones_P(Datos,Parameter,NumVeces,Neurona)

[a,b]=size(Datos.Supr);
media=mean(NumVeces);
desviacion_estandar=std(NumVeces);
calculo=media+Parameter.Fi*desviacion_estandar;
%NumVeces

PatronesAEliminar=find(NumVeces(:)>calculo);


   
for x=length(PatronesAEliminar):-1:1
    Datos.Supr(a+x,:)=Datos.Train(PatronesAEliminar(x),:);
    Datos.Train(PatronesAEliminar(x):1:end-1,:)=Datos.Train(PatronesAEliminar(x)+1:1:end,:);
    Datos.Train(end,:)=[];
end

[NumPat,NEntradas]=size(Datos.Train);

NumVeces=zeros(1,NumPat);

Neurona(:,1)=0;%It
Neurona(:,2)=1;%Tfac
Neurona(:,3)=1;%S