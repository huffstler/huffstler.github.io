<post-metadata>
 <post-title>
  Moving my blog to Soupault
 </post-title>
 <post-date>
  2025-12-06
 </post-date>
 <post-tags>
 </post-tags>
</post-metadata>

# Moving my blog to Soupault

I _feel_ like all the people I follow have a post like this, so it only makes sense to have one for me as well. Is it actually useful? No, not really I suppose. Does it give me an excuse to write a small thing? Absolutely.

### The before times

Originally, what I did to get thoughts out into the wild was to write a markdown document, and then run pandoc to generate the html files that are served using github pages. I had an index.html in the root of the repo that linked to all of the other html files and it worked just fine. Good ol' regular html, the stuff of yore.

### Nowadays

I write regular markdown files, and they're converted to html files in a `build` directory using [Soupault](https://soupault.net/) with [Github Actions](../.github/workflows/publish.yml). Github Pages then serves the contents of the `build` director for y'all to see. Still good ol' regular html, but with a different path to the same destination.

I've updated the structure of my repo to match what the soupault blog [blueprint](https://github.com/PataphysicalSociety/soupault-blueprints-blog/) expects, makes it much easier to generate.

## Was the switch worth the effort?

It's still pretty early on, but...

- After updating the config file to enable it, I get an RSS feed for "free".
- It's nice not having to do the build step myself before pushing the changes up to Github. Now the process is just writing markdown.
- I can write scripts, and update the config file to enable more features that I deem worthy to spend time on. Nothing is deemed worthy for the time expenditure at the moment.

## Should _you_ switch?

Depends (but really, probably not).

> Do you already have your setup working as you like it?

- Yes
  - Nah probably not worth it. I'm not sure you'll be getting anything out of it except for getting on the treadmill of
- No
  - It _could_ be a good option for you if you're interested in trying to automate building your website. There are other options out there that are more popular, with probably more documentation. But this does work relatively easily, I got it migrated over in a couple of hours.

## Why Soupault instead of <other choice>?

Saw it on Hacker News and thought it seemed pretty neat. I knew that I wanted to update my process and got nerd sniped :) I think it worked out pretty well in the end.
