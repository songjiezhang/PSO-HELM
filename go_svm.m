tic;
clear all;
close all;
clc;

% ��ȡ����
load wine.mat


% ѵ����
data = train;
% data=reshape(data,720,[]);
label=train_label;
model = svmtrain(label,data);

% ���Լ���
testdata=test;
% testdata=reshape(testdata,720,[]);
testdatalabel=test_label;

% ѵ��
[predicted_label1] = svmpredict(label,data,model);

% Ԥ��
[predicted_label2] = svmpredict(testdatalabel,testdata,model);


toc;