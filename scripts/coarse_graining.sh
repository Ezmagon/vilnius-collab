# Check for dssp
cd $SETUP_ROOT
cd 
which dssp
if [[ $? -ne 0 ]]
then
	echo "DSSP binary not found"
	echo "dssp predicts the secondary structure of your protein"
	echo "martinize can work without it, but it is best to quit and install dssp"
	choice
fi

