%��˹�˺���������sȡ0.5��dimensionΪά��
%����data1��i)��data��2���������
function [K] = Gaussian(data1,i,data2,j,dimension)

s=0.5;
k=1;
d=0;
while(k<=dimension)
d=d+(data1(i,k)-data2(j,k))^2;
k=k+1;
end

K=exp(-d/s);

end

