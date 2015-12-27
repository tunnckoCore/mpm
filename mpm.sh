#!/bin/bash

function mpm () {
  case "$1" in
    "install")  sudo pacman -S $2;;
    "update")   sudo pacman -Syu;;
    "list")	    sudo pacman -Ql $2;;
    "search")	  sudo pacman -Ss $2;;
    "remove")	  sudo pacman -Rs $2;;
    "upgrade") 	mpm delete && sudo pacman -Syyuu;;
    "delete") 	mpm orphans && sudo pacman -Rns $(sudo pacman -Qdtq);;
    "orphans") 	sudo pacman -Qdt;;
    "count")	  sudo pacman -Q | wc -l;;
    "info")	    sudo pacman -Si $2;;
    "sync") 	  sudo pacman -Syy;;
    "cc") 	    sudo pacman -Scc;;
    "db")	      sudo pacman -Q;;
    *) echo "My Pacman Manager - v0.1.0

usage: mpm [command] [<task>]

commands:
  update
  upgrade - mpm delete and pacman -Syyuu
  install <package>
  list [package]
  info <package>
  search <package>
  remove <package>
  delete - apt-get's autoremove
  orphans - list orphans
  count - count installed package
  sync - full sync
  cc - clean cache
  db - list installed packages
    ";;
  esac
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f mpm
else
  mpm "${@}"
  exit 0
fi
