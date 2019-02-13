data1 = read("D:\AAAULTIMATELABA3\data\PID\log4.txt",-1,3)
data1(:,1) = data1(:,1)

plot(data1(:,2), data1(:,1))
plot(A.time,A.values, "r-.")
