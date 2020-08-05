git add .
git pull origin master
git commit -m "update"
git push origin -u master
cd themes/next
git add .
git pull origin master
git commit -m "update"
git push origin -u master
cd ..
hexo clean
while [ ! -f filename ]
do
	hexo g
done
hexo d
