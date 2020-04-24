a=load('train.mat');
% save('Subject1.txt','-ASCII');
a=a.train;
A1=[];
B1=[];

for j=1:960
    
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
        
        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx=pxx(1:500,1);
        A1=[A1,pxx];
        
    end
        
    B1(:,:,j)=A1;
    
    A1=[];


end
train_psd=permute(B1,[3,1,2]);



b=load('test.mat');
% save('Subject1.txt','-ASCII');
b=b.test;
t=(1:2000)/200;
A2=[];
B2=[];

for j=1:480
    
%     x_temp=permute(a(:,:,j),[1 2 3]);
    x_temp=a(:,:,j);
    
    for i=1:32
        x=x_temp(i,:,:);
%         x=permute(x_temp(i,:,:),[3 1 2]);
        % x=permute(1,1,1:2000)';
        %1-50HZ的滤波器
%         hd = design(fdesign.bandpass('N,F3dB1,F3dB2',8,1,50,200),'butter');
%         x = filter(hd,x);


        %求功率谱
        window=hann(2000); %汉宁窗 
        Fs=200;
        % nfft=10000;
        % range='half'; %频率间隔为[0 Fs/2]，只计算一半的频率
        [pxx,g]=pwelch(x,window,100,2000,Fs);
        pxx=pxx(1:500,1);
        A2=[A2,pxx];
        
    end
        
    B2(:,:,j)=A2;
    
    A2=[];


end
test_psd=permute(B2,[3,1,2]);
