# NaturalDepthEdges
This repository contains the raw data and example code for the analyses described in:
[Basgoze, White, Burge & Cooper. Natural statistics of depth edges modulate perceptual stability. Journal of Vision, 2020](https://www.biorxiv.org/content/10.1101/2020.04.05.026724v1)
These resources are organized into separate folders:

## patch_images - stimuli
This folder contains preview visualizations of each of the 215 natural stereo image patches used in the paper. 
The luminance images, depth maps, and region of interest masks are saved in a png file for easy visualization.
These are in .png format here, but are also available as Matlab data in the 'patches' struct in patch_data.m described below.

## scripts
### scenestats_run_analysis.m 
runs the scene statistics analysis
### exp1_run_analysis
runs the analysis for Experiment 1 
### exp2_run_analysis.m 
runs the analysis for Experiment 2 

## data
Raw data used in the scripts above.
### patch_data.mat
| Struct      | Field                | Size                 | Description                                                                                                            |
|-------------|----------------------|----------------------|------------------------------------------------------------------------------------------------------------------------|
| **patches** |                      |                      | luminance and depth measurements from natural stereo image patches.                                                    |
|             | luminance            | [78×195×215 double]  | luminance values for image in stereo pair with the monocular region                                                    |
|             | luminanceNZ          | [78×195×215 double]  | luminance values for image in stereo pair without the monocular region                                                 |
|             | depth                | [78×195×215 double]  | depth values (in meters) for image in stereo pair with the monocular region                                            |
|             | depthNZ              | [78×195×215 double]  | depth values (in meters) for image in stereo pair without the monocular region                                         |
| **rois**    |                      |                      | binary masks indicating the pixels that correspond to each region of interest in the analysis.                         |
|             | MRorig               | [78×195×215 logical] | original binary mask indicating the location of monocularly visible pixels                                             |
|             | MR                   | [78×195×215 logical] | cleaned binary mask indicating the location of monocularly visible pixels                                              |
|             | BF                   | [78×195×215 logical] | binary mask indicating the location of the adjacent binocular foreground                                               |
|             | BB                   | [78×195×215 logical] | binary mask indicating the location of the adjacent binocular background                                               |
|             | BMTrans              | [78×195×215 logical] | binary mask indicating the location of the background-monocular transition                                             |
|             | FMTrans              | [78×195×215 logical] | binary mask indicating the location of the foreground-monocular transition                                             |
| **stats**   |                      |                      | summary values averaged within the regions of interest for each patch                                                  |
|             | disparity            | [1×215 double]       | average relative disparity between the foreground and the background rois (degrees)                                    |
|             | DvnDepthMean         | [1×215 double]       | depth of monocular region (meters)                                                                                     |
|             | BdepthMean           | [1×215 double]       | depth of background region (meters)                                                                                    |
|             | FdepthMean           | [1×215 double]       | depth of foreground region (meters)                                                                                    |
|             | BMjunctVedgeMeanExp1 | [1×215 double]       | vertical edge strength in background-monocular transition in Experiment 1 (normalized magnitude of derivative filters) |
|             | FMjunctVedgeMeanExp1 | [1×215 double]       | vertical edge strength in foreground-monocular transition in Experiment 1                                              |
|             | BMjunctHedgeMeanExp1 | [1×215 double]       | horizontal edge strength in background-monocular transition in Experiment 1                                            |
|             | FMjunctHedgeMeanExp1 | [1×215 double]       | horizontal edge strength in foreground-monocular transition in Experiment 1                                            |
|             | DvncontMeanExp1      | [1×215 double]       | contrast of monocular region in Experiment 1 (normalized RMS pixel luminance)                                          |
|             | BcontMeanExp1        | [1×215 double]       | contrast of background region in Experiment 1                                                                          |
|             | FcontMeanExp1        | [1×215 double]       | contrast of foreground region in Experiment 1                                                                          |
|             | DvnimExp1Mean        | [1×215 double]       | luminance of monocular region in Experiment 1 (arbitrary units)                                                        |
|             | BimExp1Mean          | [1×215 double]       | luminance of background region in Experiment 1                                                                         |
|             | FimExp1Mean          | [1×215 double]       | luminance of foreground region in Experiment 1                                                                         |
|             | BMjunctVedgeMean     | [1×215 double]       | vertical edge strength in background-monocular transition in Experiment 2                                              |
|             | FMjunctVedgeMean     | [1×215 double]       | vertical edge strength in foreground-monocular transition in Experiment 2                                              |
|             | BMjunctHedgeMean     | [1×215 double]       | horizontal edge strength in background-monocular transition in Experiment 2                                            |
|             | FMjunctHedgeMean     | [1×215 double]       | horizontal edge strength in foreground-monocular transition in Experiment 2                                            |
|             | DvncontMean          | [1×215 double]       | contrast of monocular region in Experiment 2                                                                           |
|             | BcontMean            | [1×215 double]       | contrast of background region in Experiment 2                                                                          |
|             | FcontMean            | [1×215 double]       | contrast of foreground region in Experiment 2                                                                          |
|             | DvnlumMean           | [1×215 double]       | luminance of monocular region in Experiment 2                                                                          |
|             | BlumMean             | [1×215 double]       | luminance of background region in Experiment 2                                                                         |
|             | FlumMean             | [1×215 double]       | luminance of foreground region in Experiment 2                                                                         |
                                                                                 
### exp1_responses.mat
| Struct   | Field       | Size           | Description                                          |
|----------|-------------|----------------|------------------------------------------------------|
| **exp1** |             |                | data from Experiment 1                              |
|          | subj        | [644x1 double] | subject number                                       |
|          | patch       | [644x1 double] | patch number                                         |
|          | resp        | [644x1 double] | mean instability rating                              |
|          | zscore_mean | [92x1 double]  | mean rating z-score for each patch                   |
|          | zscore_std  | [92x1 double]  | standard deviation of rating z-scores for each patch |
                                                                                
### exp2_responses.mat
| Struct   | Field       | Size           | Description                                          |
|----------|-------------|----------------|------------------------------------------------------|
| **exp2** |             |                | data from Experiment 2                               |
|          | subj        | [644x1 double] | subject number                                       |
|          | patch       | [644x1 double] | patch number                                         |
|          | resp        | [644x1 double] | mean instability rating                              |
|          | zscore_mean | [92x1 double]  | mean rating z-score for each patch                   |
|          | zscore_std  | [92x1 double]  | standard deviation of rating z-scores for each patch |
                                                                                 
