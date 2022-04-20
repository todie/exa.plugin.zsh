# exa.plugin.zsh

Zsh integration and completions for [exa](https://the.exa.website/), a modern replacement for *ls*.

## Installation

### Using [zplug](https://github.com/zplug/zplug)
Load exa.plugin.zsh as a plugin in your `.zshrc`

```shell
zplug "todie/exa.plugin.zsh", defer:2

```
### Using [zgen](https://github.com/tarjoilija/zgen)

Include the load command in your `.zshrc`

```shell
zgen load todie/exa.plugin.zsh
zgen save
```

### Using [Antigen](https://github.com/zsh-users/antigen)

Bundle exa.plugin.zsh in your `.zshrc`

```shell
antigen bundle todie/exa.plugin.zsh
antigen apply
```

### As an [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) custom plugin

Clone exa.plugin.zsh into your custom plugins repo

```shell
git clone https://github.com/todie/exa.plugin.zsh $HOME/.oh-my-zsh/custom/plugins/exa
```
Then load as a plugin in your `.zshrc`

```shell
plugins+=(exa)
```
