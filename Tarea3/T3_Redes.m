close all;
nEMIN=50;
ventana=3;
slot=5e-2;
col=0;
n=0;
nta=0;
ntb=0;
p=.005 ;
tic
while col <=nEMIN
    a=(rand(1,ventana/slot)<p);
    b=(rand(1,ventana/slot)<p);
    nta=sum(a)+nta;
    ntb=sum(b)+ntb;
    col=col+a*b';
    tErra=col/nta;
    tErrb=col/ntb;
    
    plot(n*ventana,tErra,'+b');
    hold on;
    plot(n*ventana,tErrb,'.g');
    n=n+1; 
end
toc
A=sprintf('La tasa de llegada de tramas de A a C es de : %0.3f',1-tErra);
B=sprintf('La tasa de llegada de tramas de B a C es de : %0.3f',1-tErrb);
A
B