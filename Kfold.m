
function Datos=Kfold(K,Data,i)


[a,b]=size(Data);

Index=fix(a/K);

Datos.Tests=Data((Index*(i-1))+1:Index*i,:);
    
Datos.Train=[Data(1:Index*(i-1),:);Data(Index*i+1:a,:)];

 
    
    
    
    