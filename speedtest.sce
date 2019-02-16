data2 = read("/media/red/Transcend/AAAULTIMATELABA4/LOGS2/log_pi2x.txt",-1,3)
data2(:,1) = data2(:,1)

clf();   f=gcf();

plot2d(data2(:,2), data2(:,1),2)
plot2d(B.time,B.values, 5)

xlabel('$t, с$', "fontsize", 4)
ylabel('$\omega, рад/с$', "fontsize", 4)
//f.children.children(1).children.thickness = 2;
hl=legend(['Эксперимент';'Модель'], "in_lower_right");
