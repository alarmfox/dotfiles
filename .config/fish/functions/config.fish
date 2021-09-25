function config --wraps='/usr/bin/git --git-dir=/home/giuseppe/dotfiles/ --work-tree=/home/giuseppe' --description 'alias config=/usr/bin/git --git-dir=/home/giuseppe/dotfiles/ --work-tree=/home/giuseppe'
  /usr/bin/git --git-dir=/home/giuseppe/dotfiles/ --work-tree=/home/giuseppe $argv; 
end
