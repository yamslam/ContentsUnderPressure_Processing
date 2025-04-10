# Project Overview
This project is a case study on engineering judgment making in a chemical process safety enviornment. The process safety field is notorious for devistating incidents (CSB)[]. 

This study uses the digital decision-making game called (Contents Under Pressure (CUP))[https://stemforall2020.videohall.com/presentations/1691.html]. CUP was developed by a team of engineering faculty members with support from (Filament Games)[https://www.filamentgames.com/]. In CUP, players assume the role of a chemical plant manager and are faced with over 300 binary process safety judgments over the course of 15 in-game days. The user-interface positions the player in their office where they can see four key metrics at the top of the screen (time, safety, reputation, and productivity). A screenshot of the user interface for the game can be found below. 

<p align="center">
<img src= "https://github.com/user-attachments/assets/dc5d0cd9-2e24-4236-a0c2-a2574a5c22b2">
</p>

Rowan IRB PRO-NUMBERHERE and supported by NSF Research in the Formation of Engineers [RFE DUE# 2113844, 2113845, 2113846].

## 📈 Data analysis Process - Time Series Analysis
Contents Under Pressure data from an individual or group can be processed using time series analysis to understand how the three KPIs (safety, reputation, and productivity) changed over the course of the Contents Under Pressure narrative. 

The MATLAB script (TSA_Creator_Ritz_24MAY2023.m) is used in conjunction with an Excel file for data cleaning and condensation (TSA_Example_WriteUp.xlsm). Once the user has followed the instructions for data cleaning and condensation, the user can export the data esport sheet into MATLAB creating a MATLAB data file (instructions at the top of MATLAB script). Then, the TSA analysis should be able to be performed without issue. 

There will be a total of 4 figures populated (7 total if running the initial debugging figure set). The first figure the user will see on their screen will look like the graph below, which plots the average value of each KPI for the group being analysed. The figure below represents the results from the 2023 full student study performed at a large South Atlantic University. The dashed lines represent a specific judgment called out in one of our interview protocols. These callouts help us to understand how the various KPI factors might be factoring in to the cognative processing that players go through when making judgments. 

<p align="center">
<img src= "https://github.com/user-attachments/assets/da61bce1-b03f-467b-aba3-d9fb7b944564">
</p>

This MATLAB script additionally pulls out each KPI seprately and then also populates the standard error of the mean for the group's average. The standard error is highlighted as a shaded region surrounding the mean line value. An example of these charts can be found below using the same data set as the graph above. 

<p align="center">
<img src= "https://github.com/user-attachments/assets/35632e34-2846-4d97-8594-815f1f5f6a12" width="300" height="250">
<img src= "https://github.com/user-attachments/assets/46c738ba-dde6-4057-8b71-68b0a9492e2d" width="300" height="250">
<img src= "https://github.com/user-attachments/assets/e11b0b36-7ae9-4009-8a05-99e55dad8c8e" width="300" height="250">
</p>


Rowan IRB PRO-NUMBERHERE and supported by NSF Research in the Formation of Engineers [RFE DUE# 2113844, 2113845, 2113846].
