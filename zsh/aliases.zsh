
# Docker
alias dk='docker'
alias dka='docker attach'
alias dkb='docker build'
alias dkd='docker diff'
alias dkdf='docker system df'
alias dke='docker exec'
alias dkE='docker exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkh='docker history'
alias dki='docker images'
alias dkin='docker inspect'
alias dkim='docker import'
alias dkk='docker kill'
alias dkkh='docker kill -s HUP'
alias dkl='docker logs'
alias dkL='docker logs -f'
alias dkli='docker login'
alias dklo='docker logout'
alias dkls='docker ps'
alias dkp='docker pause'
alias dkP='docker unpause'
alias dkpl='docker pull'
alias dkph='docker push'
alias dkps='docker ps'
alias dkpsa='docker ps -a'
alias dkr='docker run'
alias dkR='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkRe='docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkRM='docker system prune'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkrn='docker rename'
alias dks='docker start'
alias dkS='docker restart'
alias dkss='docker stats'
alias dksv='docker save'
alias dkt='docker tag'
alias dktop='docker top'
alias dkup='docker update'
alias dkV='docker volume'
alias dkv='docker version'
alias dkw='docker wait'
alias dkx='docker stop'

## Container (C)
alias dkC='docker container'
alias dkCa='docker container attach'
alias dkCcp='docker container cp'
alias dkCd='docker container diff'
alias dkCe='docker container exec'
alias dkCE='docker container exec -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t'
alias dkCin='docker container inspect'
alias dkCk='docker container kill'
alias dkCl='docker container logs'
alias dkCL='docker container logs -f'
alias dkCls='docker container ls'
alias dkCp='docker container pause'
alias dkCpr='docker container prune'
alias dkCrn='docker container rename'
alias dkCS='docker container restart'
alias dkCrm='docker container rm'
alias dkCr='docker container run'
alias dkCR='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm'
alias dkCRe='docker container run -e COLUMNS=`tput cols` -e LINES=`tput lines` -i -t --rm --entrypoint /bin/bash'
alias dkCs='docker container start'
alias dkCss='docker container stats'
alias dkCx='docker container stop'
alias dkCtop='docker container top'
alias dkCP='docker container unpause'
alias dkCup='docker container update'
alias dkCw='docker container wait'

## Image (I)
alias dkI='docker image'
alias dkIb='docker image build'
alias dkIh='docker image history'
alias dkIim='docker image import'
alias dkIin='docker image inspect'
alias dkIls='docker image ls'
alias dkIpr='docker image prune'
alias dkIpl='docker image pull'
alias dkIph='docker image push'
alias dkIrm='docker image rm'
alias dkIsv='docker image save'
alias dkIt='docker image tag'

## Volume (V)
alias dkV='docker volume'
alias dkVin='docker volume inspect'
alias dkVls='docker volume ls'
alias dkVpr='docker volume prune'
alias dkVrm='docker volume rm'

## Network (N)
alias dkN='docker network'
alias dkNs='docker network connect'
alias dkNx='docker network disconnect'
alias dkNin='docker network inspect'
alias dkNls='docker network ls'
alias dkNpr='docker network prune'
alias dkNrm='docker network rm'

## System (Y)
alias dkY='docker system'
alias dkYdf='docker system df'
alias dkYpr='docker system prune'

## Stack (K)
alias dkK='docker stack'
alias dkKls='docker stack ls'
alias dkKps='docker stack ps'
alias dkKrm='docker stack rm'

## Swarm (W)
alias dkW='docker swarm'

## CleanUp (rm)
# Clean up exited containers (docker < 1.13)
alias dkrmC='docker rm $(docker ps -qaf status=exited)'

# Clean up dangling images (docker < 1.13)
alias dkrmI='docker rmi $(docker images -qf dangling=true)'

# Pull all tagged images
alias dkplI='docker images --format "{{ .Repository }}" | grep -v "^<none>$" | xargs -L1 docker pull'

