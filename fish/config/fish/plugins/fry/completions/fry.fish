# fish completion for fry
function __fish_fry_needs_command
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'fry' ]
    return 0
  end
  return 1
end

function __fish_fry_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_fry_rubies
  fry ls
end

function __fish_fry
  fry help | grep '  ' \
    | sed 's/^[ ]*//; s/<.*> //; s/[[:blank:]]/'(printf '\t')'/'
end

complete -f -c fry -n '__fish_fry_needs_command' -a '(__fish_fry)'
complete -f -c fry -n '__fish_fry_needs_command' -a '(__fish_fry_rubies)' -d 'Ruby'
complete -f -c fry -n '__fish_fry_using_command use' -a '(__fish_fry_rubies)' -d 'Ruby'
