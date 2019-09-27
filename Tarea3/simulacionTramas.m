function simulacionTramas(k,te)
close all;
%Tramas ntre 5 y 10
%Contenido entre 0 y 255
%Inicio y fin es 7 y 127 respectivamente
%Byte Stuffing
longitudesSBS=zeros(1,k);
numErrPT=zeros(1,k);
longitudesCBS=zeros(1,k);
conError=0;
for i=1:k
    lo=randi([5,10]);
    trO=[7, randi(255,1,lo),127];
    trE=[rand(1,lo+2+sum(trO==7)+sum(trO==127))<te];
        
    %Longitudes tramas si n BS
    longitudesSBS(i)=lo+2;
    %Longitudes tramas con BS
    longitudesCBS(i)=lo+2+sum(trO==7)+sum(trO==127);
    
    %Nùmero de bytes erroneos por trama
    numErrPT(i)=sum(trE);
    
   if(sum(trO==7)+sum(trO==127)==2)
       if((trE(1)|trE(2))&&(trE(lo+2+sum(trO==7)+sum(trO==127))|trE(lo+1+sum(trO==7)+sum(trO==127))))
           conError=conError+1;
       end
   end
end
mean(longitudesCBS);
figure(1);
histogram(longitudesSBS), title(sprintf('Histograma de distribución de longitudes de tramas \n antes del Byte Stuffing'));

figure(2);
histogram(longitudesCBS),title(sprintf('Histograma de distribución de longitudes de tramas \n después del Byte Stuffing'));

figure(3);
%Longitud fija de la trama
lt=14;
%Se queda con los valores de aquellas trama cuya longitud sea la indicada
a=(longitudesCBS==lt).*numErrPT;
b=(longitudesCBS==9).*numErrPT;
%Histograma con el histograma de errores de una trama con longitud mínima
subplot(1,2,1);
histogram(b,'BinEdges',[1,2,3,4,5,6,7,8,9,10,11,12]),
title(sprintf('Histograma de errores \n con tramas de longitud %d',9));
%Histograma con el histograma de errores de una trama con longitud fija
subplot(1,2,2);
histogram(a,'BinEdges',[1,2,3,4,5,6,7,8,9,10,11,12]),
title(sprintf('Histograma de errores \n con tramas de longitud %d',lt));
%Nùmero de errores total
numTotErr=sum(numErrPT);
txt=sprintf('El número total de bytes erróneos es %d',numTotErr);
display(txt);
%Nùmero de tramas que contienen al menos un error. 
numTotAL1=sum(numErrPT>=1);
txt=sprintf('El número total de tramas que contienen al menos un error es %d',numTotAL1);
display(txt);
%Nùmero de tramas identificadas correctamente
conError;
txt=sprintf('Número total de tramas identificadas correctamente es %d',k-conError);
display(txt);
%Nùmero total de tramas descartadas
k-conError;
txt=sprintf('Número total de tramas descartadas es %d',conError);
display(txt);
%Tasa de tramas descartadas
(k-conError)/k;
txt=sprintf('Tasa de tramas descartadas %2.4f',1-(k-conError)/k);
display(txt);
