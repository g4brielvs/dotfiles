# dotfiles

If you use OS X or Linux on your desktop/servers, you may be at a point where you have configured a lot of your own settings, configurations, or themes within dotfiles. For the uninformed, dotfiles are files in your home directory that begin with a dot, or full-stop character. This indicates to the operating system that they are hidden files, used to set configuration settings for tools like vim, or shells such as bash and zsh to name a few.

## What really matters 

This is an unpretentious shell scripting bootstrap to manage configuration files. The idea is to make it as generic as possible, that means when you clone it down it should work for you even though you may not have anything installed. That said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency. In the future, I wil try to make it get along with another project of mine: the [PowerBook](https://github.com/gabrielusvicente/powerbook).

## Usage

It's pretty straightforward. I personally created an environment variable $PROJECT_HOME pointing to my project directory, but tailor it to your needs.

```sh
$ git clone https://github.com/gabrielusvicente/dotfiles.git ${PROJECT_HOME}/dotfiles
$ cd ${PROJECT_HOME}/dotfiles
$ ./bootstrap
```

This will symlink the appropriate files in `dotfiles` to your home directory.
Everything is configured and tweaked within `${PROJECT_HOME}/dotfiles`.

## What's inside

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

Copyright (c) 2015 Gabriel Vicente

Licensed under the [MIT LICENSE](LICENSE).





