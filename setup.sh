#!/bin/bash
set -e

#Three different lipid compositions
#
#1. 100% DOPC
#2. 70% DOPC; 30% Cholesterol
#3. 68.5% DOPC; 28.5% Cholesterol; 3% DGS-NTA(Ni)
#
# CG lipids:
# DOPC
# Cholesterol
# DFMG as DGS-NTA analog
#
#All with OmpA membrane domain (1QJP)
#and Anti-GFP nanobody camelid single chain (3OGO)

# User friendly ask for input
echo "This script will automatically download all the required files and tools needed to simulate the Vilnius 2018 iGEM team's system"
function choice() {
	echo "Proceed? [Y/n]"
	continue=0
	while [[ $continue == 0 ]]
	do
		ans=''
		read ans
		case $ans in
			y|Y)
				#Continue
				continue=1
				;;
			n|N)
				#Quit
				exit 0
				;;
			*)
				echo "Unknown input please try again"
				;;
		esac
	done
}
choice

# Define some global variables
SETUP_ROOT=$(pwd)

# Test for gromacs
which gmx &> /dev/null
if [[ $? -ne 0 ]]
then
	echo "Please install gromacs first and source the RC script"
	echo "Download gromacs here: http://manual.gromacs.org/documentation/2018.2/download.html"
	exit 1
fi

# Create folders if necessary
mkdir -p ./source ./source/ndx ./source/mdp ./source/gro ./source/top ./source/temp ./source/itp ./structures ./md ./md/nvt ./md/md ./md/npt ./md/em ./tools ./scripts 

# Fetch structures
source scripts/fetch_structures.sh

# Get tools
source scripts/get_tools.sh


