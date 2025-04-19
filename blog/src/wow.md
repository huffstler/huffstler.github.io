# NICE

> Things that made me go ^^

----

## Super long pipe command

----

```bash
crontab -l | grep -v '^#' | sort -k2g | grep -Eo '/home/<user>/.*\.sh' | awk '{print $1}' | tr -d '"' | uniq | xargs tail -n +1 | grep -Eo '\s([A-Za-z]\.*){2,}\s[$]' | tr -d '$' | sort -t '.' -k1g | uniq
```

It's non-optimal, I'm sure. But it works enough for what I'm looking for! Bonus points if you can figure out what it does.

### Standouts from above

- `tail -n +1` to print out the file _with the filename as a header_ . Was looking for that exact feature in some hideous incantation of `xargs` + `echo` or something.
- Specifying the delimiter in `sort` with `-t`

----

## Alter _Touchpad_ scrolling sensitivity for Firefox on Gnome

> From: [YoyoEyes](https://www.reddit.com/r/Fedora/comments/1jyi53w/comment/mn1755c)
> You have to got to about:config. From there, search for mousewheel.default.delta_multiplier_y and adjust to your preference. I have it set to 25.

I found 30 to be better for me.
