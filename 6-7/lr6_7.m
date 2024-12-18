%Задание 1
KPar = [1,3,5;
        1/3,1,3;
        1/5,1/3,1];
sums = sum(KPar);

normKPar = KPar ./ sums;

meanRow = mean(normKPar,2);
disp(sum(meanRow));
subplot(1,2,1);
pie(meanRow,["мощность","обороты","вес"]);
title("Веса критериев");

% power = [];
% torque = [];
% weight = [];
sump=sum(power);
sumt=sum(torque);
sumw=sum(weight);

normPower=power ./ sump;
normTorque=torque ./ sumt;
normWeight=weight ./ sumw;
meanRowPower = mean(normPower,2);
meanRowTorque = mean(normTorque,2);
meanRowWeight = mean(normWeight,2);
soglPower=power*meanRowPower;
nMax1=sum(soglPower);
CI1=(nMax1-3)/2;
RI1=1.98/3;
CR1=CI1/RI1;
disp("CI: "+CI1);
disp("RI: "+RI1);
disp("CR: "+CR1);
soglTorque=torque*meanRowTorque;
nMax2=sum(soglTorque);
CI2=(nMax2-3)/2;
RI2=1.98/3;
CR2=CI2/RI2;
disp("CI: "+CI2);
disp("RI: "+RI2);
disp("CR: "+CR2);
soglWeight=weight*meanRowWeight;
nMax3=sum(soglWeight);
CI3=(nMax3-3)/2;
RI3=1.98/3;
CR3=CI3/RI3;
disp("CI: "+CI3);
disp("RI: "+RI3);
disp("CR: "+CR3);
meanMat=[meanRowPower,meanRowTorque,meanRowWeight];
result=meanMat*meanRow;
disp(sum(result));
subplot(1,2,2);
pie(result,["Д1","Д2","Д3","Д4","Д5","Д6"]);
title("Веса альтернатив");

%Задание 2
% % KPar2 = [];
% sums2 = sum(KPar2);
% normKPar2 = KPar2 ./ sums2;
% 
% meanRow2 = mean(normKPar2,2);
% disp(sum(meanRow2));
% subplot(1,2,1);
% pie(meanRow2,["Цена","Объем","Качество","Стойкость","Состав","Класс"]);
% title("Вес критериев в процентах");
% 
% % cost=[];
% % volume=[];
% % quality=[];
% % durability=[];
% % compound=[];
% % class=[];
% sumCost=sum(cost);
% sumVolume=sum(volume);
% sumQuality=sum(quality);
% sumDurability=sum(durability);
% sumCompound=sum(compound);
% sumClass=sum(class);
% 
% normCost=cost ./ sumCost;
% normVolume=volume ./ sumVolume;
% normQuality=quality ./ sumQuality;
% normDurability=durability ./ sumDurability;
% normCompound=compound ./ sumCompound;
% normClass=class ./ sumClass;
% 
% meanRowCost=mean(normCost,2);
% meanRowVolume=mean(normVolume,2);
% meanRowQuality=mean(normQuality,2);
% meanRowDurability=mean(normDurability,2);
% meanRowCompound=mean(normCompound,2);
% meanRowClass=mean(normClass,2);
% 
% meanMat2=[meanRowCost,meanRowVolume,meanRowQuality,meanRowDurability,meanRowCompound,meanRowClass];
% result2=meanMat2*meanRow2;
% disp(sum(result2));
% subplot(1,2,2);
% pie(result,["Гель","Палетка","Помада","Тушь","Хайлайтер","Тональный"]);
% title("Веса альтернатив");