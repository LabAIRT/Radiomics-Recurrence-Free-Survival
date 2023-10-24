clear all,close all,clc

filepath = 'E:\AnalCancer\Code\Survival Prediction Review\StratifiedEvent\Radiomics\';
filename = 'Validation_Prediction_OriFeature_DeGas_Expectation_Spearman0.8_UpdateRec_AnalCancer_StratiTrainValTest_HRsel_Average.xlsx';
[~,~,raw] = xlsread([filepath,filename],'Combine');
data = cell2mat(raw(2:end,:));
title = raw(1,:);
duration = data(:,3);
dur_mon = duration/365*12;
relapse = data(:,4);

%% 12 mon RFS
clear idx0 idx1 idx2 idx3 idx1
data_12 = data;
idx3 = find(dur_mon>12);
idx4 = find(relapse==1);
idx0 = intersect(idx3,idx4);
data_12(idx0,4) = 0;

idx1 = find(dur_mon<12);
idx2 = find(relapse==0);
idx = intersect(idx1,idx2);
data_12(idx,:) = [];

xlswrite([filepath,filename],title,'12monRFS','A1');
xlswrite([filepath,filename],data_12,'12monRFS','A2');
disp(['total: ',num2str(size(data_12,1)),'; relapse:',num2str(sum(data_12(:,4))),'; NonRelapse: ',num2str(size(data_12,1)-sum(data_12(:,4)))])

%% 24 mon RFS
clear idx0 idx1 idx2 idx3 idx1
data_24 = data;
idx3 = find(dur_mon>24);
idx4 = find(relapse==1);
idx0 = intersect(idx3,idx4);
data_24(idx0,4) = 0;

idx1 = find(dur_mon<24);
idx2 = find(relapse==0);
idx = intersect(idx1,idx2);
data_24(idx,:) = [];
xlswrite([filepath,filename],title,'24monRFS','A1');
xlswrite([filepath,filename],data_24,'24monRFS','A2');
disp(['total: ',num2str(size(data_24,1)),'; relapse:',num2str(sum(data_24(:,4))),'; NonRelapse: ',num2str(size(data_24,1)-sum(data_24(:,4)))])

%% 36 mon RFS
clear idx0 idx1 idx2 idx3 idx1
data_36 = data;
idx3 = find(dur_mon>36);
idx4 = find(relapse==1);
idx0 = intersect(idx3,idx4);
data_36(idx0,4) = 0;

idx1 = find(dur_mon<36);
idx2 = find(relapse==0);
idx = intersect(idx1,idx2);
data_36(idx,:) = [];
xlswrite([filepath,filename],title,'36monRFS','A1');
xlswrite([filepath,filename],data_36,'36monRFS','A2');

disp(['total: ',num2str(size(data_36,1)),'; relapse:',num2str(sum(data_36(:,4))),'; NonRelapse: ',num2str(size(data_36,1)-sum(data_36(:,4)))])