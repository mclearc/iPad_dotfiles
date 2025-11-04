# Dotfiles for iPad Writing with a-shell
 
 My vim and shell configuration optimized for prose writing on iPad using a-shell.
 
 ## What This Is
 
 Configuration files for a writer-friendly vim environment on iOS/iPadOS. Designed for distraction-free writing, one-sentence-per-line editing, and working with plain text and markdown files.
 
 ## Features
 
 **Vim Configuration:**
 - Distraction-free writing mode with Goyo and Limelight
 - One-sentence-per-line reformatting
 - Spell checking and writing quality tools
 - Vim-pencil for better prose handling
 - Light/dark theme toggle
 - iOS blue cursor with mode-specific shapes
 - Optimized for touch keyboard workflow
 
 **Shell Configuration:**
 - Clean, colorful prompt
 - Writing-focused aliases
 - Git shortcuts
 - Quick navigation commands
 
 ## Installation
 
 ```bash
 cd ~/Documents
 lg2 clone https://github.com/yourusername/dotfiles.git temp-dotfiles
 cp temp-dotfiles/.vimrc .
 cp temp-dotfiles/.bashrc .
 rm -rf temp-dotfiles
 source .bashrc

## Setting Up Vim Plugins
 mkdir -p ~/Documents/.vim/{pack/writing/{start,opt},undo,spell,thesaurus}
 cd ~/Documents/.vim/pack/writing/start
 # Then clone the plugins listed in .vimrc

## Vim Keybindings
  •	Space - Leader key
 	•	Space+g - Toggle distraction-free mode
 	•	Space+t - Toggle light/dark theme
 	•	Space+1 - Reformat paragraph to one sentence per line
 	•	Space+0 - Reflow paragraph
 	•	Space+n - Toggle file explorer
 	•	Space+w - Save file
 	•	Space+r - Reload vimrc
