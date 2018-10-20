# PDP-Utils
Util scripts to ease the PDP assignment submission process

## zip-submission.sh
Use this script to generate the zip for submission.

#### Setup
1. Save the file zip-submission.sh on the local file system at the suitable path.

   (E.g. "/home/sumeet/scripts/zip-submission.sh").

	**Bash**

	Add the following to your `.bashrc` file:

	```
	function zip-submission(){
	    bash /home/sumeet/scripts/zip-submission.sh
	}
	```

	**Fish**

	Add the following to `/home/sumeet/.config/fish/functions/zip-submission.fish` file
	```
	function zip-submission
		bash /home/sumeet/scripts/zip-submission.sh
	end
	```

#### Usage

1. Go to the root of your IntelliJ project on the command line 

   E.g `cd /home/sumeet/IdeaProjects/CS5010-PDP/Assignments/PDP-Assignment-4`
   
2. run `zip-submission`

   A submission-0.zip will be created in the `submissions` directory under the current directory.    If you run the command multiple times submission-1.zip, submission-2.zip, and so on will be generated. 

   Along with the zip files, a `history.csv` will also be created in the `submissions` directory. And every time a new zip is generated it will be updated with the name of the new zip and its creation date to keep the track of its creation date and time. 
   
   **Note:** If the current working directory is not the root of IntelliJ project then the script would simply exit without creating the zip.

P.S. Have tested the above scripts on Ubuntu 18.04 LTS only.
