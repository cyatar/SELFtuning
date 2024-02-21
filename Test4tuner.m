num = 0.6*[-6 1];
den = conv([3 1],[2 1]);
d = 1;
Ra = 1;
epsilon =  0.001;
Deltat = 0.05;
Tsim = 400;
Nsim = Tsim / Deltat;

%%

u = get(out,"u");
y = get(out,"y");
e = get(out,"e");


[thetaCurrent,n,N] = FSFRelay(u,-e);
                                                                                                                                                                                                                                                                                                                                                                                                                                               
w1=2*pi/(N*Deltat);
w2=6*pi/(N*Deltat);
Gjw1=thetaCurrent(3);
Gjw2=thetaCurrent(7);
K = abs(Gjw1);

beta=2;
taucl=beta*0.1*N*Deltat;

[Kc,tauI,tauD]=FR4PID(beta,taucl,w1,w2,Gjw1,Gjw2,K);