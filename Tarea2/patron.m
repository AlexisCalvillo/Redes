function [output] = patron(B)
    A=[1 1];
    tamano = length(B) - length(A) + 1;
    match = 0;
    for i = 1:tamano
        match = all(B(i:i-1+length(A)) == A);
        if(match==1)
            B(i+1)=0;
            i=i+1;
        end
    end
    output=B;
end