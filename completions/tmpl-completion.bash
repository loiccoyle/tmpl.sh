# Find the tmpl dir.

_tmpl () {
    local tmpl_dir="$TMPL_DIR"
    [ -z "$tmpl_dir" ] && tmpl_dir="$XDG_TEMPLATES_DIR" && [ -z "$tmpl_dir" ] && tmpl_dir="$HOME/Templates"
    case "${COMP_WORDS[1]}" in
        add )
            [ "${#COMP_WORDS[@]}" -eq 3 ] && COMPREPLY=( $(compgen -W "$(ls)" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -eq 4 ] && COMPREPLY=( $(compgen -W "$(ls $tmpl_dir)" "${COMP_WORDS[-1]}") )
            return
            ;;
        fetch )
            [ "${#COMP_WORDS[@]}" -eq 3 ] && COMPREPLY=( $(compgen -W "$(ls $tmpl_dir)" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -eq 4 ] && COMPREPLY=( $(compgen -W "$(ls)" "${COMP_WORDS[-1]}") )
            return
            ;;
        *)
            [ "${#COMP_WORDS[@]}" -eq 2 ] && COMPREPLY=( $(compgen -W "add fetch" "${COMP_WORDS[-1]}") )
            [ "${#COMP_WORDS[@]}" -ge 3 ] && COMPREPLY=( $(compgen -W "$(ls $tmpl_dir)" "${COMP_WORDS[-1]}") )
            return
            ;;
    esac
}

complete -F _tmpl tmpl
