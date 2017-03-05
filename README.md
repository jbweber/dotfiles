# dotfiles

This repository contains my dotfiles. To use them clone the repository to
~/.dotfiles and execute update.sh followed by setup.sh.

## update submodules

```git submodule foreach git pull origin master```

## add new submodule
```git submodule add https://github.com/jbweber/submodule submodule```

## keychain
keychain is used to manage ssh and gpg keyrings. The scripts here were
adopted from the fedora keychain package and allow for configurable use
of keychain outside of checking in configuration to git.

Create the file ~/.keychainrc to set configuration

KCHOPTS=""
    This variable takes options for keychain like "--nocolor" or "--noask".
    Please see the keychain manpage for a full list.
SSHKEYS=""
    Instead of loading all keys the user can list those keys to be loaded by
    their file names. The key list has to be space separated.
GPGKEYS=""
    gpg keys to be loaded by keychain have to be specified by their key ID.
    The user can get a full list of keys and IDs in his secret keyring by
    running `gpg --list-secret-keys'. GPGKEYS defines a single key ID or a
    space separated list of key IDs.
