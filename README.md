# Quadcopter_Control

## Introduction
  In this project,we will learn the dynamics of the Quadcopter and implement control algorithms on it.

## Altitude control of a 1D Quadcopter
### Hover at height 1 m

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/1-D_Control/Results/heightcontrol.gif)

## 2D trajectory tracking using PID controller
Goal was to track the given two dimensional trajectories while minimising the position error.
### Line Trajectory

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/2-D_Control/Results/trajline.gif)

### Sine Trajectory

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/2-D_Control/Results/trajsine.gif)

### Diamond Trajectory

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/2-D_Control/Results/trajdiamond.gif)

## 3D trajectory tracking using PID controller
Goal was to track the given three dimensional trajectories while minimising the position error.
### Helix Trajectory

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/3-D_Control/Results/trajhelix.gif)

### Minimum Snap Trajectory through given waypoints

![](https://github.com/Ayush1285/Quadcopter_Control/blob/main/3-D_Control/Results/trajminsnap.gif)

## Graphs
### Minimum Snap Trajectory following using PID
<img src="Simulink_Models/Results/xpositionpid.jpg" heigth="10"> | <img src="Simulink_Models/Results/ypositionpid.jpg">
--------------------------------------------------------|-----------------------
<img src="Simulink_Models/Results/zpositionpid.jpg">  | 

### Minimum Snap Trajectory following using LQR
<img src="Simulink_Models/Results/xpositionlqr.jpg" heigth="10"> | <img src="Simulink_Models/Results/ypositionlqr.jpg">
--------------------------------------------------------|-----------------------
<img src="Simulink_Models/Results/zpositionlqr.jpg">  | 

### Comparison of Trajectory tracking error (LQR vs PID)
<img src="Simulink_Models/Results/xposerror.jpg" heigth="10"> | <img src="Simulink_Models/Results/yposerror.jpg">
--------------------------------------------------------|-----------------------
<img src="Simulink_Models/Results/zposerror.jpg">  | 

## References
  * [Robotics: Aerial Robotics, by UPenn](https://www.coursera.org/learn/robotics-flight?=)
  * [Euler Quaternions PDF](https://www.ccs.neu.edu/home/rplatt/cs5335_fall2017/slides/euler_quaternions.pdf)
  * [Visualizing Quaternions](https://eater.net/quaternions/)
  * [State Space, by MATLAB Tech Talks](https://www.youtube.com/playlist?list=PLn8PRpmsu08podBgFw66-IavqU2SqPg_w)
  * [Dynamic modeling, Simulation and PID controller of Unmanned Aerial Vehicle UAV](https://drive.google.com/file/d/17vC72CxguJSLH8T1SG_DPBBhd8WRzE7P/view?usp=sharing)
  * [Modelling and Stabilizing Control laws design based on Backstepping for an UAV type Quadrotor](https://drive.google.com/file/d/1x7zfYDEAd4OGHKVt8xIQ0uwxMXA-TSl7/view?usp=sharing)
