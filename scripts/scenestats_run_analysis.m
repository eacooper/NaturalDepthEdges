% This script runs the scene statistics for the natural scenes used in:
%
% Natural statistics of depth edges modulate perceptual stability
% Basgoze, White, Burge & Cooper

clear all; close all;

% load all the variable information created with 'analyze_patches' code
load('../data/patch_data.mat');

%% depth of monocular region versus adjacent foreground/background regions

% histogram for the distance (depth) difference between monocular region and adjacent foreground/background regions
figure; hold on; title('Distance');

ha(1) = histogram((stats.DvnDepthMean-stats.FdepthMean),'BinWidth',7,'DisplayStyle','stairs','EdgeColor','r', 'LineWidth', 2);
ha(2) = histogram((stats.DvnDepthMean-stats.BdepthMean),'BinWidth',7,'DisplayStyle','stairs','EdgeColor','b','LineWidth', 2);
box on;
legend(ha,'foreground','background');
xlabel('distance difference from monocular region'); ylabel('frequency');
ylim([0 160]);xlim([-90 150]);

% Wilcoxon signed rank test
[p,h,sts] = signrank(abs(stats.DvnDepthMean-stats.FdepthMean),abs(stats.DvnDepthMean-stats.BdepthMean));

% calculate the effect size
effect_size = sts.zval/sqrt(length(stats.DvnDepthMean));

% display the results
display('');
display(['median abs mz-fg distance = ' num2str(median(abs(stats.DvnDepthMean-stats.FdepthMean)))]);
display(['median abs mz-bg distance = ' num2str(median(abs(stats.DvnDepthMean-stats.BdepthMean)))]);
display(['sign rank p val = ' num2str(p,3) ' zval = ' num2str(sts.zval) ' effect size = ' num2str(effect_size)]);


%% vertical luminance edge at transition

% histograms for the vertical edge in foreground/background regions
figure; hold on;
ha(1) = histogram(stats.FMjunctVedgeMean,linspace(0,0.3,20),'DisplayStyle','stairs','EdgeColor','r','LineWidth', 2);
ha(2) = histogram(stats.BMjunctVedgeMean,linspace(0,0.3,20),'DisplayStyle','stairs','EdgeColor','b','LineWidth', 2);
axis square; box on;
xlabel('Horizontal gradient at transition (normalized)');
ylabel('Frequency');
legend(ha,'foreground','background');
ylim([0 70]); 

% Wilcoxon signed rank test
[p,h,sts] = signrank(stats.FMjunctVedgeMean,stats.BMjunctVedgeMean);

% calculate the effect size
effect_size = sts.zval/sqrt(length(stats.FMjunctVedgeMean));

% display the results
display('');
display(['median mz-fg vedge = ' num2str(median(stats.FMjunctVedgeMean))]);
display(['median mz-bg vedge = ' num2str(median(stats.BMjunctVedgeMean))]);
display(['sign rank p val = ' num2str(p,3) ' zval = ' num2str(sts.zval) ' effect size = ' num2str(effect_size)]);


%% horizontal luminance edge at transition

% histograms for the horizontal edge in foreground/background regions
figure; hold on;
ha(1) = histogram(stats.FMjunctHedgeMean,linspace(0,0.3,20),'DisplayStyle','stairs','EdgeColor','r','LineWidth', 2);
ha(2) = histogram(stats.BMjunctHedgeMean,linspace(0,0.3,20),'DisplayStyle','stairs','EdgeColor','b','LineWidth', 2);
axis square; box on;
xlabel('Vertical gradient at transition (normalized)');
ylabel('Frequency');
legend(ha,'foreground','background');
ylim([0 70]); 

% Wilcoxon signed rank test
[p,h,sts] = signrank(stats.FMjunctHedgeMean,stats.BMjunctHedgeMean);

% calculate the effect size
effect_size = sts.zval/sqrt(length(stats.FMjunctHedgeMean));

% display the results
display('');
display(['median mz-fg hedge = ' num2str(median(stats.FMjunctHedgeMean))]);
display(['median mz-bg hedge = ' num2str(median(stats.BMjunctHedgeMean))]);
display(['sign rank p val = ' num2str(p,3) ' zval = ' num2str(sts.zval) ' effect size = ' num2str(effect_size)]);


%% luminance of monocular region versus adjacent foreground/background regions

% histogram for the luminance difference between monocular region and adjacent foreground/background regions
figure; hold on; title('Luminance');

ha(1) = histogram(((stats.DvnlumMean-stats.FlumMean)),'BinWidth',0.3,'DisplayStyle','stairs','EdgeColor','r','LineWidth', 2);
ha(2) = histogram(((stats.DvnlumMean-stats.BlumMean)),'BinWidth',0.3,'DisplayStyle','stairs','EdgeColor','b','LineWidth', 2);
box on;

legend(ha,'foreground','background');
xlabel('luminance difference from monocular region'); ylabel('frequency');
ylim([0 160]); xlim([-3 3]);

% Wilcoxon signed rank test
[p,h,sts] = signrank(abs(stats.DvnlumMean-stats.FlumMean),abs(stats.DvnlumMean-stats.BlumMean));

% calculate the effect size
effect_size = sts.zval/sqrt(length(stats.DvnlumMean));

% display the results
display('');
display(['median abs mz-fg lum = ' num2str(median(abs(stats.DvnlumMean-stats.FlumMean)))]);
display(['median abs mz-bg lum = ' num2str(median(abs(stats.DvnlumMean-stats.BlumMean)))]);
display(['sign rank p val = ' num2str(p,3) ' zval = ' num2str(sts.zval) ' effect size = ' num2str(effect_size)]);


%% contrast of of monocular region versus adjacent foreground/background regions

% histogram for the contrast difference between monocular region and adjacent foreground/background regions
figure; hold on; title('Contrast');

ha(1) = histogram((stats.DvncontMean-stats.FcontMean),'BinWidth',0.3,'DisplayStyle','stairs','EdgeColor','r','LineWidth', 2);
ha(2) = histogram((stats.DvncontMean-stats.BcontMean),'BinWidth',0.3,'DisplayStyle','stairs','EdgeColor','b','LineWidth', 2);
box on;
legend(ha,'foreground','background');
xlabel('contrast difference from monocular region'); ylabel('frequency');
ylim([0 160]); xlim([-3 3]);

% Wilcoxon signed rank test
[p,h,sts] = signrank(abs(stats.DvncontMean-stats.FcontMean),abs(stats.DvncontMean-stats.BcontMean));

% calculate the effect size
effect_size = sts.zval/sqrt(length(stats.DvncontMean));

% display the results
display('');
display(['median abs mz-fg cont = ' num2str(median(abs(stats.DvncontMean-stats.FcontMean)))]);
display(['median abs mz-bg cont = ' num2str(median(abs(stats.DvncontMean-stats.BcontMean)))]);
display(['sign rank p val = ' num2str(p,3) ' zval = ' num2str(sts.zval) ' effect size = ' num2str(effect_size)]);

