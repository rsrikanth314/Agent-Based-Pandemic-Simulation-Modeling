%%
%Exercise: 12 ------****<<Pandemic simulation>>******

% Task-1:

%submitted By:
% (1).. Name: Srikanth reddy Yalamakuru
%       matricul number : 419324

% program description:>>> 
%Simulating the spreading of corona virus in real world. 
%Considering the random points as people moving in a space or box. the
% points are made to move with a random velocity with in the box. when the
% points are collided with the boundaries of a box they are bounced back.
% intially 10% of points are infected, when this sick points comes into the
% proximity of healthy points they become infected. after a certain time,
% the infected persons recover and can no longer infect or become infected
% again.

%%
clc;
clear all;
close all;

%% Input parameters

dt= 0.001;           % time step
time= 0:dt:1;        % time vector
no_of_per= 100;      % total number of individuals taken for simulation
intial_infected_per=0.1;   % considering 10% of people are infected initially
radius= 0.055;             % Radius of an infected individual. if a healthy person comes into this radius he will also get infected.

%parameters for wall boundaries.

% horizontal wall limits
hor_limit_start=0;      % horizontal limit start
hor_limit_end=2;        % horizontal limit end

% vertical walls limits
vert_limit_start=0;     % vertical limit start
vert_limit_end=1;       % vertical limit end

%% Creating all the usefull vectors for calculation

% Creating a position vector for 100 individuals:

x_position= 2*rand(no_of_per,1);  % using rand built-in function for generating random x coordinates for individuals
y_position= rand(no_of_per,1);    % using rand built-in function for generating random y coordinates for individuals
position= [x_position y_position];  % combining x and y coordinates and building a position vector for 100 individuals


% Creating velocity vector for 100 individuals:

% For generating the velocity values between [-1,1], sin and cos functions
% are used along x and y directions respectively.

theta= rand(no_of_per,1)*2*pi;   % using rand built-in function for generating random theta values for sin and cos
x_vel= cos(theta);              % the velocities along x axis
y_vel= sin(theta);              % the velocities along y axis
velocity= [x_vel y_vel];        % combining x and y velocities for building a velocity vector for 100 individuals
 
% Creating a vectors for infected, recovered and healthy individuals

infected_persons = rand(no_of_per,1)<intial_infected_per; % building a logical vector of infected persons
healthy_persons = ~infected_persons;                      % generating a logical vector for healthy persons
rec_or_dead_time= ones(no_of_per,1)*0.35;                 % building a recovery_or_dead_time vector
rec_or_dead_persons= zeros(no_of_per,1);                  % generating a recovery_or_dead_persons vector

% creating empty vectors for storing the infected, healthy and recovered
% individual values for each time step for stacked area plot
infected_vect= [];
healthy_vect=[];
recovered_vect=[];

%% Main simulation body

