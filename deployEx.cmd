git add .
git commit -m "update"
git push origin -u master
cd themes/next
git add .
git commit -m "update"
git push origin -u master
cd ..
# hexo clean
hexo deploy
