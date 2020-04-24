tic;
clear all;
close all;
clc;

% 读取数据
load wine.mat


% 训练集
data = train;
% data=reshape(data,720,[]);
label=train_label;
model = svmtrain(label,data);

% 测试集合
testdata=test;
% testdata=reshape(testdata,720,[]);
testdatalabel=test_label;

% 训练
[predicted_label1] = svmpredict(label,data,model);

% 预测
[predicted_label2] = svmpredict(testdatalabel,testdata,model);


toc;