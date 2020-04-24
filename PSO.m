%% 清空环境
clc
clear
load test23456.mat

N1=50;
N2=50;
N3=500;
train_x = train;
train_x=reshape(train_x,240,[]);
train_y = train_label_helm;
test_x=test;
test_x = reshape(test_x,1200,[]);
test_y = test_label_helm;
rand('state',67797325)   % 12000

acc=[];

b1=2*rand(size(train_x,2)+1,N1)-1;
b2=2*rand(N1+1,N2)-1;
b3=orth(2*rand(N2+1,N3)'-1)';

% [train,pstrain] = mapminmax(train');
% pstrain.ymin = 0;
% pstrain.ymax = 1;
% [train,pstrain] = mapminmax(train,pstrain);
% [test,pstest] = mapminmax(test');
% pstest.ymin = 0;
% pstest.ymax = 1;
% [test,pstest] = mapminmax(test,pstest);
% train = train';
% test = test';

%% 参数初始化
%粒子群算法中的两个参数
c1 = 1.6; % c1 belongs to [0,2]
c2 = 1.5; % c2 belongs to [0,2]
maxgen=6;   % 进化次数 
sizepop=500;   % 种群规模
popsmax=1.1;
popsmin=0.1;
popcmax=2^(-30)+2^(-31);
popcmin=2^(-31);
k = 0.6; % k belongs to [0.1,1.0];
Vsmax = k*popsmax;
Vsmin = -Vsmax ;
Vcmax = k*popcmax;
Vcmin = -Vcmax ;
% % SVM参数初始化 
% v = 3;
%% 产生初始粒子和速度
for i=1:sizepop
    % 随机产生种群
    pop(i,1) = (popsmax-popsmin)*rand+popsmin;    % 初始种群
    pop(i,2) = (popcmax-popcmin)*rand+popcmin;
    V(i,1)=Vsmax*rands(1);  % 初始化速度
    V(i,2)=Vcmax*rands(1);
    s=pop(i,1);
    c=pop(i,2);
%     cmd=[  pop(i,1)  ,  pop(i,2) ];
    fitness(i)= pso_helm_train(s,c);
end
% 找极值和极值点
[global_fitness bestindex]=min(fitness); % 全局极值
local_fitness=fitness;   % 个体极值初始化
global_x=pop(bestindex,:);   % 全局极值点
local_x=pop;    % 个体极值点初始化
tic
%% 迭代寻优
for i=1:maxgen
   
    for j=1:sizepop
       
        %速度更新
        wV = 0.9; % wV best belongs to [0.8,1.2]
        V(j,:) = wV*V(j,:) + c1*rand*(local_x(j,:) - pop(j,:)) + c2*rand*(global_x - pop(j,:));
        if V(j,1) > Vsmax
            V(j,1) = Vsmax;
        end
        if V(j,1) < Vsmin
            V(j,1) = Vsmin;
        end
        if V(j,2) > Vcmax
            V(j,2) = Vcmax;
        end
        if V(j,2) < Vcmin
            V(j,2) = Vcmin;
        end
       
        %种群更新
        wP = 0.6;
        pop(j,:)=pop(j,:)+wP*V(j,:);
        if pop(j,1) > popsmax
            pop(j,1) = popsmax;
        end
        if pop(j,1) < popsmin
            pop(j,1) = popsmin;
        end
        if pop(j,2) > popcmax
            pop(j,2) = popcmax;
        end
        if pop(j,2) < popcmin
            pop(j,2) = popcmin;
        end
       
        % 自适应粒子变异
        if rand>0.5
            k=ceil(2*rand);
            if k == 1
                pop(j,k) = (20-1)*rand+1;
            end
            if k == 2
                pop(j,k) = (popcmax-popcmin)*rand+popcmin;
            end           
        end
       
        %适应度值
        s=pop(j,1);
        c=pop(j,2);
        fitness(j)= pso_helm_train(s,c);
        fitness(j) = -fitness(j);
    end
   
    %个体最优更新
    if fitness(j) < local_fitness(j)
        local_x(j,:) = pop(j,:);
        local_fitness(j) = -fitness(j);
    end
   
    %群体最优更新
    if fitness(j) < global_fitness
        global_x = pop(j,:);
        global_fitness = -fitness(j);
    end
   
    fit_gen(i)=global_fitness;   
    acc=[acc,global_fitness];   
end
toc
%% 结果分析
plot(-fit_gen,'LineWidth',5);
title(['适应度曲线','(参数c1=',num2str(c1),',c2=',num2str(c2),',终止代数=',num2str(maxgen),')'],'FontSize',13);
xlabel('进化代数');ylabel('适应度');
bests = global_x(1)
bestc = global_x(2)
bestCVaccuarcy = -fit_gen(maxgen)
s=bests;
c=bestc;
% cmd = [ bestc , bestg ];
helm_train(train_x,train_y,test_x,test_y,b1,b2,b3,s,c);