%Задание 1
Rangs=[1,3,6,4,2,5]
Par=zeros(6,6)
for i=1:6
for j=1:6
if(Rangs(i)<Rangs(j))
Par(i,j)=0
else
Par(i,j)=1
end
end
end

P=ones(6,1)
for it=1:3
P=Par*P;
end
disp('Итеративная  сила критериев: ')
disp(P)
sumP=sum(P);
for t=1:6
    P(t)=P(t)/sumP;
end
disp('Значимость критериев: ');
disp(P)
plot(P)

%Задание 2 

kves = [0.4,0.2,0.35,0.2;
         0.2,0.4,0.2,0.5;
         0.15,0.3,0.25,0.2;
         0.25,0.1,0.2,0.1]

matrixExp = kves;

T = 0;

for i = 1:4
    c = kves(:,i);
    sorted = sort(c);
    col = tabulate(sorted);

    val = col(:,1); 
    count = col(:,2);
    leng = length(val); 

    num = 1;
    weight = matrixExp(:,i); 
    for j = 1:leng
        
        num  = ceil(num);

        if count(j)>1
            num = sum(num:(count(j)+num-1)) / count(j);
            weight(weight == val(j)) = num;

            T = T + (count(j)^3 - count(j));

        else
            weight(weight == val(j)) = num;
            num = num + 1; 
        end


    end
    matrixExp(:,i) = weight;
end

S(4) = sum(matrixExp(4,:));

FullS = sum(S);
d = sum((S-(FullS/4)).^2);

Sogl = 12 * d / (4^2 * (4^3 - 4) - 4 * T);

disp(matrixExp);
disp(Sogl);