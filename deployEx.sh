rm -rf .deploy_git
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
cd ..
./node_modules/.bin/hexo clean && ./node_modules/.bin/hexo g && ./node_modules/.bin/hexo d 
