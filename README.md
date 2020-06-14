# NaturalDepthEdges
This repository contains the raw data and example code for the analyses described in 

Natural statistics of depth edges modulate perceptual stability
Basgoze, White, Burge & Cooper
Journal of Vision, 2020

These resources are organized into separate folders:


## patch_images

This folder contains visualizations of each of the 215 natural stereo image patches used in the paper. The luminance images, depth maps, and region of interest masks are saved in a png file for easy visualization.


## data

This folder contains the raw data in mat files, organized as follows:

### patch_data.mat

patches = luminance and depth measurements from natural stereo image patches. Organized as a structure with fields:

* luminance [78×195×215 double]		luminance values for image in stereo pair with the monocular region (width x height x patch)
* luminanceNZ [78×195×215 double]	luminance values for image in stereo pair without the monocular region (width x height x patch)
* depth [78×195×215 double]		depth values (in meters) for image in stereo pair with the monocular region (width x height x patch)
* depthNZ [78×195×215 double]		depth values (in meters) for image in stereo pair without the monocular region (width x height x patch)
rois = binary masks indicating the pixels that correspond to each region of interest in the analysis. Organized as a structure with fields:
* MRorig [78×195×215 logical]		original binary mask indicating the location of monocularly visible pixels (width x height x patch)
* MR [78×195×215 logical]			cleaned binary mask indicating the location of monocularly visible pixels (width x height x patch)
* BF [78×195×215 logical]			binary mask indicating the location of the adjacent binocular foreground (width x height x patch)
* BB [78×195×215 logical]			binary mask indicating the location of the adjacent binocular background (width x height x patch)
* BMTrans [78×195×215 logical]		binary mask indicating the location of the background-monocular transition (width x height x patch)
* FMTrans [78×195×215 logical]		binary mask indicating the location of the foreground-monocular transition (width x height x patch)
 
stats = for each patch, we provide summary values averaged within the regions of interest. Organized as a structure with fields:

* disparity [1×215 double]				average relative disparity between the foreground and the background rois (degrees)
* DvnDepthMean [1×215 double]			depth of monocular region (meters)
* BdepthMean [1×215 double]			depth of background region (meters)
* FdepthMean [1×215 double]			depth of foreground region (meters)
* BMjunctVedgeMeanExp1 [1×215 double]	vertical edge strength in background-monocular transition in Experiment 1 (normalized magnitude of derivative filters)
* FMjunctVedgeMeanExp1 [1×215 double]	vertical edge strength in foreground-monocular transition in Experiment 1
* BMjunctHedgeMeanExp1 [1×215 double]	horizontal edge strength in background-monocular transition in Experiment 1
* FMjunctHedgeMeanExp1 [1×215 double]	horizontal edge strength in foreground-monocular transition in Experiment 1
* DvncontMeanExp1 [1×215 double]		contrast of monocular region in Experiment 1 (normalized RMS pixel luminance)
* BcontMeanExp1 [1×215 double]			contrast of background region in Experiment 1 
* FcontMeanExp1 [1×215 double]			contrast of foreground region in Experiment 1 
* DvnimExp1Mean [1×215 double]			luminance of monocular region in Experiment 1 (arbitrary units)
* BimExp1Mean [1×215 double]			luminance of background region in Experiment 1
* FimExp1Mean [1×215 double]			luminance of foreground region in Experiment 1
* BMjunctVedgeMean [1×215 double]		vertical edge strength in background-monocular transition in Experiment 2
* FMjunctVedgeMean [1×215 double]		vertical edge strength in foreground-monocular transition in Experiment 2
* BMjunctHedgeMean [1×215 double]		horizontal edge strength in background-monocular transition in Experiment 2
* FMjunctHedgeMean [1×215 double]		horizontal edge strength in foreground-monocular transition in Experiment 2
* DvncontMean [1×215 double]			contrast of monocular region in Experiment 2 
* BcontMean [1×215 double]				contrast of background region in Experiment 2
* FcontMean [1×215 double]				contrast of foreground region in Experiment 2
* DvnlumMean [1×215 double]			luminance of monocular region in Experiment 2
* BlumMean [1×215 double]				luminance of background region in Experiment 2
* FlumMean [1×215 double]				luminance of foreground region in Experiment 2

### exp1_responses.mat

exp1 = 

* subj [644x1]				subject number
* patch [644x1] 			patch number
* resp [644x1] 				mean instability rating
* zscore_mean [92x1] 		mean rating z-score for each patch
* zscore_std [92x1] 			standard deviation of rating z-scores for each patch

### exp2_responses.mat

exp2 = 

* subj [644x1]				subject number
* patch [644x1] 			patch number
* resp [644x1] 				mean instability rating
* zscore_mean [92x1] 		mean rating z-score for each patch
* zscore_std [92x1] 			standard deviation of rating z-scores for each patch


## scripts

This folder contains scripts for running the main analyses presented in the paper:

scenestats_run_analysis				runs the scene statistics analysis
exp1_run_analysis					runs the analysis for Experiment 1
exp2_run_analysis					runs the analysis for Experiment 2
