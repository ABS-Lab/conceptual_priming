%% load all the covariates file and convert to something pandas can read

motion_covariates_path = '/Users/phoenix/Desktop/imaging_studies/ConceptualPriming/data_imaging/cp0*/negative*/rp_acp0*_n*.txt';

motion_covariates_path_w_subj = sprintf(motion_covariates_path,'01','01');

covariate_files = dir(motion_covariates_path_w_subj);

covariates_folder = 'covariates';

for i=1:length(covariate_files)
    
    file_name = covariate_files(i).name;
    folder = covariate_files(i).folder;
    full_path = sprintf('%s/%s', folder,file_name);
    covariate_data = importdata(full_path);
    
    split_path = split(folder,'/');
    subject_folder = split_path{8};
%     
    new_folder_path = sprintf('%s/%s', covariates_folder,subject_folder);
    mkdir(new_folder_path);
    
    new_file_path = sprintf('%s/%s',new_folder_path,file_name);
    csvwrite(new_file_path,covariate_data)
    
end

