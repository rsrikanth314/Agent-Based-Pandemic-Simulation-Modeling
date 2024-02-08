%%
%Exercise: 12 ------****<<Pandemic simulation>>******

% Task-3:

%submitted By:
% (1).. Name: Srikanth reddy Yalamakuru
%       matricul number : 419324

% (2).. Name: Harsha vardhan Reddy Katikireddy 
%       matricul number: 419777

% program description:>>> 
% 
%Constructing Histogram plot from the data obtained from task-2 at time
%steps t=0.3 and t=0.8.

%%
clc;
clear all;
close all;

%% Main body 


iter_number=10;

d = dir('*.mat'); % only looking for .mat-Files        

% using for loop to extract the data from ".mat" files.

for i=1:iter_number 
    
    % loading the data for 100 indviduals simulation
    sample1=load(['Pandemic_100_' num2str(i) '.mat']);
    
    % appending the data loaded into a vectors for plotting
    sample1_t1(i)= sample1.health_per_time1;
    sample1_t2(i)= sample1.health_per_time2;
    
     % loading the data for 200 indviduals simulation
    sample2=load(['Pandemic_200_' num2str(i) '.mat']);
    
    % appending the data loaded into a vectors for plotting
    sample2_t1(i)= sample2.health_per_time1;
    sample2_t2(i)= sample2.health_per_time2;
    
     % loading the data for 400 indviduals simulation
    sample3=load(['Pandemic_400_' num2str(i) '.mat']);
    
    % appending the data loaded into a vectors for plotting
    sample3_t1(i)= sample3.health_per_time1;
    sample3_t2(i)= sample3.health_per_time2;
end

figure(1);

% using subplot to plot all the histograms.
subplot(2,3,1)
histogram(sample1_t1) % using histogram function for ploting histograms
histfit(sample1_t1)   % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('100 individuals, t=0.3')

subplot(2,3,2)
histogram(sample2_t1)  % using histogram function for ploting histograms
histfit(sample2_t1)     % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('200 individuals, t=0.3')

subplot(2,3,3)
histogram(sample3_t1) % using histogram function for ploting histograms
histfit(sample3_t1)   % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('400 individuals, t=0.3')

subplot(2,3,4)
histogram(sample1_t2)  % using histogram function for ploting histograms
histfit(sample1_t2)    % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('100 individuals, t=0.8')

subplot(2,3,5)
histogram(sample2_t2)  % using histogram function for ploting histograms
histfit(sample2_t2)     % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('200 individuals, t=0.8')

subplot(2,3,6)
histogram(sample3_t2)   % using histogram function for ploting histograms
histfit(sample3_t2)      % using histfit built-in function for drwaing Pobability distribution curve (pdc)
xlim([0 1])
ylim([0 10])
xlabel('Healthy individuals %')
ylabel('density')
title('400 individuals, t=0.8')

set(gcf, 'units','normalized','outerposition',[0 0 1 1]);