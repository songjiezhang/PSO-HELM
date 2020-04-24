load subject_psd.mat;
load('zc_label.mat');
load('pl_label.mat');

a=zc_label;
b=pl_label;
c=cat(1,a,b);
d=cat(1,b,a);

subject1=subject1_psd;
subject2=subject2_psd;
subject3=subject3_psd;
subject4=subject4_psd;
subject5=subject5_psd;
subject6=subject6_psd;


train_label=[a,b]';
test_label=[a,b,a,b,a,b,a,b,a,b]';

train=subject1;
test=cat(1,subject2,subject3,subject4,subject5,subject6);

train_label_helm=[c,d]';
test_label_helm=[c,d,c,d,c,d,c,d,c,d]';