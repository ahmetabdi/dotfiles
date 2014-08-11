[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

ssh-add ~/.ssh/kyan_deploy
#source /Users/ahmet/Turbulenz/SDK/0.28.0/start_env
# Spawn local server
# /Users/ahmet/Turbulenz/SDK/0.28.0/start_local.sh

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000

export CC=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/gcc-4.2
export CXX=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/g++-4.2
export CPP=/usr/local/Cellar/apple-gcc42/4.2.1-5666.3/bin/cpp-4.2

# Servers
alias node_1='ssh deploy@176.58.96.162'

# Start delayed_job
alias delayed_job='script/delayed_job stop;script/delayed_job start'
alias cd..='cd ..'
alias ffs='bundle exec rake spec:db:fixtures:load'
alias wtf='ps aux | grep rails'
alias g='bundle exec guard'

#Rails
alias drop='bundle exec rake db:drop'
alias create='bundle exec rake db:create'
alias seed='bundle exec rake db:seed'
alias migrate='bundle exec rake db:migrate'
alias reset='bundle exec rake db:reset'
alias console='bundle exec rails c'

#RubyMotion
alias r='rake'

#SSH
alias sshwhitelegg='ssh deploy@134.213.30.184'

#OPEN
alias subl='open -a /Applications/Sublime\ Text.app'
alias s='open -a /Applications/Sublime\ Text.app'
alias rubymine='open -a /Applications/RubyMine.app/'

#GIT
alias ga='git add -A'
alias gc='git commit -m'
alias gs='git status'
alias gpom='git push origin master'
alias gphm='git push heroku master'

#SAGE
alias rvmsage='rvm use ruby-1.9.3-p194'

# MYSQL
alias mysqlr='mysql.server restart'
alias gotodb='cd /usr/local/var/mysql'

#OTHER
alias config='vi ~/.bash_profile'
alias source_config='source ~/.bash_profile'

alias ls='ls -l -G'
alias grep='grep --color=auto'
alias env='env | sort'

alias c='clear'
alias p='cd ~/Projects'
alias mp='cd ~/MyProjects'
alias payroll='cd ~/Projects/sage/sage_one_payroll'
alias t='cd ~/Projects/titlechallenge'
alias jek='jekyll serve'
alias http='http-server'
alias powrestart='touch ~/.pow/restart.txt'
alias gotoatomdir='cd /Users/ahmet/.atom'
alias be='bundle exec'
alias b='bundle install'
alias goelastic='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'
alias prodcompile='RAILS_ENV=production bundle exec rake assets:clean;RAILS_ENV=production bundle exec rake assets:precompile'
alias proc='foreman start'

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH