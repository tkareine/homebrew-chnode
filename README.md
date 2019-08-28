# chnode Homebrew tap

[Homebrew] tap for installing [chnode].

## Install

``` shell
brew tap tkareine/chnode
brew install tkareine/chnode/chnode
```

## Uninstall

``` shell
brew uninstall tkareine/chnode/chnode
brew untap tkareine/chnode
```

## Testing formula

Install tap from local clone of this repository, install and test the
formula, and uninstall the formula and tap:

``` shell
brew tap tkareine/chnode-local ~/Projects/homebrew-chnode
brew audit --strict --online tkareine/chnode-local/chnode
brew install tkareine/chnode-local/chnode
brew test tkareine/chnode-local/chnode
brew uninstall tkareine/chnode-local/chnode
brew untap tkareine/chnode-local
```

Update the master branch of the tap if the upstream repository
(`~/Projects/homebrew-chnode` above) changed:

``` shell
cd "$(brew --prefix)"/Library/Taps/tkareine/homebrew-chnode-local
git fetch origin master
git reset --hard origin/master
```

## License

MIT. See [LICENSE.txt].

[Homebrew]: https://brew.sh/
[LICENSE.txt]: https://raw.githubusercontent.com/tkareine/homebrew-chnode/master/LICENSE.txt
[chnode]: https://github.com/tkareine/chnode
