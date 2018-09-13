function  [MaxTfac,NumNeurona]=MaxT_NumN_P(Neurona,SPatron)

MayorTfac=0;

for i=1:1:(length(Neurona(:,3)))
    if Neurona(i,3)~=SPatron
        if Neurona(i,2)>MayorTfac
            x=i;
            MayorTfac=Neurona(i,2);
        end
    end
end
MaxTfac=MayorTfac;
NumNeurona=x;
    



