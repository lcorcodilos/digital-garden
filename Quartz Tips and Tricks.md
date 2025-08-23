---
publish: true
tags:
  - quartz
---
# Useful Links

- [**Quartz 4 documentation**](https://quartz.jzhao.xyz/)
- [**Obsidian documenation**](https://help.obsidian.md/)

# Folders as pages
- Create a folder with the name you want
- Create an `index.md` file inside the folder
- In the frontmatter, add the `title` field with the same title as your folder
	- The folder name won't matter to Quartz; naming it the same is to keep things organized

> [!WARNING]  Folder pages don't render the graph in the upper right of the page

# Publishing opt-out/turn off
The `quartz-hoster` fork of Quartz has filtering turned on so that only pages with the `publish` tag set to `true` in the frontmatter will be rendered. You can turn this off in `quartz.config.ts` but I like the ability to commit all of my content and then opt-in to making the content public.

In `quartz.config.ts` is the following line:
```ts
filters: [Plugin.RemoveDrafts(), Plugin.ExplicitPublish()],
```
Remove `Plugin.ExplicitPublish()` to switch to `draft` being the key field which must be `true` to make a file private (publishing is opt-out because drafting becomes opt-in).

Remove both if you'd like to always publish all notes.

# Common Issues
## I don't see my new content
If you aren't seeing your new content try the following:
- Force refresh your browser page to bypass the cache with `Cmd/Ctrl+Shift+R`
- Double check you put the `publish` field in the frontmatter of the page
- Restart `quartz-hoster` with `docker compose down; docker compose up -d --build`
	- Check logs with `docker compose logs [--follow]`

## I see my new page but the tags aren't appearing
Restart `quartz-hoster` with `docker compose down; docker compose up -d --build`

## Pages I don't want published are appearing
Restart `quartz-hoster` with `docker compose down; docker compose up -d --build`

## I know I can insert Plotly HTML but it isn't working
First make sure you've taken a look at [[Digital Gardening/Plotly Plots for Your Garden]]. There's a basic description there of how to insert an iframe but it's also a working example so have a look at how the path is specified and inspect the webpage to see what's finally rendered.

Then take a look at your `quartz.config.ts`. There should be a plugin called `StripIFramePaths`. Make sure the `obsidianRoot` argument matches the paths you've been using in `iframe`. For example, if your git root in `file:///Users/me/my_vault/folder/plotly.html` is `/Users/me/my_vault/`, then you that's what `obsidianRoot` should be set to. The plugin will figure out the correct paths from there. All it's doing is stripping off `file://` and removing `/Users/me/my_vault/`.

To debug, open the page that isn't rendering the plot and inspect the `iframe`. You'll see what's finally being resolved which should help you figure out the issue.

Note than any assets you want to render in Quartz have to live (and be committed to) the repo you setup in [How do I make a site like this one?](index#How do I make a site like this one?).