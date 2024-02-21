function [thetaCurrent,n,N] = FSFRelay(u,y)

L=length(u);
u=u-mean(u);
y=y-mean(y);

Ujw=fft(u);
[n1,m1]=max(abs(Ujw));
P1=m1;
N=round(L/(P1-1));

n=7;

alpha=exp(1i*2*pi/N);
beta=1;
for i=1:N-1
    beta=[beta alpha^i];
end

zeta = beta.^0 ;

for i=1:(n-1)/2
    zeta=[zeta; beta.^i];
end

U_input=zeros(N,1);
for kk=1:N
    Pt=zeta*U_input/N;
    Pn=Pt(1);
for i=2:(n+1)/2
    Pn=[Pn;Pt(i);conj(Pt(i))];
end
    Ps(:,kk)=Pn;
    U_input=[u(kk);U_input(1:N-1,1)];
end

    M=inv(Ps(:,1:N)*Ps(:,1:N)');
    thetaPast=M*Ps(:,1:N)*y(1:N);
    P_ls=M;


    lam=1;

for k=N+1:length(y)-1

    U_input=[u(k);U_input(1:N-1,1)];
    Pt=zeta*U_input/N;
    Pn=Pt(1);
for i=2:(n+1)/2
    Pn=[Pn;Pt(i);conj(Pt(i))];
end

eCu=y(k)-Pn'*thetaPast;

thetaCurrent=thetaPast+P_ls*Pn*eCu/(lam+Pn'*P_ls*Pn);
P_ls=(1/lam)*(P_ls-P_ls*Pn*Pn'*P_ls/(lam+Pn'*P_ls*Pn));

thetaPast=thetaCurrent;
end