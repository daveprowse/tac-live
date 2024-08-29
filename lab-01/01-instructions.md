# Lab 01 - Install Terraform

> Note: See the README for more information about this entire repository.

Welcome to the first lab!

In this lab you will install the Terraform CLI on to your system. 
Remember, in this course, I am demonstrating on a Debian Linux virtual machine. Let's go!

## Install Terraform from Hashicorp

**Option #1** - Install using your package manager.
https://developer.hashicorp.com/terraform/downloads 

Locate your operating system and install Terraform following the directions.

> Note: For macOS, I recommend the [HomeBrew](https://formulae.brew.sh/formula/terraform) install. For Windows, I recommend using a WSL2 Ubuntu VM (and installing with the Linux method) or the [Chocolatey](https://community.chocolatey.org/packages/terraform) install.

**Option #2** - Install the binary.
https://releases.hashicorp.com/terraform 

Locate the latest version for your platform, download it, verify the checksum, unzip it, and copy it to your binaries directory (for example, /usr/bin or /usr/local/bin).

If you have any issues, ASK QUESTIONS!

> Note: You can also install from [this tutorial link](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) which has a lot of good information on installation methods.

## Verify that Terraform is installed and view the version

`terraform version`

or

`terraform -v`

## Install Terraform autocomplete

- First, make sure that you have an existing .bashrc or .zshrc file.
  
  If not, create one, for example:

    `touch ~/.bashrc`

- Install autocomplete:

  `terraform -install-autocomplete`

- Restart the shell

> Note: This is very helpful for Bash, but not quite as necessary for Fish or ZSH

## Examine the help system

First, analyze the main help command:

`terraform -help`

You could also type the following options:

`terraform --help`, `terraform -h`, or `terraform --h`

Take note of the main commands including: init, plan, validate, apply, and destroy.

Now, learn more about a subcommand.

  For example:
  
  `terraform -h init`

  You could also type: `terraform init -h` if you wish.

## (Optional) Install a VSCode Terraform extension

This can be done directly within VSCode or from one of the following:

- Official Hashicorp extension:

  https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform

- Anton Kulikov extension:

  https://marketplace.visualstudio.com/items?itemName=4ops.terraform

---
## *Congratulations! You just finished your first lab! GREAT WORK!*

---

## (Optional) Configure Vim

If you use Vim, you might want to consider the following:

### Syntax Highlighting With Vim Polyglot

Without some type of syntax highlighting, file displayed in Vim will simply be all white text. This can be stressful on the eyes. 

One way to alleviate this is to use vim-polyglot.
vim-polyglot: https://github.com/sheerun/vim-polyglot

It requires Vim Plug:

https://github.com/junegunn/vim-plug

So we will need to install plug, install vim-polyglot, and configure it for Vim.

> Note: The directions below assume that Vim has not been configured at all. If you already have Vim configured. you may not need all of the directions listed.

1. Install Plug from https://github.com/junegunn/vim-plug

  ```bash
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

2. Install vim-polyglot by modifying .vimrc

  If you don't have a .vimrc file, create one in your home directory:

  ```bash
  set nocompatible

  call plug#begin()

  Plug 'sheerun/vim-polyglot'

  call plug#end()
  ```

3. Install the plugin within Vim
`:PlugInstall vim-polyglot`

4. Reload the .vimrc file
`:vs ~/.vimrc`

### Syntax Highlighting With HashiVim

https://github.com/hashivim

For example, vim-vaultproject or vim-hashicorp-tools (which has multiple HashiVim tools combined)

You can install these as typical Vim packages or with vim-pathogen: https://github.com/tpope/vim-pathogen

### More Vim modifications

You might also wish to add the following to your .vimrc file:

`set number` adds line numbers to files opened with Vim.

`:color <colorscheme>` replace colorscheme with your favorite color, for example: desert, ron, zellner, etc. For a list of colorschemes, do the following:

In Vim, type `:color` then <kbd>Space</kbd> followed by <kbd>Ctrl+D</kdb>
