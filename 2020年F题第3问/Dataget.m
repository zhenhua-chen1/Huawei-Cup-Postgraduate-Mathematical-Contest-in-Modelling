function Dataget()
 data1=xlsread('附件1-飞行器参数');
 data31=xlsread('附件4-问题3数据','发动机耗油数据');
 data32=xlsread('附件4-问题3数据','飞行器理想质心');
 pos_i=data1(1:6,1:3);%油箱坐标
 size_i=data1(1:6,4:6);%油箱尺寸
 origin_i=data1(1:6,7);%初始油量
 origin_i=[1.5*0.9*0.3;2.2*0.8*1.1;2.4*1.1*0.9;1.7*1.3*1.2;2.4*1.2*1;2.4*1*0.5];
 U_i=data1(17:22,2);%最大供油速度
 rho=850;%燃油密度kg/m^3
 consum_eng=data31(:,2);%发动机消耗油量
 c2_t=data32(:,2:4);%飞行器理想质心
 T=7200;%总时间
 box=6;%油箱总数
 sig=[2,3,4,5];
 dou=[1,2;1,3;1,4;1,5;2,3;2,4;2,5;6,2;3,4;3,5;6,3;4,5;6,4;6,5];
 tri=[1,2,3;1,2,4;1,2,5;1,2,6;1,3,4;1,3,5;1,3,6;1,4,5;1,4,6;6,5,1;6,2,3;6,2,4;6,5,2;6,3,4;6,5,3;6,5,4];
 save data
end