% using for loop to loop through each and every time step
for i=1:length(time)            
    
    % Calculating new position after ecah time step for 100 points 
    new_position = position + velocity.*dt;  
    
    % looping through each point in position vector for determing the infected, healthy and recovered points after each time step
    for j=1:no_of_per           
        
        % if a point is infected and recovered_or_dead_time is completed 
        %then the point is classified as recovered
        if infected_persons(j)&& rec_or_dead_time(j)<=0 
            rec_or_dead_persons(j)=1;     
            infected_persons(j)=0;
            healthy_persons(j)=0;
            
        % if a point is infected and recoverey or dead time is not completed.
        % then decrement the recovery time.
        elseif infected_persons(j)
            rec_or_dead_time(j)= rec_or_dead_time(j)-dt;
        end
        
        % looping through all points and looking for norm distance between two points.
        % if distance less than 0.055 the classifying the points as infected.
        for k = 1:no_of_per
           
            % Creating a two points for calculating the distance between them 
            position_1 = new_position(j,:);
            position_2 = new_position(k,:);
            
            % If the norm distance between two points is less than the
            % radius. then classifying the points as infected
            if norm(position_1-position_2)<=radius
                
                % if either of this points are infected or recovered. the
                % no virus transmission takes place.
                if((infected_persons(j))||(infected_persons(k)))
                    
                    % If either is recovered then no transmission
                    if rec_or_dead_persons(k)
                        infected_persons(k)=0;
                        
                    elseif rec_or_dead_persons(j)
                        infected_persons(j)=0;
                        
                        % Otherwise, transmit virus
                    else
                        infected_persons(j)=1;
                        infected_persons(k)=1;
                        healthy_persons(j)=0;
                        healthy_persons(k)=0;
                    end
                end
            end
        end
    
    % creating a rectangular boundary. when the points collied with walls they
    % are bounced back again.
    
    % Left Wall
        if new_position(j,1)<=hor_limit_start
            
            % if the new position of a point is at the start of a
            % horizontal limit and velocity is negative. then the
            % velocity of the point is reversed.
            if velocity(j,1)<0
                velocity(j,1)=-velocity(j,1);
            end
            
     % Right wall
        elseif new_position(j,1)>=hor_limit_end
            
            % if the new position of a point is at the end of a
            % horizontal limit and velocity is greater than 0 or positive. 
            % then the velocity of the point is reversed.
            if velocity(j,1)>0
                velocity(j,1)=-velocity(j,1);
            end
        end
        
     % Bottom Wall
        if new_position(j,2) <=vert_limit_start
            
            % if the new position of a point is at the start of a
            % vertical limit and velocity is less than 0 or negative. 
            % then the velocity of the point is reversed.
            if velocity(j,2)<0
                velocity(j,2)=-velocity(j,2);
            end
            
      % Top Wall
        elseif new_position(j,2) >=vert_limit_end
            
            % if the new position of a point is at the end of a
            % vertical limit and velocity is greater than 0 or positive. 
            % then the velocity of the point is reversed.
            if velocity(j,2)>0
                velocity(j,2)=-velocity(j,2);
            end
        end
    end
    
    % using for loop for counting number of individuals infected after each
    % time step.
    infected=0;
    for l=1:no_of_per
        if infected_persons(l)==1
            infected= infected+1;
        end
    end
    
    % using for loop for counting number of individuals recovered after each
    % time step.
    recovered=0;
    for m=1:length(rec_or_dead_persons)
        if rec_or_dead_persons(m)==1
            recovered=recovered+1;
        end
    end
    
    % Creating a vector of infected individuals after each time step for
    % stacked-area plot.
    infected_vect(i,1)= infected;
    
    healthy= no_of_per-infected;
    
    % Creating a vector of healthy individuals after each time step for
    % stacked-area plot.
    healthy_vect(i,1)= healthy-recovered;
    
    % Creating a vector of recovered individuals after each time step for
    % stacked-area plot.
    recovered_vect(i,1)= recovered;
    
    % color vector for scatter plot
    color= [infected_persons healthy_persons rec_or_dead_persons];
    
    % scatter plot (dynamic plot)
    figure(1)
     markerSize = 25;
     
     % using scatter plot function for constructing the dynamic plot of
     % points
     scatter(new_position(:,1),new_position(:,2),markerSize,color,'filled','MarkerEdgeColor','k'); 
     axis([hor_limit_start hor_limit_end vert_limit_start vert_limit_end]);
     set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    
     % intializing the new position to old position for next iteration.
     position= new_position;

    
end
drawnow;

% using for loop to create struct for showing the data of infected, healthy
% recovered and infected for each time step.
for i=1:length(time)
        time_individual(i).time_step= time(i);
        time_individual(i).healthy= healthy_vect(i);
        time_individual(i).infected = infected_vect(i);
        time_individual(i).recovered= recovered_vect(i);

end

    
% stacked area plot 
figure(2)

% combining all the vectors to form a matrix for stacked area plot
stacked_matrix= [healthy_vect infected_vect recovered_vect];

% constructing stacked area plot using area plot function.
area(time,stacked_matrix);
xlabel('time');
ylabel('individuals');
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
legend('healthy','infected','recovered');

