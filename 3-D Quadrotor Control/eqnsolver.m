function X = eqnsolver(t1,t2,t3,t4,waypoints)
matrixA = @Amatrix;
matrixB = @Bmatrix;
N6 = zeros(6,8);
N3 = zeros(3,8);
N1 = zeros(1,8);
I1 = [1,zeros(1,7)];
A1 = matrixA(t1,6);
A2 = matrixA(t2,6);
A3 = matrixA(t3,6);
A42 = matrixA(t4,3);
B1 = matrixB(t1);
B2 = matrixB(t2);
B3 = matrixB(t3);
B4 = matrixB(t4);
C = zeros(6,6);
j = 1;
for i = 1:6
    C(j) = factorial(i);
    j = j+7;
end
C = [zeros(6,1),C,zeros(6,1)];
C3 = zeros(3,3);
j = 1;
for i = 1:3
    C3(j) = factorial(i);
    j = j+4;
end
C3 = [zeros(3,1),C3,zeros(3,4)];
A = [A1,-C,N6,N6;N6,A2,-C,N6;N6,N6,A3,-C;C3,N3,N3,N3;N3,N3,N3,A42;I1,N1,N1,N1;B1,N1,N1,N1;N1,I1,N1,N1;N1,B2,N1,N1;N1,N1,I1,N1;N1,N1,B3,N1;N1,N1,N1,I1;N1,N1,N1,B4];
B = zeros(24,1);
B = [B;waypoints];
X = linsolve(A,B);


    



