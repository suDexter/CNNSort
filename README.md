![](/pic/Test2.png)
# CNNSort——使用VggNet和ResNet网络进行训练并进行分类评测
## 0. 关于本项目
> 开发者注：该项目使用了尽可能少的代码量实现了图片识别这一功能
## 1. 项目展示
<p float="left">
  <img src="/pic/Resnet.png">
  <img src="/pic/Training.png">
</p>

## 2. 文件说明
binConvert文件夹为将二进制形式数据文件转化为图片形式的代码，因为已经下载好数据集，所以注释掉了代码中下载数据集的部分，如果未下载，可以取消掉这部分的注释进行数据集的下载。将下载好的stl10_binary文件夹粘贴进去，运行代码，会生成一个img文件夹，里面包含10个文件夹，分别为10个类，每个类中包含500张训练图片。 再删除生成的img文件夹 改变代码的34-38行： DATA_PATH = './stl10_binary/test_X.bin' LABEL_PATH = './stl10_binary/test_y.bin' 再次运行，会生成一个img文件夹，里面包含10个文件夹，分别为10个类，每个类中包含500张测试图片，手动将生成的测试集和训练集的各个文件夹改为类名字。  
CNNItemTest为该项目，里面已经包括了处理好的数据集，不需要做数据集类型的转换。 

## 3. 使用说明
1.打开MATLAB在MATLAB的命令行窗口输入cd('此项目的路径')   
2.在MATLAB的命令行窗口输入guide，并选择MainForm.fig，打开设计界面后点运行按钮。
