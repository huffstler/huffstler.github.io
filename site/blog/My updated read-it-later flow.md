<post-metadata>
 <post-title>
  My updated read-it-later flow
 </post-title>
 <post-date>
  2026-03-03
 </post-date>
 <post-tags>
 </post-tags>
</post-metadata>

------

### Moving on from Pocket

Personally, it feels like I'm still in mourning for Pocket. I had a pretty nice setup going when it was still operational;

- A Self-Hosted FreshRSS instance.
- An [accepted feature request](https://github.com/FreshRSS/FreshRSS/discussions/6878) to fire events when articles are starred.
- A [custom plugin (rip)](https://github.com/huffstler/xExtension-StarToPocket) that I forked to send those starred articles directly to Pocket.
- The [RSS App](https://github.com/ReadYouApp/ReadYou), which I do all my reading on.

But those middle parts are gone now... At least the part where I star articles on my phone and they go to Pocket. I was sad and waffling about whether I wanted to self-host something like Wallabag or whatever. I don't like being responsible for keeping things operational, unfortunately, so I was definitely dragging my feet making a decision there. At the same time I was experiencing a different little frustration with my RSS workflow:

> How do I send things that don't have RSS feeds to my reader?

My phone reader is great when reading things that I'm already following... but what if I come across something that's not already there? How do I get that into my "readflow"? (Combo of workflow and reader. I know, very creative.)

### The new shiny

Enter a [small, overlooked submission on HackerNews](https://news.ycombinator.com/item?id=47111280) touting [RSS Librarian](https://github.com/thefranke/rss-librarian). It's a stupid simple idea: provide a target to send links to that adds those links to an RSS feed. You then subscribe to that RSS feed with your reader of choice and you end up with a "Read-it-later" RSS feed! How cool is that?!

Not only is it a good idea, the execution is pretty great too, if you ask me. It's a single small php file and there are no "accounts" that you need to log in to to use it. It assigns a 64 character hash when you use it for the first time. As long as you keep that hash private you have the endpoint to send whatever links you want to read later. It's pretty much exactly what I was looking for.

### The "last mile" problem

There's a bookmarklet generated for you on your Librarian "homepage" which allows you to send whatever page you're on to your "account". It works great when you're using a regular computer, but I wasn't able to get it to work with my phone browser (Firefox). Blegh.

What's the easiest way possible to get a link from a phone to somewhere else? I think it's the 'Share' feature on the phone. Only three clicks from Firefox. Do I want to develop an entire android app for this? Absolutely not. Are there ways to have custom share targets? As it turns out, yes, but more on that in a couple sentences.

I also need the ability to send dynamically generated GET requests to a static url. Is there something I can use to combine my two requirements into one need-fulfilling tool?

[Tasker](https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm). Tasker can do all of that (and way more, but I have no need for the extra features at this moment).

Tasker has a custom "share receiver" which I use to grab the url from a webpage and send a GET request to my "account" on RSS-Librarian. Everything works flawlessly (as long as it keeps running in the background), so now I can send links to a personal read-it-later rss feed from any of my devices!

### Things to note

Librarian does have a limit of 25 items per feed before it starts truncating, but that's not a big deal as I've set up FreshRSS to keep all articles from Librarian indefinitely.

If you're missing Pocket, and don't want to have the responsibility of self-hosting yet-another time sink, this seems like a great choice!
