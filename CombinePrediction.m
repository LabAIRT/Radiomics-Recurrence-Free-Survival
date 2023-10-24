clear all,close all,clc

filepath = 'E:\AnalCancer\Code\Survival Prediction Review\StratifiedEvent\Radiomics\';
filename = 'Validation_Prediction_OriFeature_DeGas_Expectation_Spearman0.8_UpdateRec_AnalCancer_StratiTrainValTest_HRsel_';
pat_num = 96;

for file = 0:4
    data=[];
    for i = 0:4        
        sheet = ['CT',num2str(i)];
        fileread = [filepath,filename,num2str(file),'.xlsx'];
        temp = xlsread(fileread,sheet);
        data = [data;temp(:,2:end)];
    end
    title = {'PatientsID','Prediction','Duration','Recurrence'};
    xlswrite(fileread,title,'Combine','A1') 
    xlswrite(fileread,data,'Combine','A2') 
end
