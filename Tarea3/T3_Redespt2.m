close all;
nEMIN=5000;
ventana=1;
slot=5e-2;
colab=0;
colbc=0;
n=0;
nta=0;
ntb=0;
ntc=0;
p=.5;
tic
while colab + colbc <=nEMIN
    a=(rand(1,ventana/slot)<p);
    a=patron(a); %Quitamos secuencia 1 1
    b=(rand(1,ventana/slot)<p);
    c=[0 a(1:ventana/slot-1).*(~b(1:ventana/slot-1))];
    nta=sum(a)+nta;
    ntb=sum(b)+ntb;
    ntc=ntc+sum(c);
    colab=colab+a*b';
    colbc=colbc+c*b';
    tErra=col/nta;
    tLlegadaBC=(ntb-colbc-colab)/ntb;
    tLlegadaAC=(nta-colab)/nta;
    
    plot(n*ventana,tLlegadaAC,'+b');
    hold on;
    plot(n*ventana,tLlegadaBC,'.g');
    n=n+1; 
end
toc