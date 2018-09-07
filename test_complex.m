clear; clc;
addpath('utilities');
addpath('./matconvnet-1.0-beta24/matlab/');
run ('./matconvnet-1.0-beta24/matlab/vl_setupnn.m');
savepath='./';
noiseSigma  = 15;  %%% image noise level
folderModel = 'model/';
%% read image
load Brain1;
label=Img./max(abs(Img(:)));
if(size(label,3)>1)
    label = rgb2ycbcr(label);
    label=label(:, :, 1);
end
[H,W,Z]=size(label);
%     [label,isConsis]=Consistency(label);
randn('seed',0);
s=size(label);
level=noiseSigma*max(abs(label(:)))/100;
n1=level*randn(s)+real(label);
n2=level*randn(s)+imag(label);
input=sqrt(n1.^2+n2.^2);
PSNR=[];
SSIM=[];
%% main
tic;
    use_gpu = 1;
    model_deploy=strcat('Riciannet_deploy.prototxt');
    model_weights=strcat(fullfile(folderModel,['N15_complex_Brain1&2.caffemodel']));
    
    if use_gpu
        caffe.reset_all();
        caffe.set_mode_gpu();
        caffe.set_device(0);
    else
        caffe.reset_all();
        caffe.set_mode_cpu();
    end
    
    %---------------------------ÍøÂç³õÊ¼»¯--------------------------------------
    
    net = caffe.Net(model_deploy, model_weights, 'test');
    fprintf('Load net done. Net layers : ');
    net.layer_names
    fprintf('Net blobs : ');
    net.blob_names
    %---------------------------Êä³ö²ã----------------------------------------
    scores = net.forward({input});
    output= scores{1};
    % outputchanel=DAE_NIDCN_SWRB(data,model);
    timeCur=toc
    label=abs(label);
    % figure(333),imshow([abs(label)],[])
    % figure(334),imshow([abs(input)],[])
  figure(335),imshow([abs(output)],[])
    % figure(336),imshow([abs(label-output)],[])
    % figure(337),imshow([abs(label-input)],[])
    % figure(338),imshow([abs(input-output)],[])
    [PSNRCur, SSIMCur] = Cal_PSNRSSIM(im2uint8(label),im2uint8(output),0,0)
    [QILVCur]=qilv(im2uint8(label),im2uint8(output),0)
    MSECur=255*sqrt(mean((label(:)-output(:)).^2))
    blob_size = size(net.blob_names,1);
    save('./result/Brain1_N15.mat','output');
    imwrite(output,'./result/Brain1_N15.bmp');
