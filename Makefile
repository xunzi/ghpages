build: 
	hugo

deploy: build
	rsync -av output/ cdrexler@drexler-online.net:/var/www/hugo
