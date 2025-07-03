---
title: Start/End of Line Behavior on MacOS
publish: true
tags:
  - macos
  - fix
---
When I got my personal Macbook, I had a hard time with the Fn+left and Fn+right key combinations. On my work Macbook, these take me to the beginning and end of each line, whether in a text editor, code editor, terminal, form box, whatever.

I have no recollection of setting this up but it's a learned keyboard shortcut, nonetheless. Switching between a system that supports it and one that doesn't (with nearly everything else the same) is super annoying. I tried switching to Ctrl+A/E instead but with only bad habits reoccurring. I thought I might be able to pull off the switch since I used to use these when I ran Linux in grad school.

I tried to find the solution for a system-wide fix several times but it was always while I was in the middle of something else. Today, I again started work on something, only to quickly run into the issue again. This time I had time though and figured out a formula that I *think* has worked. I'm recording the steps here should I need them again in the future! (or need to edit them if they turn out to be incomplete)

### Iterm2
- Go to settings
- Go to `Keys`
- Under "Key Bindings"
- For Fn+left, use "Send Hex code" and use 0x01 (equivalent of Ctrl+A)
- For Fn+left, use "Send Hex code" and use 0x05 (equivalent of Ctrl+E)
### zsh
In .zshrc, add
```
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
```

### MacOS
In `~/Library/KeyBindings.DefaultKeyBinding.dict`, add 
```
{
  "\UF729"  = moveToBeginningOfParagraph:; // home
  "\UF72B"  = moveToEndOfParagraph:; // end
  "$\UF729" = moveToBeginningOfParagraphAndModifySelection:; // shift-home
  "$\UF72B" = moveToEndOfParagraphAndModifySelection:; // shift-end
  "^\UF729" = moveToBeginningOfDocument:; // ctrl-home
  "^\UF72B" = moveToEndOfDocument:; // ctrl-end
  "^$\UF729" = moveToBeginningOfDocumentAndModifySelection:; // ctrl-shift-home
  "^$\UF72B" = moveToEndOfDocumentAndModifySelection:; // ctrl-shift-end
}
```
Restart the computer.
