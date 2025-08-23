---
title: Welcome
date: 2025-04-01
publish: true
---
Here you'll find a record of different work I've done since finishing my PhD, in full gory detail. I record this work locally in Obsidian where I have full control over my work, how it's organized, and how it's recorded (fully portable Markdown, please and thank you). This site is a projection of that work so it can be easily shared with others via Quartz.

For non-linear, interrelated technical projects, I find this format to be the most rewarding to build. And, I rather start from a platform where I can do *anything* and project that down into *something* that I can share with others.

# How do I make a site like this one?
## Local setup
- Install Obsidian
- Create a Vault
	- Under Settings -> Files and links, set "New link format" to "Absolute path in vault" to ensure image links in your MD files work
- Populate your vault with a note named "index" that contains a welcome page (that's what this page is!)
	- Make sure to add a basic frontmatter so "index" isn't displayed
```
---
title: Home
publish: true
---
```

## Hosting with GitHub Pages
Great instructions from the creator of Quartz can be found [here](https://quartz.jzhao.xyz/hosting#github-pages)

## Hosting on a Personal Server
One option not covered well by the Quartz documentation is hosting on your personal server while still being able to use git for version control. Here's how you can set that up:

- On a server, create a space to run Quartz 4
	- `git clone git@github.com:lcorcodilos/quartz-hoster.git`
	- Note this is a fork of `https://github.com/jackyzha0/quartz.git` with a few small changes, including a script to setup a git repo to push to here
- Setup Quartz 4
	- Run `./git_content_setup.sh` to setup a git repository you can push to
	- In `quartz.config.ts`, modify the following fields to your liking
		- `pageTitle`
		- There lots of other fields here to play with and a url at the top to see what they do
		- You can also look at the commit history to see things I've messed with
	- You can change the layout with `quartz.layout.ts` but leave this as-is for now

### Serving options
- (A) Run Quartz as a container and connect to the development server
	- `docker compose up --build -d`
		- The `--build` forces an image rebuild which I've found to be necessary when modifying the Quartz configs
	- You should now be able to access `localhost:8080` or `<my ip>:8080` or `mydomain:8080`, depending on your setup
- (B) Setup Nginx following the standard nginx setup instructions [here](https://ubuntu.com/tutorials/install-and-configure-nginx#1-overview).
	- When you setup the config in `sites-enabled`, use the `nginx.conf` file from `quartz-hoster`.

### Syncing the personal server
We need a way to get the content from your local vault to the remote `content/` folder and we'll use git to do it. In the previous step, we already setup the server.

To setup your local vault, go into it (with a CLI) and run
```
git init
git remote add origin user@machine:~/path/to/quartz-hoster/content.git
```
It's helpful if SSH keys are setup on `machine` already.

Now you should be able to commit your notes as you wish and push them to the new remote. This should publish your content instantly to Quartz.
## Git Plugin
There is a Git community plugin for Obsidian that gives you a stage/commit/push interface similar to VS Code. You can install and use this to push updates right from Obsidian.

## Optional Extras

See [[Quartz Tips and Tricks]] for some useful ways to organize your files and more.
### Themes
Follow the instructions on [this GitHub](https://github.com/saberzero1/quartz-themes) to get a helper script that applies themes to Quartz. Note that the previews are based on the `dev` branch so you may need to use that version to get the version of the theme you're expecting.
### Quartz Customization
- [Quartz](https://quartz.jzhao.xyz/) has a plethora of customization options that you can add into `quartz-hoster`
- As a simple example, Quartz supports certain [frontmatter tags](https://quartz.jzhao.xyz/plugins/Frontmatter) that will enhance the information displayed on a page.

