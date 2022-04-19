function [layers, lgraph] = get_vggnet()
layers = [
    imageInputLayer([96 96 3],'Name','imageinput','DataAugmentation','randfliplr')

    convolution2dLayer([5 5],64,'Name','conv_1',"Padding","same")
    batchNormalizationLayer('Name','bn_1')
    reluLayer('Name','relu_1')
    maxPooling2dLayer([2 2],'Name','maxpool_1','Padding','same','Stride',[2 2])

    convolution2dLayer([5 5],128,'Name','conv_2','Padding','same')
    batchNormalizationLayer('Name','bn_2')
    reluLayer('Name','relu_2')
    maxPooling2dLayer([2 2],'Name','maxpool_2','Padding','same','Stride',[2 2])

    convolution2dLayer([5 5],128,'Name','conv_3','Padding','same')
    batchNormalizationLayer('Name','bn_3')
    reluLayer('Name','relu_3')
    dropoutLayer(0.4,'Name','dp_1')
    maxPooling2dLayer([2 2],'Name','maxpool_3','Padding','same','Stride',[2 2])
    
    convolution2dLayer([5 5],256,'Name','conv_4','Padding','same')
    batchNormalizationLayer('Name','bn_4')
    reluLayer('Name','relu_4')
    dropoutLayer(0.4,'Name','dp_2')
    maxPooling2dLayer([2 2],'Name','maxpool_4','Padding','same','Stride',[2 2])

    convolution2dLayer([5 5],256,'Name','conv_5','Padding','same')
    batchNormalizationLayer('Name','bn_5')
    reluLayer('Name','relu_5')
    dropoutLayer(0.4,'Name','dp_3')
    maxPooling2dLayer([2 2],'Name','maxpool_5','Padding','same','Stride',[2 2])
    
    dropoutLayer(0.5,'Name','dp_4')
    fullyConnectedLayer(512,'Name','fc_1')
    reluLayer('Name','relu_6')
    fullyConnectedLayer(512,'Name','fc_2')
    reluLayer('Name','relu_7')
    dropoutLayer(0.5,'Name','dp_5')
    fullyConnectedLayer(10,'Name','fc_3')
    softmaxLayer('Name','softmax')
    classificationLayer('Name','classoutput')];

lgraph = layerGraph(layers);