cd ~/.scripts
tail -f errfile.txt | asciigraph -r -h 10 -w 40 -c "HTTP Status Code"
