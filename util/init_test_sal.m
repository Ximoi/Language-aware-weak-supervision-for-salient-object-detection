%% Add path and init caffe
caffe_root = 'caffe-cvpr17/';
addpath([caffe_root '/matlab/']);
caffe.reset_all;
gpu_id = 0;
caffe.set_mode_gpu();
caffe.set_device(gpu_id);
%model_weights ='model/sal-finetune-3-0_iter_80000.caffemodel';%% 'caffe-cvpr17/models/cvpr17-ILT-pretrain-fs/ip-1_iter_80000.caffemodel';;
model_weights ='/home/qmy/Saliency/WSS/caffe-cvpr17/models/cvpr17-sal-finetune/ref/sal-finetune-t1_iter_52500.caffemodel'
model_def = 'model/deploy.prototxt';
phase = 'test'; 
net = caffe.Net(model_def, model_weights, phase);
%% path
imgRoot='/media/qmy/G/ECSSD/ECSSD/';% test image path
imnames=dir([imgRoot '*.jpg']);
res_path = '/media/qmy/G/ECSSD-3/';
if ~isdir(res_path)
    mkdir(res_path);
end