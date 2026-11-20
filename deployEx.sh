# For initializing (for github codespace, since replit is no longer usable in certain regions):
# 
# ```
# cd themes
# git clone git@github.com:No5972/hexo_next_source.git
# mv hexo_next_source next
# ```
# 
# upload `id_rsa` private key to ~/.ssh/ and chmod to 600

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
