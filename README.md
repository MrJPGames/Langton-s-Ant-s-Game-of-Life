# Langton-s-Ant-s-Game-of-Life
Langton's Ant and Conways Game of Life combined!

Controls:
---
R: Randomize map<br>
C: Clear map and reset Ant's position to center<br>
A: Toggle wheter or not the Ant's simulation is running<br>
L: Toggle wheter or not the Game of Life simulation is running<br>

Settings (in code):
---
- posX, posY and dir are for the ant's simulation.
- antsPerLife sets the amount of ant simulations to run for every simulation of the Game Of Life, set to 1 if you want both to always update.
- simulationsPerFrame sets the amount of simulations run for between every time the screen is rendered. This keeps to the antsPerLife, and as such if they are the same 1 GoL simulation will run every frame.
