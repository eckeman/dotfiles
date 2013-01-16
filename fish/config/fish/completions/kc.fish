# fish completion for kviberg-config

complete -f -c kc -a update -d 'Updates the database'
complete -f -c kc -a export -d 'Exports the database'

complete -f -c kc -l no-xip -d 'Do not generate xip domains'