clear all;
close all;
clc;
load wine.mat

 traindata=train;
%  traindata=reshape(traindata,480,[]);
 trainlabel=train_label;
 testdata=test;
%  testdata=reshape(testdata,960,[]);
 testlabel=test_label;

predict_label = knnclassify(testdata, traindata,trainlabel);
accuracy = length(find(predict_label == testlabel))/length(testlabel)*100;