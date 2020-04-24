%% 样本1功率谱
a=load('Subject1.mat');
a=a.Subject1;
A1=[];
B1=[];

for j=1:240
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A1=[A1,pxxsum];

    end
        
    B1(:,:,j)=A1;
    
    A1=[];


end
subject1_psd=permute(B1,[3,1,2]);


%%样本2功率谱
b=load('Subject2.mat');
b=b.Subject2;
t=(1:2000)/200;
A2=[];
B2=[];

for j=1:240
    
    x_temp=b(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);

        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A2=[A2,pxxsum];
        
    end
        
    B2(:,:,j)=A2;
    
    A2=[];


end
subject2_psd=permute(B2,[3,1,2]);





%%样本3功率谱
c=load('Subject3.mat');
c=c.Subject3;
A3=[];
B3=[];

for j=1:240
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A3=[A3,pxxsum];

    end
        
    B3(:,:,j)=A3;
    
    A3=[];


end
subject3_psd=permute(B3,[3,1,2]);

%%样本4功率谱
d=load('Subject4.mat');
d=d.Subject4;
A4=[];
B4=[];

for j=1:240
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A4=[A4,pxxsum];

    end
        
    B4(:,:,j)=A4;
    
    A4=[];


end
subject4_psd=permute(B4,[3,1,2]);

%%样本5功率谱
e=load('Subject5.mat');
e=e.Subject5;
A5=[];
B5=[];

for j=1:240
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A5=[A5,pxxsum];

    end
        
    B5(:,:,j)=A5;
    
    A5=[];


end
subject5_psd=permute(B5,[3,1,2]);

%%样本6功率谱
f=load('Subject6.mat');
f=f.Subject6;
A6=[];
B6=[];

for j=1:240
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx1=pxx(1:30,1);
        pxx2=pxx(31:70,1);
        pxx3=pxx(71:150,1);
        pxx4=pxx(151:310,1);
        pxx5=pxx(311:500,1);
        sum1=sum(pxx1);
        sum2=sum(pxx2);
        sum3=sum(pxx3);
        sum4=sum(pxx4);
        sum5=sum(pxx5);
        pxxsum=[sum1,sum2,sum3,sum4,sum5]';
        A6=[A6,pxxsum];

    end
        
    B6(:,:,j)=A6;
    
    A6=[];


end
subject6_psd=permute(B6,[3,1,2]);