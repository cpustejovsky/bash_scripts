cd $HOME/development/personal/bashprofile
git fetch
git checkout main
cp bashrc.txt bashrc_old.txt
cp ~/.bashrc bashrc.txt
DIFF=$(diff bashrc.txt bashrc_old.txt) 
echo "made it here"
if [ "$DIFF" != "" ] 
then
    date=$(date +"%F")
    rm bashrc_old.txt
    git checkout -b $date
    git add .
    git commit -m "modified bashrc on $date"
    git push origin HEAD
fi