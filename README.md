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

The pandemic simulation is based on an agent-based model that mimics real-world scenarios. The key components of the simulation idea are as follows:

- **Agent-Based Model:**
  - Individuals are represented as points moving within a defined space (box).
  - Each individual has random speed components (𝑣𝑣𝑥𝑥, 𝑣𝑣𝑦𝑦).
  - Individuals bounce off the walls of the box if they collide.
  - At the beginning of the simulation, a small percentage of individuals are infected.
  - Infected individuals can spread the infection to healthy individuals when in proximity.
  - After a certain time, infected individuals recover and can no longer infect or be infected.

## Initialization of Model

- Each individual is initialized with the following properties:
  - Random 𝑥𝑥 and 𝑦𝑦 position in a given area.
  - Random 𝑣𝑣𝑥𝑥 and 𝑣𝑣𝑦𝑦 speeds in the interval -1 to 1.
  - 10% of individuals are initially infected, and the others are healthy.

## Motion of Individuals

- The simulation is performed for a specified time range (0 to 1) with a time step (dt) of 0.001 seconds.
- Individuals move based on their predefined speeds in the x and y directions.
- If an individual leaves the simulation area, it bounces off the boundary, changing its direction of travel (using the "Angle of Incidence = Angle of Reflection" principle).

## Infection of Individuals

- Each individual can be in one of three states: Healthy (green), Infected (red), or Recovered/Dead (blue).
- Infection status is updated at each time step.
- Infected individuals recover or die after 0.35 seconds.
- Infection can spread if the distance between an infected person and a healthy person is less than 0.055.

## Task Descriptions

- Tasks are specified for different setups, each requiring a unique script.
- Tasks involve dynamic plotting of moving individuals and creating stacked area plots of infections over time.
- Additional tasks include simulating varying numbers of individuals and evaluating the accuracy of the agent-based model.

## Requirements

- MATLAB version above 2019b

## Usage

1. Clone the repository:

```bash
git clone https://github.com/[your-username]/pandemic-simulation.git
