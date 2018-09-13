function Dibuja_Red2D_P(EPatron,SPatron,PesosW)
[NPat,NEnt]=size(EPatron);
[NNeu,NEn]=size(PesosW);

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


