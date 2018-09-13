function Dibuja_Red2A_P(EPatron,SPatron,EPatronSpur,SPatronSpur,PesosW)
figure(1);

[NPat,NEnt]=size(EPatron);
[NNeu,NEn]=size(PesosW);
[NPatS,NEntS]=size(EPatronSpur);

X=-1:01:2;
for n=1:1:NNeu
Y(n,:)=-(PesosW(n,1)*X+PesosW(n,3))/PesosW(n,2);
plot(X,Y(n,:));hold on;
end
axis([-1, 2, -1, 2])


for n=1:1:NPat
    if SPatron(n)==0
        plot(EPatron(n,1),EPatron(n,2),'ro');hold on;
    else
        plot(EPatron(n,1),EPatron(n,2),'gx');hold on;
    end
axis([-1, 2, -1, 2])
end

for n=1:1:NPatS
    if SPatronSpur(n)==0
        plot(EPatronSpur(n,1),EPatronSpur(n,2),'bo');hold on;
    else
        plot(EPatronSpur(n,1),EPatronSpur(n,2),'bx');hold on;
    end
axis([-1, 2, -1, 2])
end
hold off;