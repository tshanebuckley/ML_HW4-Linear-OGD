% import data in housing.txt
housing_data = importdata('housing.txt');
% calculate and report the correlations between the first 13 attributes and
% attribute 14
housing_corr = [];
for c = 1:13 
    housing_corr = [housing_corr,corr(housing_data(:,c),housing_data(:,14))];
end
housing_corr
% plot the scatterplots between the first 13 attributes and attribute 14
for c = 1:13
    figure()
    scatter_plot(housing_data(:,c),housing_data(:,14))
end
% calculate the correlation coefficient between all attributes using
% corrcoef
housing_corr_all = corrcoef(housing_data)
for c = 1:14
    housing_corr_all(c,c) = 0;
end
max_mutual_corr = max(housing_corr_all)
max_mutual_corr = max(max_mutual_corr)