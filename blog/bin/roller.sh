#!/bin/bash

header() {
	echo """<?xml version='1.0' encoding='UTF-8' ?>
<rss version='2.0' xmlns:atom='http://www.w3.org/2005/Atom'>
<!-- Made using rss-roller https://github.com/maxhebditch/rss-roller -->
""" >~/feedtop
	echo """
<channel>
<title>$title</title>
<link>$link</link>
<description>$description</description>
<atom:link href='$rsslink' rel='self' type='application/rss+xml' />
""" >>~/feedtop
	echo "adding the header"
}

footer() {
	echo """
</channel>

</rss>
""" >>~/feedbottom
	echo "adding the footer"
}

item() {
	if [[ $mode == "a" ]]; then
		echo """<item>
        <title>$fullTitle</title>
        <link>$linkadd</link>
        <guid>$guid</guid>
        <description>$extract</description>
        </item>
        """ >>~/feed
	elif [[ $mode == "m" ]]; then
		echo """<item>
        <title>$fullTitle</title>
        <link>$linkadd</link>
        <guid isPermaLink='false'>$guidadd</guid>
        <description>$extract</description>
        </item>
        """ >>~/feed
	fi
}

combine() {
	header
	footer
	cat ~/feedtop ~/feed >~/feedtb
	cat ~/feedtb ~/feedbottom >$feedname
	rm ~/feedtop ~/feed ~/feedtb ~/feedbottom
}

makeRSS() {
	echo "feed does not exit already, going to make from scratch"
	echo """
        CONFIGURATION
        =============
        """
	read -p "What is your website called?: (e.g Google) " title
	read -p "What is the link to the website?: (e.g http://google.com) " link
	read -p "Give a brief description of your website: (e.g A search engine) " description
	read -p "Give the URL to where the rss feed will live: (e.g http://google.com/rssfeed.xml) " rsslink
	read -p "What will be the feed file live on the disk?: (e.g /home/dog/www/rssfeed.xml has to match above) " feedname
	read -p "Where is the file path for the posts? (leave blank if you are not using auto mode): " postDir
	echo -e "title=$title\nlink=$link\ndescription='$description'\nrsslink=$rsslink\nfeedname=$feedname\npostDir=$postDir" >~/.rss-roller.rc
	echo "please run rss-roller again with the --auto or --manual flags"
	exit
}

if [[ ! -f ~/.rss-roller.rc ]]; then
	makeRSS
fi

source ~/.rss-roller.rc

if [[ ! -f $feedname ]]; then
	touch $feedname
fi

if [[ $1 == "--auto" ]]; then
	mode=a
	#Do the bad thing
	if [[ -f $feedname ]]; then
		rm $feedname
	fi
	touch $feedname
	postArray=($(ls -r "$postDir"/*.html))
	numPosts=$(ls "$postDir"/*.html | wc -l)
	echo "numposts is $numPosts"
	postNum=0
	guidadd=$linkadd
	for posts in "${postArray[@]}"; do
		let postNum+=1
		post=$posts
		echo "adding post $postNum/$numPosts"
		fullTitle=$(grep -o '>.*</h1>' $post | sed 's/\(>\|<\/h1>\)//g')
		postname=${post##*/}
		linkadd="$link"/"$postname"
		extract=$(sed -n '/<p>.*/,/*.<\/p>/{p;q;}' $post | sed -e 's/<[^>]\+>/ /g' -e 's|<p>||g' -e 's|</p>||g' -e 's|"||g')
		item $post
	done
	combine
	exit
fi

if [[ $1 == "--manual" ]]; then
	mode=m
	echo """
        NEW POST
        =======
        """
	read -p "What is the title of the new update?: " fullTitle
	read -p "What is the link of the new update?: " linkadd
	read -p "Provide a description of the new update: " extract
	read -p "Provide a unique identifier for the update: " guidadd
	if [[ -f $feedname ]]; then
		sed -e '1,10d' $feedname >~/rssrollertopless
		head -n -4 ~/rssrollertopless >~/rssrollertopandbottomless
		mv ~/rssrollertopandbottomless $feedname-old
		rm ~/rssrollertopless
		rm $feedname
	else
		touch $feedname
	fi
	item
	if [[ -f $feedname-old ]]; then
		mv ~/feed ~/feedtop
		cat ~/feedtop $feedname-old >~/feed
		rm $feedname-old ~/feedtop
	fi
	combine
	exit
fi

if [[ $# == 0 ]]; then
	echo "please use the --auto or --manual flag"
fi
