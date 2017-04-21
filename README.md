# dotfiles

If you use macOS or Linux, you may be at a point where you have configured a lot of your own settings, configurations, or themes within dotfiles. For the uninformed, dotfiles are files in your home directory that begin with a dot, or full-stop character. This indicates to the operating system that they are hidden files, used to set configuration settings for tools like vim, or shells such as bash and zsh to name a few.

## What really matters

This is an unpretentious shell scripting bootstrap to manage configuration files. The idea is to make it as generic as possible, that means when you clone it down it should work for you even though you may not have anything installed. That said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

## Usage

It's pretty straightforward. I personally created an environment variable `$REPO_HOME` pointing to my repo directory, but tailor it to your needs.

```sh
$ git clone https://github.com/g4brielvs/dotfiles.git ${REPO_HOME}/dotfiles
$ cd ${REPO_HOME}/dotfiles
$ ./setup
```

This will symlink the appropriate files to your home directory.
Everything is configured and tweaked within `dotfiles`.

## What's inside

There's a few special files in the hierarchy.

- **\*.symlink**: Any directories ending in `*.symlink` get symlinked into
  your `$HOME`.

- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`.

This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory. These get symlinked in when you run `setup`.

Copyright (c) 2015 Gabriel Vicente

Licensed under the [MIT LICENSE](LICENSE).
