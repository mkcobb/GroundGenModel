close all
clc

A = rand(5,5);
b = rand(5,1);

offlineSolution = ((A'*A)^-1)*A'*b;

sim('leastSquaresSolution_th')


error = offlineSolution - onlineSolution.Data(1,:)'
