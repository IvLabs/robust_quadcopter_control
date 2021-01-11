function x = Amatrix(t,m)
x = zeros(m,7);
k = 1;
for i = 0:6
    a = 1;
    b = i+1;
   for j = 1:m
       a = a*b;
       x(k) = a*t^i;
       b = b-1;
       i = i-1;
       k = k+1;
   end
end
x = [zeros(m,1),x];        
    
