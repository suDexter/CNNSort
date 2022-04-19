function varargout = MainForm(varargin)
% MAINFORM MATLAB code for MainForm.fig
%      MAINFORM, by itself, creates a new MAINFORM or raises the existing
%      singleton*.
%
%      H = MAINFORM returns the handle to a new MAINFORM or the handle to
%      the existing singleton*.
%
%      MAINFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFORM.M with the given input arguments.
%
%      MAINFORM('Property','Value',...) creates a new MAINFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainForm

% Last Modified by GUIDE v2.5 29-Aug-2019 13:01:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MainForm_OpeningFcn, ...
    'gui_OutputFcn',  @MainForm_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

function InitAxes(handles)
clc;
axes(handles.axes1); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
axes(handles.axes2); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
set(handles.edit_info, 'String', '');

% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainForm (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;
InitAxes(handles)
handles.imdsTrain = 0;
handles.layers = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainForm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[layers, lgraph] = get_vggnet();
axes(handles.axes1);
plot(lgraph);
handles.layers = layers;
handles.lgraph = lgraph;
% Update handles structure
guidata(hObject, handles);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.layers, 0)
    return;
end
digitDatasetPath = fullfile(pwd, 'stl_db', 'train');
imdsTrain = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
digitDatasetPath = fullfile(pwd, 'stl_db', 'test');
imdsValidation = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');
handles.imdsTrain = imdsTrain;
handles.imdsValidation = imdsValidation;
handles.augimdsValidation = imdsValidation;
handles.imdsValidationLables = imdsValidation.Labels;
guidata(hObject, handles);
msgbox('数据载入成功！', '提示信息', 'modal');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.imdsTrain, 0) || isequal(handles.layers, 0)
    return;
end
inputSize = handles.layers(1).InputSize;
imdsTrain = augmentedImageDatastore(inputSize(1:2),handles.imdsTrain);
augimdsValidation = augmentedImageDatastore(inputSize(1:2),handles.imdsValidation);
handles.augimdsValidation = augimdsValidation;
guidata(hObject, handles);
MaxEpochs = round(str2num(get(handles.edit1, 'String')));
InitialLearnRate = str2num(get(handles.edit2, 'String'));
MiniBatchSize = round(str2num(get(handles.edit3, 'String')));
v1 = get(handles.popupmenu1, 'Value');
if v1 == 1
    ExecutionEnvironment = 'auto';
end
if v1 == 2
    ExecutionEnvironment = 'gpu';
end
if v1 == 3
    ExecutionEnvironment = 'cpu';
end
v2 = get(handles.popupmenu2, 'Value');
if v2 == 1
    options_train = trainingOptions('sgdm',...
        'MaxEpochs',MaxEpochs,...
        'InitialLearnRate',0.001,...
        'L2Regularization', 0.01, ...
        'Verbose',true,'MiniBatchSize', 128,...
        'Shuffle','every-epoch',...
        'Plots','training-progress',...
        'ValidationData',handles.augimdsValidation , ...
        'ValidationFrequency',10, ...
        'ExecutionEnvironment', ExecutionEnvironment);
else
    options_train = trainingOptions('sgdm',...
        'MaxEpochs',MaxEpochs,...
        'InitialLearnRate',0.001,...
        'L2Regularization', 0.01, ...
        'Verbose',true,'MiniBatchSize', 128,...
        'Shuffle','every-epoch',...
        'Plots','training-progress',...
        'ValidationData',handles.augimdsValidation , ...
        'ValidationFrequency',10, ...
        'ExecutionEnvironment', ExecutionEnvironment);
end
net = trainNetwork(imdsTrain, handles.lgraph, options_train);
save net.mat net
handles.net = net;
guidata(hObject, handles);
msgbox('训练完毕！', '提示信息', 'modal');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.net, 0) || isequal(handles.layers, 0)
    return;
end
t1 = cputime;
axes(handles.axes2); cla reset; axis on; box on;
set(gca, 'XTickLabel', '', 'YTickLabel', '');
YPred = classify(handles.net,handles.augimdsValidation,'ExecutionEnvironment', 'cpu');
YValidation = handles.imdsValidationLables;
accuracy = sum(YPred == YValidation)/numel(YValidation);
t2 = cputime;
str1 = sprintf('\n测试%d条数据\n耗时=%.2f s\n准确率=%.2f%%', numel(YPred), t2-t1, accuracy*100);
ss = get(handles.edit_info, 'String');
ss{end+1} = str1;
set(handles.edit_info, 'String', ss);

function filePath = OpenFile(imgfilePath)
if nargin < 1
    imgfilePath = fullfile(pwd, 'stl_db');
end
[filename, pathname, ~] = uigetfile( ...
    { '*.png','All png Files';...
    '*.jpg','All jpg Files';...
    '*.*',  '所有文件 (*.*)'}, ...
    '选择文件', ...
    'MultiSelect', 'off', ...
    imgfilePath);
filePath = 0;
if isequal(filename, 0) || isequal(pathname, 0)
    return;
end
filePath = fullfile(pathname, filename);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.net, 0) || isequal(handles.layers, 0)
    return;
end
filePath = OpenFile();
if isequal(filePath, 0) 
    return;
end
x = imread(filePath);
xo = x;
inputSize = handles.layers(1).InputSize;
if ~isequal(size(x), inputSize(1:2))
    x = imresize(x, inputSize(1:2), 'bilinear');
end
axes(handles.axes2); imshow(xo, []);
xw = zeros(inputSize(1),inputSize(2), 3, 1);
xw(:,:,:,1) = x(:,:,:);
t1 = cputime;
yw = classify(handles.net,xw,'ExecutionEnvironment', 'cpu');
t2 = cputime;
str1 = sprintf('\n测试1条数据\n耗时=%.2f s\n识别结果为%s', t2-t1, char(yw));
ss = get(handles.edit_info, 'String');
ss{end+1} = str1;
set(handles.edit_info, 'String', ss);


function edit_info_Callback(hObject, eventdata, handles)
% hObject    handle to edit_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_info as text
%        str2double(get(hObject,'String')) returns contents of edit_info as a double


% --- Executes during object creation, after setting all properties.
function edit_info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[layers, lgraph] = get_resnet();
figure;
% axes(handles.axes1);
plot(lgraph);
handles.layers = layers;
handles.lgraph = lgraph;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('确定要退出?', ...
    '退出', ...
    '确定','取消','取消');
switch choice
    case '确定'
        close;
    case '取消'
        return;
end
