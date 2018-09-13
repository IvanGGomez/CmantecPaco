function Dibuja_Red3D_P(EPatron,SPatron,PesosW)

[NPat,NEnt]=size(EPatron);
[NNeu,NEn]=size(PesosW);

figure(1);
hold off;
for n=1:1:NPat
   
    if SPatron(n)==0
        plot3(100*EPatron(n,2)+21,100*EPatron(n,1)+21,EPatron(n,3),'ro','MarkerSize',10);hold on;
    else
        plot3(100*EPatron(n,2)+21,100*EPatron(n,1)+21,EPatron(n,3),'g*','MarkerSize',10);hold on;
    end
end

plot3(21:1:121,21,0,'-k.');hold on;
plot3(21:1:121,21,1,'-k.');hold on;
plot3(21:1:121,121,0,'-k.');hold on;
plot3(21:1:121,121,1,'-k.');hold on;

plot3(21,21:1:121,1,'-k.');hold on;
plot3(21,21:1:121,0,'-k.');hold on;
plot3(121,21:1:121,1,'-k.');hold on;
plot3(121,21:1:121,0,'-k.');hold on;

plot3(21,21,0:0.01:1,'-k.');hold on;
plot3(21,121,0:0.01:1,'-k.');hold on;
plot3(121,21,0:0.01:1,'-k.');hold on;
plot3(121,121,0:0.01:1,'-k.');hold on;



X=-0.2:0.01:1.2;
Y=-0.2:0.01:1.2;

for n=1:1:NNeu
for i=1:1:length(X)
    for j=1:1:length(Y)
        A=-(PesosW(n,1)*X(i)+PesosW(n,2)*Y(j)+PesosW(n,4))/PesosW(n,3);
        if A>1.5
            B(i,j)=NaN;
            %B(i,j)=1.4;
        elseif A<-0.5
            B(i,j)=-NaN;
            %B(i,j)=-0.5;
        else
            B(i,j)=A;
        end
    end
end

hold on;
surf(B);hold on;
end
set(gca,'XTick',21:100/1:121); 
set(gca,'XTickLabel',0:1/1:1);
set(gca,'YTick',21:100/1:121); 
set(gca,'YTickLabel',0:1/1:1);
set(gca,'ZTick',0:1:1);
axis([0 140 0 140 -0.5 1.5]);

