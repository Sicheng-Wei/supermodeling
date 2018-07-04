%--------------------------------------------------------------------------
%               读取examp10_01.xls中数据，进行距离判别
%--------------------------------------------------------------------------

%********************************读取数据***********************************
% 读取文件examp10_01.xls的第1个工作表中C2:F51范围的数据，即全部样本数据，包括未判企业
sample = xlsread('examp10_01.xls','','C2:F51');
% 读取文件examp10_01.xls的第1个工作表中C2:F47范围的数据，即已知组别的样本数据，
training = xlsread('examp10_01.xls','','C2:F47');
% 读取文件examp10_01.xls的第1个工作表中B2:B47范围的数据，即样本的分组信息数据，
group = xlsread('examp10_01.xls','','B2:B47');
obs = [1 : 50]';    % 企业的编号


%**********************************距离判别*********************************
% 距离判别，判别函数类型为mahalanobis，返回判别结果向量C和误判概率err
[C,err] = classify(sample,training,group,'mahalanobis');
[obs, C]  % 查看判别结果
err    % 查看误判概率
