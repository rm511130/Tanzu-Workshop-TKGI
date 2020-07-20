cd ~/.scripts
rm -f fileout.txt errfile.txt
while (true)
   do 
      curl fact.$user.pks4u.com/fact/10 --write-out ",%{time_total}\n" | awk '{
         if (substr($0,1,16)=="<head><title>502") 
                { print "502" >> "errfile.txt"; fflush(stdout) }
           else { print "200" >> "errfile.txt"; fflush(stdout);
                  for(i=1;i<=length($0);i++) 
                     if (substr($0,i,1)==",") 
                       { print substr($0,i+1,5) >> "fileout.txt"; fflush(stdout);}
                }
          }'
   done;
