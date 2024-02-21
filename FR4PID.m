function [Kc,tauI,tauD] = FR4PID(beta,taucl,w1,w2,Gjw1,Gjw2,K)

j = sqrt(-1);

Sujw1 = (j * w1 * taucl/beta + 1) / (K * (j * w1 * taucl +1 ));
Sujw2 = (j * w2 * taucl/beta + 1) / (K * (j * w2 * taucl +1 ));


Tjw1 = Sujw1 * Gjw1;
Ljw1 = Tjw1 / (1-Tjw1);

Tjw2 = Sujw2 * Gjw2;
Ljw2 = Tjw2/(1-Tjw2);

Xjw1 = j * w1 * Ljw1 / Gjw1;
Xjw2 = j * w2 * Ljw2 / Gjw2;

c1 = imag(Xjw1)/w1 ;

c2 =  -(real(Xjw2)-real(Xjw1))/(w2^2-w1^2);

c0 = c2*w1^2+real(Xjw1);

Kc = c1;
tauI = c1/c0;
tauD = c2/c1;