function [PesosW,Neurona]=Nueva_Neurona_P(PesosW,Neurona)




[i,j]=size(PesosW);
PesosW(i+1,:)=0;

[x,y]=size(Neurona);

Neurona(x+1,1)=0;%Se añade una nueva neurona

Neurona(:,1)=0;%It
Neurona(:,2)=1;%Tfac
Neurona(:,3)=1;%S
