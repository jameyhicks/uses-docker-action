

all:
	mkdir -p output
	# what is the user id of files?
	ls -ln
	# try to run git
	git config --global safe.directory '*'
	git log --oneline | head
	echo hello > output/artifact.txt