# Clean up dangling volumes (docker < 1.13)
alias dkrmV='docker volume rm $(docker volume ls -qf dangling=true)'

# Docker Machine (m)
alias dkm='docker-machine'
alias dkma='docker-machine active'
alias dkmcp='docker-machine scp'
alias dkmin='docker-machine inspect'
alias dkmip='docker-machine ip'
alias dkmk='docker-machine kill'
alias dkmls='docker-machine ls'
alias dkmpr='docker-machine provision'
alias dkmps='docker-machine ps'
alias dkmrg='docker-machine regenerate-certs'
alias dkmrm='docker-machine rm'
alias dkms='docker-machine start'
alias dkmsh='docker-machine ssh'
alias dkmst='docker-machine status'
alias dkmS='docker-machine restart'
alias dkmu='docker-machine url'
alias dkmup='docker-machine upgrade'
alias dkmv='docker-machine version'
alias dkmx='docker-machine stop'

# Docker Compose (c)
if [[ $(uname -s) == "Linux" ]]; then
  alias dkc='docker-compose'
  alias dkcb='docker-compose build'
  alias dkcB='docker-compose build --no-cache'
  alias dkccf='docker-compose config'
  alias dkccr='docker-compose create'
  alias dkcd='docker-compose down'
  alias dkce='docker-compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
  alias dkcev='docker-compose events'
  alias dkci='docker-compose images'
  alias dkck='docker-compose kill'
  alias dkcl='docker-compose logs'
  alias dkcL='docker-compose logs -f'
  alias dkcls='docker-compose ps'
  alias dkcp='docker-compose pause'
  alias dkcP='docker-compose unpause'
  alias dkcpl='docker-compose pull'
  alias dkcph='docker-compose push'
  alias dkcpo='docker-compose port'
  alias dkcps='docker-compose ps'
  alias dkcr='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
  alias dkcR='docker-compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
  alias dkcrm='docker-compose rm'
  alias dkcs='docker-compose start'
  alias dkcsc='docker-compose scale'
  alias dkcS='docker-compose restart'
  alias dkct='docker-compose top'
  alias dkcu='docker-compose up'
  alias dkcU='docker-compose up -d'
  alias dkcv='docker-compose version'
  alias dkcx='docker-compose stop'
else
  alias dkc='docker compose'
  alias dkcb='docker compose build'
  alias dkcB='docker compose build --no-cache'
  alias dkccp='docker compose copy'
  alias dkccr='docker compose create'
  alias dkccv='docker compose convert'
  alias dkcd='docker compose down'
  alias dkce='docker compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
  alias dkcev='docker compose events'
  alias dkci='docker compose images'
  alias dkck='docker compose kill'
  alias dkcl='docker compose logs'
  alias dkcL='docker compose logs -f'
  alias dkcls='docker compose ls'
  alias dkcp='docker compose pause'
  alias dkcP='docker compose unpause'
  alias dkcpl='docker compose pull'
  alias dkcph='docker compose push'
  alias dkcpo='docker compose port'
  alias dkcps='docker compose ps'
  alias dkcr='docker compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
  alias dkcR='docker compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
  alias dkcrm='docker compose rm'
  alias dkcs='docker compose start'
  alias dkcsc='docker-compose scale'
  alias dkcS='docker compose restart'
  alias dkct='docker compose top'
  alias dkcu='docker compose up'
  alias dkcU='docker compose up -d'
  alias dkcv='docker-compose version'
  alias dkcx='docker compose stop'
fi

