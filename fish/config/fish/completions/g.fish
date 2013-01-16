function __fish_git_aliases
  git config --get-regexp alias | sed "s/^alias\.\([^ ]*\).*/\1/"
end

function __fish_git_branches
  git branch --no-color -a ^/dev/null | grep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///'
end

function __fish_git_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'g' ]
    return 0
  end
  return 1
end

function __fish_git_using_command
  set arg_pos 1
  if test (count $argv) = 2
    set arg_pos $argv[2]
  end

  set cmd (commandline -opc)
  if [ (count $cmd) -gt $arg_pos ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c g

# Aliases
complete -c g -n '__fish_git_needs_command' -a '(__fish_git_aliases)' -d 'Alias'

# pull
complete -c g -n '__fish_git_needs_command' -a pull -d 'Fetch from and merge with another repository or a local branch'
complete -f -c g -n '__fish_git_using_command pull' -a '(git remote)' -d 'Remote alias'
complete -f -c g -n '__fish_git_using_command pull 2' -a '(__fish_git_branches)' -d 'Branch'

# push
complete -c g -n '__fish_git_needs_command' -a push -d 'Update remote refs along with associated objects'
complete -f -c g -n '__fish_git_using_command push' -a '(git remote)' -d 'Remote alias'
complete -f -c g -n '__fish_git_using_command push 2' -a '(__fish_git_branches)' -d 'Branch'

# stash
complete -c g -n '__fish_git_needs_command' -a stash -d 'Stash away changes'
complete -f -c g -n '__fish_git_using_command stash' -a list -d 'List stashes'
complete -f -c g -n '__fish_git_using_command stash' -a show -d 'Show stashed changes'
complete -f -c g -n '__fish_git_using_command stash' -a pop -d 'Apply and remove stashed changes'
complete -f -c g -n '__fish_git_using_command stash' -a apply -d 'Apply stashed changes'
complete -f -c g -n '__fish_git_using_command stash' -a drop -d 'Remove stash'
complete -f -c g -n '__fish_git_using_command stash' -a clear -d 'Remove all stashes'

# cherry-pick
complete -f -c g -n '__fish_git_needs_command' -a cherry-pick -d 'Apply the change introduced by an existing commit'
complete -f -c g -n '__fish_git_using_command cherry-pick' -a '(__fish_git_branches)' -d 'Branch'
