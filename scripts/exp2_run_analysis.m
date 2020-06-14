% This script runs the main analyses for the data from Experiment 2 from:
%
% Natural statistics of depth edges modulate perceptual stability
% Basgoze, White, Burge & Cooper

clear all; close all;

% load data file for experiment 2:
load('../data/exp2_responses.mat');

% load in regressors for each patch
load('../data/patch_data.mat');

% calculate and plot mean & std of responses (instability ratings as z-scores) for each patch, sorted from lowest to highest
figure; hold on;
bar(exp2.zscore_mean, 'facecolor','g');
errorbar(exp2.zscore_mean, exp2.zscore_std, 'k.','CapSize',1); % std
xlabel('Patch'); ylabel('stability rating (z-score)');box on;

% regressions (GLMMs)

% prepare variables for the table to run GLMM
subj    = categorical(exp2.subj);                           % subject
patch   = exp2.patch;                                       % patch index
resp    = exp2.resp;                                        % rating

disp    = stats.disparity(exp2.patch)';                      % disparity

% Edge model
FM = stats.FMjunctVedgeMean(exp2.patch)';                   % foreground-monocular transition vertical luminance edge
BM = stats.BMjunctVedgeMean(exp2.patch)';                   % background-monocular transition vertical luminance edge

% Contrast model
contMZ = stats.DvncontMean(exp2.patch)';                    % monocular region contrast
contB = stats.BcontMean(exp2.patch)';                       % background contrast
contF = stats.FcontMean(exp2.patch)';                       % foreground contrast
contMZB = abs(contB - contMZ);                              % contrast difference between monocular region and adjacent background
contMZF = abs(contF - contMZ);                              % contrast difference between monocular region and adjacent foreground

% Luminance model
lumMZ = stats.DvnlumMean(exp2.patch)';                      % monocular region luminance
lumB = stats.BlumMean(exp2.patch)';                         % background luminance
lumF = stats.FlumMean(exp2.patch)';                         % foreground luminance
lumMZB = abs(lumB - lumMZ);                                 % luminance difference between monocular region and adjacent background
lumMZF = abs(lumF - lumMZ);                                 % luminance difference between monocular region and adjacent foreground

% write everything on variable table
T = table(subj,patch,disp,FM,BM,contMZ,contMZB,contMZF,lumMZB,lumMZF,resp);

% Disparity-Only Model
glme_disponly = fitglme(T,...
    'resp ~ 1 + disp + (1|subj)',...
    'Distribution','Normal','Link','identity','FitMethod','Laplace','DummyVarCoding','full','verbose',1);

% Edge Model
glme_edge = fitglme(T,...
    'resp ~ 1 + disp + FM + BM + (1|subj)',...
    'Distribution','Normal','Link','identity','FitMethod','Laplace','DummyVarCoding','full','verbose',1);

% Contrast Model
glme_cont = fitglme(T,...
    'resp ~ 1 + disp + contMZB + contMZF + (1|subj)',...
    'Distribution','Normal','Link','identity','FitMethod','Laplace','DummyVarCoding','full','verbose',1);

% Luminance Model
glme_lum = fitglme(T,...
    'resp ~ 1 + disp + lumMZB + lumMZF + (1|subj)',...
    'Distribution','Normal','Link','identity','FitMethod','Laplace','DummyVarCoding','full','verbose',1);

% scatterplot for Disparity-Only Model & residuals
figure; hold on; 
subplot(1,2,1); hold on;
title('Disparity-Only Model');
scatter(T.resp,fitted(glme_disponly),'filled'); xlim([-5 105]);ylim([-5 105]);xlabel('instability rating');ylabel('model fit');box on;axis square;
set(gca,'xtick',[0 20 40 60 80 100],'ytick', [0 20 40 60 80 100]);
lsline

subplot(1,2,2); hold on;
plotResiduals(glme_disponly,'histogram','ResidualType','Pearson')


% scatterplot for Edge Model & residuals
figure; hold on; 
subplot(1,2,1); hold on;
title('Edge Model');
scatter(T.resp,fitted(glme_edge),'filled'); xlim([-5 105]);ylim([-5 105]); xlabel('instability rating');ylabel('model fit');box on;axis square;
set(gca,'xtick',[0 20 40 60 80 100],'ytick', [0 20 40 60 80 100]);
lsline

subplot(1,2,2); hold on;
plotResiduals(glme_edge,'histogram','ResidualType','Pearson')


% compare these two models
compare(glme_disponly,glme_edge);


% scatterplot for Contrast Model & residuals
figure; hold on; 
subplot(1,2,1); hold on;
title('Contrast Model');
scatter(T.resp,fitted(glme_cont),'filled'); xlim([-5 105]);ylim([-5 105]); xlabel('instability rating');ylabel('model fit');box on;axis square;
set(gca,'xtick',[0 20 40 60 80 100],'ytick', [0 20 40 60 80 100]);
lsline

subplot(1,2,2); hold on;
plotResiduals(glme_lum,'histogram','ResidualType','Pearson')

% scatterplot for Luminance Model & residuals
figure; hold on; 
subplot(1,2,1); hold on;
title('Luminance Model');
scatter(T.resp,fitted(glme_lum),'filled'); xlim([-5 105]);ylim([-5 105]); xlabel('instability rating');ylabel('model fit');box on;axis square;
set(gca,'xtick',[0 20 40 60 80 100],'ytick', [0 20 40 60 80 100]);
lsline

subplot(1,2,2); hold on;
plotResiduals(glme_lum,'histogram','ResidualType','Pearson')

