# Compiling from Source on Mac

Error: Trying to get GDK and RGdk2 and get: "...installation of package ‘RGtk2’ had non-zero exit status"

Possible fix from https://www.kaggle.com/c/titanic/discussion/40868

"Dude sums it up. https://gist.github.com/sebkopf/9405675#troubleshooting-for-gtk-224-issues
I needed to get GDK and RGdk2 in from the previous article. 
Then I was able to continue with rattle and CairoDevice by referring to this GitHub article, too. 
His solution incorporates much of the same as the other one. https://gist.github.com/zhiyzuo/"

"GDK+ hasn't been upgraded to work with XQuartz. Part of the key to this solution is forcing invocation of the old X11."

"do this all from the same terminal that worked for GDK and RGdk2. I did it, and it worked. 
In other words, don't switch contexts in the middle of all this and go back to RStudio or some other instance of R in another Terminal session
do install one of the packages." 

