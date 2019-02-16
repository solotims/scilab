data = read("D:\AAAULTIMATELABA4\data\kf\log4.txt",-1,3);   //чтение эксперимента
data(:,1) = data(:,1) / 5.5

aa = [8.0443159  ;2]
global U w
i2 = 5.5
J=0.0025*i2^2; R=5; w=aa(2); ke=0.5*i2; km=0.5*i2; U=aa(1) *km/(J*R)
function e = GG(k,z),   //функция для расчета коэффициентов kf ke и km МНК
    global U w
    e = z(1) - U * (k^2*(1-cos(w*z(3)))+w^2*(1-exp(-k*z(3)))-k*w*sin(w*z(3))) / (k*w*(k^2+w^2))   //для u=Usin(wt)
    //e = z(1) - U*(k*z(3)+exp(-k*z(3))-1)/k^2  //для u = const
endfunction

k0 = [0.1]
binf=[0] //min значения
bsup=[1] //max значения
//[kk, error2] = datafit(GG, data','b',binf,bsup, k0)   //расчет коэффициента kf 
//[kk, error2] = datafit(GG, data', k0)
kk = 21.9834 - 0.15/J
kf=(kk*J*R-ke*km)/R


//проверка аппроксимации построением графика
disp(kf)
t1(:,1) = 0:0.01:10
t1(:,2) = U*(kk^2*(1-cos(w*t1(:,1)))+w^2*(1-exp(-kk*t1(:,1)))-kk*w*sin(w*t1(:,1)))/(kk*w*(kk^2+w^2))
//t1(:,2) = U*(kk*t1(:,1)+exp(-kk*t1(:,1))-1)/kk^2
clf();   
plot(data(:,3), data(:,1))
plot(t1(:,1), t1(:,2), "r-.")
xlabel('$t, с$', "fontsize", 4)
ylabel('$\theta, рад$', "fontsize", 4)
hl=legend(['Эксперимент';'Модель'], "in_lower_right");

