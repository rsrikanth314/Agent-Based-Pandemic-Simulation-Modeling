# Pandemic Simulation Project

## Overview

This repository contains the code for an agent-based pandemic simulation developed as part of the SAM Exercise at the Institute for Computational Physics in Engineering. The simulation models the movement and spread of infections among individuals within a defined space.

## Table of Contents

- [Simulation Idea](#simulation-idea)
- [Initialization of Model](#initialization-of-model)
- [Motion of Individuals](#motion-of-individuals)
- [Infection of Individuals](#infection-of-individuals)
- [Task Descriptions](#task-descriptions)
- [Requirements](#requirements)
- [Usage](#usage)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)

## Simulation Idea

The simulation is based on an agent-based model where individuals move randomly within a specified area. Infected individuals can spread the infection to healthy individuals upon proximity.

## Initialization of Model

- Individuals are initialized with random positions and speeds.
- 10% of individuals are initially infected, and the rest are healthy.

## Motion of Individuals

- Individuals move within the simulation area based on predefined speeds.
- Bouncing off boundaries is implemented using the "Angle of Incidence = Angle of Reflection" principle.

## Infection of Individuals

- Individuals can be in one of three states: Healthy (green), Infected (red), or Recovered/Dead (blue).
- Infection status is updated at each time step.
- Infected individuals recover or die after 0.35 seconds.
- Infection can spread if the distance between an infected and healthy individual is less than 0.055.

## Task Descriptions

- Tasks are specified for different setups, each requiring a unique script.
- Tasks involve dynamic plotting of moving individuals and creating stacked area plots of infections over time.

## Requirements

- MATLAB (version [your MATLAB version])

## Usage

1. Clone the repository:

```bash
git clone https://github.com/[your-username]/pandemic-simulation.git
