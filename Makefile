build: 
	hugo --config config.yml --destination output/

deploy: build
	rsync -av output/ cdrexler@drexler-online.net:/var/www/hugo

ghpages: build
	rsync -av output/ ../xunzi.github.io
	cd ../xunzi.github.io && git add . && git commit -m "new commit" && git push origin master
