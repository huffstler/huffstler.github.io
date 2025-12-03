# JAR files are just ZIPs... and how VIM relates to that thought

I honestly have no recollection of how I learned this first fact. I'm sure it was while I was at my very first job out of college at a regional bank. Java 7 was what we used, and Java 8 was the shiny new thing. Every web-app ran on tomcat (no containers!!) with JSP's as the UI.

I remember my manager at the time helping me work through some issue I was having, probably related to the fat-jar not finding the classes I needed on the classpath. (Due to me borking the maven build definition)

> Me: How do I know where it's looking to find the dependencies?
> Him: Just open it up and look at the manifest.
> Me: What?
> Him: Yea, jar files are basically just a zip file. You can change the extension and open it in your file explorer. Rename it back to `<filename>.jar` and you're good to go.
> Me: Oh. Wow, that's cool.

That's been a nice little tidbit to have in the back of my head, been rather helpful from time to time.

Oh, also Vim can open and navigate through ZIP files with the default `zip.vim` plugin

I stumbled across [this reddit post](https://www.reddit.com/r/vim/comments/tx2and/today_i_learned_that_you_can_use_vim_to_interact/) some time ago. This was a really nice find, as it removed a couple steps that I usually took in order to look at or alter data in zip files.

### before

```bash
curl getzip.com/foo.zip foo1.zip
unzip foo1.zip foo
vim foo/bar.txt
zip foo/ foo.zip
rm -r foo foo1.zip
```

### after

```bash
curl getzip.com/foo.zip
vim foo.zip/bar.txt
```

Can you see where this post headed?

Today at work, I had to do a bit of investigation. We have a cron job running that's not behaving and we don't know why. The logging isn't helpful, it's a large java project with haphazardly unstructured classes, and the jar file name isn't called anything that turned up in a search through the source. So, how can little ol' me find out what class is actually being used when the jar is executed? VIM BABY.

```bash
vim foo.jar/META-INF/MANIFEST.mf

# file contents below
  Manifest-Version: x.y
  Main-Class: org.foo.bar.NameNotRelatedToJarName.java <-- (This is the important part)
  Class-Path: <other things>
```

> Oh look, there's the main class name. I wonder if I can search tha- yup there's what I needed!