# Mutagen
alias mg='mutagen'
alias mgc='mutagen compose'
alias mgcb='mutagen compose build'
alias mgcB='mutagen compose build --no-cache'
alias mgcd='mutagen compose down'
alias mgce='mutagen compose exec -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias mgck='mutagen compose kill'
alias mgcl='mutagen compose logs'
alias mgcL='mutagen compose logs -f'
alias mgcls='mutagen compose ps'
alias mgcp='mutagen compose pause'
alias mgcP='mutagen compose unpause'
alias mgcpl='mutagen compose pull'
alias mgcph='mutagen compose push'
alias mgcps='mutagen compose ps'
alias mgcr='mutagen compose run -e COLUMNS=`tput cols` -e LINES=`tput lines`'
alias mgcR='mutagen compose run -e COLUMNS=`tput cols` -e LINES=`tput lines` --rm'
alias mgcrm='mutagen compose rm'
alias mgcs='mutagen compose start'
alias mgcsc='mutagen compose scale'
alias mgcS='mutagen compose restart'
alias mgcu='mutagen compose up'
alias mgcU='mutagen compose up -d'
alias mgcv='mutagen compose version'
alias mgcx='mutagen compose stop'

# Ansible
alias a='ansible'
alias ap='ansible-playbook'
alias al='ansible-pull'
alias avc='ansible-vault create'
alias ave='ansible-vault edit'
alias avr='ansible-vault rekey'
alias avenc='ansible-vault encrypt'
alias avdec='ansible-vault decrypt'
alias avv='ansible-vault view'
alias aga='ansible-galaxy'
alias agad='ansible-galaxy delete'
alias agai='ansible-galaxy install'
alias agaim='ansible-galaxy import'
alias againf='ansible-galaxy info'
alias agal='ansible-galaxy list'
alias agalog='ansible-galaxy login'
alias agar='ansible-galaxy remove'
alias agas='ansible-galaxy search'

# Find command aliases for Zsh
alias ffn='find . -type f -name' # Find Files by Name
alias fdn='find . -type d -name' # Find Directories by Name
alias ffc='find . -type f | xargs grep -il' # Find Files Containing Text
alias ffd='find . -type f -name | xargs rm' # Find and Delete Files by Name (Use with caution!)
alias ffp='find . -type f -perm' # Find Files by Permission
alias ffm='find . -type f -mtime' # Find Files Modified in the Last N Days
alias ffl='find . -type f -size +' # Find Files Larger Than a Certain Size
alias ffe='find . -type f -exec' # Find and Execute a Command on Found Files

alias als='alias | grep -i ' # Find and Execute a Command on Found Files

# Gradle
alias gw='./gradlew'                    # Run gradlew in the current directory
alias gwb='./gradlew build'             # Build the project
alias gwt='./gradlew test'              # Run tests
alias gwc='./gradlew clean'             # Clean the project
alias gwda='./gradlew assembleDebug'    # Assemble debug build
alias gwra='./gradlew assembleRelease'  # Assemble release build
# Gradle Tasks and Dependencies
alias gwtree='./gradlew dependencies'   # Display the dependency tree
alias gwtasks='./gradlew tasks'         # List all available tasks
# Gradle Daemon Control
alias gwdstart='./gradlew --daemon'     # Start the Gradle daemon
alias gwdstop='./gradlew --stop'        # Stop the Gradle daemon
# Custom Gradle Tasks
alias gwr='gw run'                      # Run the application
alias gwbootRun='gw bootRun'            # Run a Spring Boot application
# Performance and Debugging
alias gwinfo='./gradlew --info'         # Run with info logging
alias gwdebug='./gradlew --debug'       # Run with debug logging
alias gwprofile='./gradlew --profile'   # Run with profiling
# Gradle Wrapper Update
alias gwup='./gradlew wrapper --gradle-version'  # Update the Gradle wrapper to a specific version

# tmux 
alias t='tmux'
# Starting a new tmux session
alias tn='tmux new-session'
# Attaching to an existing tmux session
alias ta='tmux attach -t'
# Detaching from the current tmux session
alias td='tmux detach'
# Listing all tmux sessions
alias tl='tmux list-sessions'
# Killing a tmux session
alias tk='tmux kill-session -t'
# Switching to another tmux session
alias ts='tmux switch -t'

