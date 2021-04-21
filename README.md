# tmpl

> the XDG_TEMPLATES_DIR CLI you never thought you needed <sub>and probably don't.</sub>

Are you a command line user? Have you ever thought "wow that ~/Templates folder sure is useless, it just sits there wasting valuable bytes?! Who allowed it into my $HOME?"? Well no more! It's about time you put it to good use!

Popular file manager GUIs, like Thunar or Nautilus use it to store templates when making new files. Finally! Let's end this template discrimination, here is the eagerly awaited, bug free* cli to add and fetch templates with EASE!

Turn your `$XDG_TEMPLATES_DIR` into a tmpl of templates! <sub>it's the best I had...</sub>

# Installation

Just plop the `tmpl` file in your `$PATH`, make sure it's executable. And put the completions file of your shell somewhere it knows about.

Note: The bash completion needs a face lift...

# Usage

`tmpl` respects the `$XDG_TEMPLATES_DIR` variable but can also store it's templates in another directory if the `$TMPL_DIR` variable is set. If none are set it will fall back on `$HOME/Templates`.

There are 2 subcommands, `add` and `fetch`, they are quite self explanatory, but for completion's sake:

* `add`:
	* add `setup.py` file to tmpl folder as `setup.py`:
      ```bash
      tmpl add setup.py
      ```
    * add `package` folder as `pypackage`:
      ```bash
      tmpl add package/ pypackage
      ```
    * add `setup.py` to tmpl folder as `setup.py` and edit the template using `$EDITOR`:
      ```bash
      tmpl -e add setup.py
      ```
	* add `LICENSE` to tmpl folder as `LICENSE_MIT`:
      ```bash
      tmpl add LICENSE LICENSE_MIT
      ```
    * add this README as `README.md`:
      ```bash
      tmpl add https://raw.githubusercontent.com/loiccoyle/tmpl.sh/master/README.md
      ```
    * with git shorthand (can specify the branch with `-b`, default is `master`) works with gitlab too:
	  ```bash
      tmpl add -b master gh:loiccoyle/tmpl.sh/README.md
      ```
    * from stdin to `LICENSE_GPL`:
      ```bash
      curl -s https://api.github.com/licenses/gpl-3.0 | jq -r .body | tmpl add - LICENSE_GPL
      ```
* `fetch`, a glorified `cp`:
  * fetch `setup.py` to `./setup.py` and edit:
    ```bash
    tmpl -e fetch setup.py
    ```
  * fetch `LICENSE_MIT` to stdout:
    ```bash
    tmpl fetch LICENSE_MIT -
    ```

Any command can be run in the tmpl folder by preceding it with `tmpl`, some examples:
* list templates:
  ```bash
  tmpl ls
  ```
* setup git repo in tmpl folder:
  ```bash
  tmpl git init
  ```
The possibilities are endless! oOoOoO

<sub>* any bugs will be referred to as features</sub>
