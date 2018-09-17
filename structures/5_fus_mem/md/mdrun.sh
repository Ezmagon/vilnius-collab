#!/bin/bash

gmx mdrun -s md.tpr -cpi md.cpt -deffnm md &> md.job &
