function Probabilidad=Calcular_Prob_P(Network, Datos)

Aciertos=0;
Fallos=0;
[NPatVTest,b]=size(Datos); 
for i=1:NPatVTest
   PatternTests=Datos(i,1:b-1);
   TargetTests=Datos(i,b);
    Mayoria= Estimular_red__Prob_P(PatternTests,Network);
   if Mayoria==TargetTests  
       Aciertos=Aciertos+1;
   else
       Fallos=Fallos+1;
   end  
end

Probabilidad=Aciertos/(Aciertos+Fallos);