%M�Ǵ����������ĸ���
[M,d]=size(data2);
clear flag;
%ȷ��R
%����RR������������ѵ�����������ĵ�ľ���ƽ����
 k=1;
while(k<=N)
    r2(k)=RR(k,data1,N,a,dimension);
    k=k+1;
end

%ѡȡ֧�������ĵ�ľ���ƽ����ȡƽ����ΪR^2
 IDsv=find(a>eps);
 R2=mean(r2(IDsv));

%���м��飬���ý�������������鹫ʽ�����������R����flag=-1���ų���
%������С��R����flag=1������
k=1;
while(k<=M)
f=Gaussian(data2,k,data2,k,dimension);
i=1;
while(i<=N)
f=f-2*a(i)*Gaussian(data1,i,data2,k,dimension);
i=i+1;
end;
i=1;
j=1;
while(i<=N)
 while(j<=N)
   f=f+a(i)*a(j)*Gaussian(data1,i,data1,j,dimension);
   j=j+1;
 end
 i=i+1;
end

f=R2-f;
flag(k)=sign(f);
k=k+1;
end
%������������
InNum=find(flag>0);
Incount=length(InNum);
fprintf('%d /%d samples is included in the classification.\n',Incount,M);

OutNum=find(flag<0);
Outcount=length(OutNum);
fprintf('%d /%d samples is excluded in the classification.\n',Outcount,M);