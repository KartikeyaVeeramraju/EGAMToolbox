
# EGAM Toolbox

A MATLAB toolbox that handles EGAM 2D convolutions to enable simulation of dynamical systems excited by two different fundamental frequencies. 




## Installation

Clone or Download the git repository and run `EGAM_toolbox.mltbx` to add the `lib` folder to your MATLAB path. You should then be able to use the EGAM core functions listed in the `lib` folder.


    
## Getting started

To understand the use case, please install the toolbox on your end and navigate to `EGAMToolbox/Examples/` and run the `init_script.m` file. The `init_script.m` triggers `Inverter_model.m` through an `ode23tb` solver and subsequently runs `Single_phase_inverter.slx` file.

If you just want to see some simulation results and code documentation to get started, navigate to `EGAMToolbox/Examples/html/` and open `inverter_model.html` and `init_script.html`

## Dependencies
This package utilizes [PLECS blockset](https://www.plexim.com/support/videos/introduction-plecs-blockset) in Simulink to run the inverter model.


## Feedback

If you have any feedback, please reach out to us at kimballjw@mst.edu

