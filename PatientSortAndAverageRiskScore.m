clear all,close all,clc

filepath = 'E:\AnalCancer\Code\Survival Prediction Review\StratifiedEvent\Radiomics\';
filename = 'Validation_Prediction_OriFeature_DeGas_Expectation_Spearman0.8_UpdateRec_AnalCancer_StratiTrainValTest_HRsel_';
pat_num = 96;

for i = 0:4
    RiskFile = [filepath,filename,num2str(i),'.xlsx'];
    [~,~,raw] = xlsread(RiskFile,'Combine');
    data = cell2mat(raw(2:pat_num+1,:));
    sortData(:,:,i+1) = sortrows(data,1);
end

datawrite = mean(sortData,3);

writefile = [filename 'Average.xlsx'];
title = raw(1,:);
xlswrite([filepath,writefile],title,'Combine','A1') 
xlswrite([filepath,writefile],datawrite,'Combine','A2') 