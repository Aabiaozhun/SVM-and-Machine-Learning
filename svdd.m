% N�ǵ���ѵ�������ĸ�����d���������Ե�ά��
[N,d]=size(data1);
% �ж�ϣ��ѵ����ά���Ƿ�С�ڻ����������ά�ȣ������ǣ��򱨴�
if(dimension>d)
    disp('dimension is over the size!');
else
 
% �������SMO�㷨

%��a[]���г�ʼ����a�Ƕ�ż����ı�������N������Ϊ1����ʼ��Ϊ1/N
a=linspace(1/N,1/N,N);

% �����ݶȹ�ʽ������a[]�ĳ�ʼ������ݶ�g�ĳ�ʼ����g��i)�Ƕ�ż�����Ŀ�꺯����a��i)��ƫ����
i=1;
while(i<=N)
g(i)=Gaussian(data1,i,data1,i,dimension);
i=i+1;
end
i=1;
j=1;
while(i<=N)
while(j<=N)
g(i)=g(i)-a(j)*Gaussian(data1,i,data1,j,dimension);
j=j+1;
end
g(i)=g(i)-a(i)*Gaussian(data1,i,data1,i,dimension);
j=1;
i=i+1;
end

%��ż����a[]�ı߽�����C��������飬��Ϊ0.25�ȽϺ���
C=0.25;
%ȡ�ݶ������ݶ���С��g
[gmax,i]=max(g);
[gmin,j]=min(g);
%deltaΪԼ������
delta=gmax-gmin;
%ѭ������count����ֹ��ѭ��
count=0;
%LΪSMO�㷨�Ĳ���
L=0;
while(delta>=0.0000001&&count<2000)
L3=[C-a(i) a(j) (g(i)-g(j))/(Gaussian(data1,i,data1,i,dimension)+Gaussian(data1,j,data1,j,dimension)-2*Gaussian(data1,i,data1,j,dimension))];
L=min(L3);
k=1;
%ÿ�ε�����SMO���ݶ�g[]���и���
while(k<=N)
g(k)=g(k)-L*Gaussian(data1,k,data1,i,dimension)+L*Gaussian(data1,k,data1,j,dimension);
k=k+1;
end
%a[]Ҳ������Ӧ�ĸ���
a(i)=a(i)+L;
a(j)=a(j)-L;
%IDi��IDj�ֱ�������<C��>0������a�ļ���
IDi=find(a<C-eps);
IDj=find(a>eps);
%��IDi��ѡȡ�ݶ����ģ���IDj��ѡȡ�ݶ���С��
[gmax,IDix]=max(g(IDi));
i=IDi(IDix(1));
[gmin,IDjx]=min(g(IDj));
j=IDj(IDjx(1));
%�����������ж�
delta=gmax-gmin;
count=count+1;
end
end