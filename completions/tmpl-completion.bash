# Find the tmpl dir.
[ -z $TMPL_DIR ] && TMPL_DIR=$XDG_TEMPLATES_DIR && [ -z $TMPL_DIR ] && TMPL_DIR=$HOME/Templates

_tmpl () {
    case "${COMP_WORDS[1]}" in
        add )
            [ "${#COMP_WORDS[@]}" -eq 3 ] && COMPREPLY=( $(compgen -W "$(ls)" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -eq 4 ] && COMPREPLY=( $(compgen -W "$(ls $TMPL_DIR)" "${COMP_WORDS[-1]}") )
            return
            ;;
        fetch )
            [ "${#COMP_WORDS[@]}" -eq 3 ] && COMPREPLY=( $(compgen -W "$(ls $TMPL_DIR)" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -eq 4 ] && COMPREPLY=( $(compgen -W "$(ls)" "${COMP_WORDS[-1]}") )
            return
            ;;
        *)
            [ "${#COMP_WORDS[@]}" -eq 2 ] && COMPREPLY=( $(compgen -W "add fetch" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -ge 3 ] && COMPREPLY=( $(compgen -W "$(ls $TMPL_DIR)" "${COMP_WORDS[-1]}") )
            return
            ;;
    esac
}

complete -F _tmpl tmpl

