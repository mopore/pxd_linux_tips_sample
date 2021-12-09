```
   ▄███████▄ ▀████    ▐████▀ ████████▄          ▄████████    ▄████████   ▄▄▄▄███▄▄▄▄      ▄███████▄  ▄█          ▄████████ 
  ███    ███   ███▌   ████▀  ███   ▀███        ███    ███   ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███         ███    ███ 
  ███    ███    ███  ▐███    ███    ███        ███    █▀    ███    ███ ███   ███   ███   ███    ███ ███         ███    █▀  
  ███    ███    ▀███▄███▀    ███    ███        ███          ███    ███ ███   ███   ███   ███    ███ ███        ▄███▄▄▄     
▀█████████▀     ████▀██▄     ███    ███      ▀███████████ ▀███████████ ███   ███   ███ ▀█████████▀  ███       ▀▀███▀▀▀     
  ███          ▐███  ▀███    ███    ███               ███   ███    ███ ███   ███   ███   ███        ███         ███    █▄  
  ███         ▄███     ███▄  ███   ▄███         ▄█    ███   ███    ███ ███   ███   ███   ███        ███▌    ▄   ███    ███ 
 ▄████▀      ████       ███▄ ████████▀        ▄████████▀    ███    █▀   ▀█   ███   █▀   ▄████▀      █████▄▄██   ██████████ 
                                                                                                    ▀                      
```

# PXD Linux Terminal Basics and Practical Tips

## What is this repo about?
Aim of this project is to show that an invest in extending Linux terminal know how make things easier for a developer.

## Howto

### Pre-Note 
- All mentioned programs are available for Linux (via distro package managers) and MacOS (via homebrew).
- `ctop` is available via https://github.com/bcicen/ctop

### Instructions

Check out the project and follow the following instructions...
```
git clone https://github.com/mopore/pxd_linux_tips_sample.git
```

On the host system:

Evolution of things:
- top
- htop
- bpytop  (also bashtop)

ssh to HomePiNeo Raspberry Pi 
- showcase fzf as a zsh plugin (search for 'temperature' used as # comment)
- showcase ctop as Docker terminal UI

Pseudo Scenario: 
- Containerized "Function" to "call" a REST API,  if another machine is present.
- All based on a shell script.
- Utilizing 'ping' to check for the other machine.
- If machine is present we run a python script

Showcase "ranger" as a file manager
Step into files and show the integration with a customized vim (on host system).

Run the 'build image' script and then the 'run container' script'

Find out that the ping command is missing...

Create a new temporary container to solve the problem in the container
```
docker run --rm -it pxd_linux_tips_sample /bin/bash
```

Take care of the missing 'ping'

```
apt-get update # Refresh repos
apt-get install -y inetutils-ping # Install ping
```

Run `./main.sh`  again

`apt-get install vim`

Remove the `> /dev/null` part in main.sh

Find out that about the missing entry in /etc/hosts

Add this line to /etc/hosts
```
echo "1.1.1.1 other-machine" | tee /etc/hosts
```

Run it again
Fine!

Enhance vim  with vim JNI vim config
```
cd
git clone https://github.com/mopore/jni-dot-files.git
~/jni-dot-files/vim/install_vim_config.sh
```
- Run vim
- Use `:PlugInstall`
- `source ~/.vimrc`

Extract terminal history to have a template for adapting Dockerfile
How to get the history from the outside?
(Problem: History is bind to one terminal session)

With TMUX and CTOP: open the running container from the host system
Inside of the container: `history  > ~/history.txt`

```
docker exec -it sweet_easley bash -c "cat /root/history.txt" | vim -
```

Adapt the changes to you Dockerfile