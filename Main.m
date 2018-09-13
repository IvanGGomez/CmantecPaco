clc;
clear;


Data=load('D_Ks_vs_Kp','-mat');
Data=Data.data;
[a,b]=size(Data);
Data2=Data(randperm(a),:);

Parameter.Gfac=0.05;
Parameter.itmax=4000;
Parameter.Fi=2;
Tipo=0;

K=10;



Prob=zeros(1,K);

for i=1:K
i
Datos=Kfold(K,Data2,i);

Network=CMantec_P(Datos,Parameter);

Prob(i)=Calcular_Prob_P(Network, Datos.Tests);

end

ProbMedia=sum(Prob)/K
ProbSTD=std(Prob)



