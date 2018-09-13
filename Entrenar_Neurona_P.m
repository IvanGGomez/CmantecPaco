function [PesosW,Neurona] = Entrenar_Neurona_P(EPatron,SPatron,PesosW,Neurona,x)

PesosW(x,:)=PesosW(x,:)+(SPatron-Neurona(x,3))*[EPatron 1]*Neurona(x,2);%Incremento de los pesos
Neurona(x,1)=Neurona(x,1)+1;%Se incrementa it


