%Before you begin, import the data. Ensure you have the correct folder
%opened in MATLAB in the "Current Folder." Change folder as needed.
%Open the Excel file in MATLAB and go to the Data Export Sheet.
%The goal is to import the following variables as matrices
%       MeanP (1*280) as avg productivity
%       MeanR (1*280) as avg relationship
%       MeanS (1*280) as avg Safety
%       Productivity (280*n) which are the exact Productivity scores where
%n = number of players in the sample
%       Reputation (280*n)
%       Safety (280*n)
%       StdevP (1*280)
%       StdevR (1*280)
%       StdevS (1*280)
% I encourage you to use these exact names as they are used later in the
% doc.

%Data import should be a "Numeric Matrix" as the "Output Type". You need to
% rename each imported matrix/vector because it will be named with the
% spreadsheet, which can overwrite a prior import.

%The group of these vector should be exported as a .mat file. This will
%help you from needing to export out of Excel every time you want to
%generate new TSA plots.

load('StudentStudy_TSA.mat') %import your .mat file for quick access; Case sensetive

%This is how I choose colors for the plots
SafeMean=1/255*[255,128,33];
SafeFill=1/255*[255,230,211];
RepMean=1/255*[94,204,243];
RepFill=1/255*[223,245,253];
ProdMean=1/255*[167,234,82];
ProdFill=1/255*[237,251,220];

%The following only plots the Means 
% figure;
% p1=plot(Safety,'r');
% xlabel('Contents Under Pressure Narrative (15 days)')
% ylabel('Safety Score')
% p1(1).LineWidth = 0.5;
% xlim([0,280])
% ylim([-100,100])
% 
% figure
% p2=plot(Reputation,'m');
% xlabel('Contents Under Pressure Narrative (15 days)')
% ylabel('Reputation Score')
% p2(1).LineWidth = 0.5;
% xlim([0,280])
% ylim([-100,100])
% line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);
% 
% figure
% p3=plot(Productivity,'g');
% xlabel('Contents Under Pressure Narrative (15 days)')
% ylabel('Productivity Score')
% p3(1).LineWidth = 0.5;
% xlim([0,280])
% ylim([-100,100])
% line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);
% line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);


%The section below this comment is for generating means with standard
%deviation banding.


LowS=rot90(MeanS-StdevS);   %Rotate 90 degrees function since I forgot to do this in Excel
HiS=rot90(MeanS+StdevS);    %This needs to be in n*~280 not ~280*n
LowR=rot90(MeanR-StdevR);
HiR= rot90(MeanR+StdevR);
LowP=rot90(MeanP-StdevP);
HiP= rot90(MeanP+StdevP);

%More rotation
MeanS=rot90(MeanS);
MeanR=rot90(MeanR);
MeanP=rot90(MeanP);

figure                                                  %Create a new figure window to graph in
x=1:281;                                                %Setting the dimension of the x axis
plot(x,LowS,'r','LineWidth',0.1);                       %Plot mean-1stdev of safety
title('Mean Safety Score (n = 12)');
xlim([0,281])                                           %Set dimensions of graph for scaling
ylim([-100,100])
ylabel('Safety Score','FontSize', 12)                   %Label axes of graph
xticks([0 22 43 62 82 99 116 134 153 171 188 206 226 243 262 281])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','end'})
xlabel('Contents Under Pressure Narrative (15 days)','FontSize', 12)
% The line above this I turned off so I could "stitch" these three figures
% together. If you want to present these as seperate figures, I suggest
% uncommenting the previous line.
hold on;                                                %Freeze content so you can add more
plot(x,HiS,'r','LineWidth',0.1);                        %Add second plot: mean+1stdev of safety
x2 = [x,fliplr(x)];                                     %Create data in between the two curves
inBetween = [LowS,fliplr(HiS)];
fill(x2,inBetween,SafeFill);                            %Plot inbetween data
hold on;
plot(x,MeanS,'color',SafeMean,'LineWidth',2);           %Add mean safety score over plot
hold on;
line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);        % Draw line for X axis.
set(gca,'TickDir','out');
box OFF

figure  %Reputation Figure
x=1:281;
plot(x,LowR,'r','LineWidth',0.1);
title('Mean Reputation Score (n = 12)');
xlim([0,281])
ylim([-100,100])
xlabel('Contents Under Pressure Narrative (15 days)','FontSize', 12)
ylabel('Reputation Score','FontSize', 12)
xticks([0 22 43 62 82 99 116 134 153 171 188 206 226 243 262 281])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','end'})
hold on;
plot(x,HiR,'r','LineWidth',0.1);
inBetween = [LowR,fliplr(HiR)];
fill(x2,inBetween,RepFill);
hold on;
plot(x,MeanR,'color',RepMean,'LineWidth',2);
hold on;
line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);        % Draw line for X axis.
set(gca,'TickDir','out');
box OFF


figure  %Productivity Figure
x=1:281;
plot(x,LowP,'r','LineWidth',0.1);
title('Mean Productivity Score (n = 12)');
xlim([0,281])
ylim([-100,100])
xlabel('Contents Under Pressure Narrative (15 days)','FontSize', 12)
ylabel('Productivity Score','FontSize', 12)
xticks([0 22 43 62 82 99 116 134 153 171 188 206 226 243 262 281])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','end'})
hold on;
plot(x,HiP,'r','LineWidth',0.1);
inBetween = [LowP,fliplr(HiP)];
fill(x2,inBetween,ProdFill);
hold on;
plot(x,MeanP,'color',ProdMean,'LineWidth',2);
hold on;
line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);        % Draw line for X axis.
set(gca,'TickDir','out');
box OFF

figure  %All Means Figure
x=1:281;
title('All Mean Scores (n = 12)');
xlim([0,281])
ylim([-100,100])
xlabel('Contents Under Pressure Narrative (15 days)','FontSize', 12)
ylabel('Scores','FontSize', 12)
xticks([0 22 43 62 82 99 116 134 153 171 188 206 226 243 262 281])
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','end'})
hold on;
inBetween = [LowP,fliplr(HiP)];
hold on;
plot(x,MeanP,'color',ProdMean,'LineWidth',2);
hold on;
plot(x,MeanR,'color',RepMean,'LineWidth',2);
hold on;
plot(x,MeanS,'color',SafeMean,'LineWidth',2);  
hold on;
line(xlim, [0,0], 'Color', 'k', 'LineWidth', .5);        % Draw line for X axis.
hold on;
%Draw a line at the X value for each scenario from beliefs interview
x1 = xline(170,'-.','S1 (LvT)','LabelHorizontalAlignment','center','LabelVerticalAlignment','bottom');
x2 = xline(53,'-.', 'S2 (RvT)','LabelHorizontalAlignment','center','LabelVerticalAlignment','bottom');                                     
x3 = xline(236,'-.', 'S3 (LvR)','LabelHorizontalAlignment','center','LabelVerticalAlignment','bottom');                                      
x4 = xline(94,'-.', 'S4 (LvP)','LabelHorizontalAlignment','center','LabelVerticalAlignment','bottom');                                      
x5 = xline(261,'-.', 'S5 (PvA)','LabelHorizontalAlignment','center','LabelVerticalAlignment','bottom');

legend({'Productivity','Reputation','Safety','0 Reference'},'Location','eastoutside')
set(gca,'TickDir','out');
box OFF