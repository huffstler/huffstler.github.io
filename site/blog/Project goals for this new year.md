<post-metadata>
 <post-title>
  Project goals for this new year
 </post-title>
 <post-date>
  2026-01-07
 </post-date>
 <post-tags>
 </post-tags>
</post-metadata>

------

In the spirit of keeping myself honest about things I want to accomplish this year, I'll be writing them down (in several short posts) and sharing them with the wider world. Hopefully the potential shame of lying to you all will keep me focused on small but consistent changes to the following projects.

## Set up my new server for self hosting

Grabbed an old box from my work, threw some RAM in it, (and Fedora on it) and..... have done nothing since. What I really want to do is host containers on the NUC, while keeping my pihole uncontainerized. Problem is, I want the least amount of things possible in front of my pihole to cut down on packet transfer time, but I _also_ want to use the nifty dns features with pihole to name of all my running services under subdomains. Maybe it's not actually a problem to run pihole in a container, I suppose it will take some testing.

What else apart from pihole am I planning on running? I already have freshrss running on my pi, so I'll probably switch it over to the new server. Probably caddy as a reverse proxy, but after that I'm unsure. Grocy? Home Assistant? Wallabag / Readeck / something else?

##

## Sea Robin Classic Web App

If you know me IRL, you've probably heard about the yearly fishing tournament that I go to in November. My Uncle is the organizer, and they've been doing this since long before I was invited. This year ('26') will be the 29th year in a row they've had it! It's a fun time, the email chain for the current year's tournament is rife with smack-talk months before the tournament is held, and it's been cool getting to know the people that have been doing this for (almost!) three decades now.

The main problem(s) are that the score calculation is done:

- manually
- at night with a little tiny headlamp
- by my uncle
- with pencil and paper
- while definitely not sober

The secondary problem is that everyone knows I'm a programmer. There's been talk about "an app" since my second year at the tournament, and I have unfortunately not found the attention span to really "get on it". There _is_ [a repository](https://github.com/huffstler/SeaRobin-Classic/tree/dev), which does have _some_ code in it, but definitely not anything that would be useful for us yet. Primary goal is to create a rule engine to automate the scoring for my uncle, secondary goal is to develop a UI for the fishermen to submit catches throughout the runtime of the tournament, and a tertiary goal is to get some sort of UI stood up to showcase the current years leader board and probably a history of previous years score as well. We'll see how far I get.
