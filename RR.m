%����SVDD������ԭ����R^2�Ͷ�ż����a�Ĺ�ϵ�������R^2
%k��aֵС��C��֧�ֱ�����a�����ж�Ӧ���±�
function [ R2 ] = RR( k,data1,N,a ,dimension)
R2=Gaussian(data1,k,data1,k,dimension);
i=1;
while(i<=N)
    R2=R2-2*a(i)*Gaussian(data1,i,data1,k,dimension);
    i=i+1;
end
i=1;
j=1;
while(i<=N)
    while(j<=N)
      R2=R2+a(i)*a(j)*Gaussian(data1,i,data1,j,dimension);
      j=j+1;
    end
    i=i+1;
end

end

