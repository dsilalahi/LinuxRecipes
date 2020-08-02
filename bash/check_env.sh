# check to see if python is installed
function check_python() {
	if [[ $(type python 2>&1) =~ "not found" ]]; then
		echo "'python' is not found. Install python and try again."
    	return 1
	fi