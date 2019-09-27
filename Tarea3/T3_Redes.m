nEMIN=50;
ventana=1;
slot=5e-2;
col=0;
n=0;
nta=0;
ntb=0;
p=.005;
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
