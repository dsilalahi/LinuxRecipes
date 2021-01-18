# check to see if python is installed
function check_python() {
	if [[ $(type python 2>&1) =~ "not found" ]]; then
		echo "'python' is not found. Install python and try again."
    	return 1
	fi


uname -a


# Get Hardware Information
sudo lshw
lshw -short # short summary
sudo lshw -html > hardwareinfo.html


