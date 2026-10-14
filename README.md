# Shelldon

A personal Zsh/Kitty terminal bundle: turtle prompt for normal shells, a
distinct elevated-shell appearance, a diagnostic command and desktop icon.
This is Dillon Ginsburg's independently directed customization, developed with
AI-assisted implementation—not a claim to have written Kitty, Zsh or Pure.

## Layout and lineage

`install-shelldon.sh` installs the maintained `payload/`. The earlier standalone
shell layout and exported ZIP remain in Git history and verified local recovery
archives; the source no longer maintains two competing layouts. This is source
consolidation, not an upgrade of the running terminal configuration.

The prompt builds on **Pure**, by Sindre Sorhus, and **zsh-async**, by Mathias
Fredriksson. Their source attribution remains intact. Third-party license notices
must remain with distributions. No separate license for the original installer
is declared here.

## Inspect before installing

Run `./tests/check.sh` for syntax and an isolated payload doctor test. It does
not install packages, launch a terminal, alter shell configuration or request sudo.

For an intentional installation, first review the payload and back up your
existing `.zshrc`, Zsh modules, launcher and icons. Then run:

```sh
./install-shelldon.sh
```

The installer supports Fedora/DNF and Debian/Ubuntu/APT, may request sudo for
packages, and copies configuration into your home directory. It can open a new
terminal at the end. Do not run it during a foreground task you cannot interrupt.
The source desktop template is portable; installation renders its actual path.

After installation: `shelldon doctor`. `shelldon unleashShell` and `suroot`
explicitly invoke sudo; root's default login shell is not changed. Privileged
execution and live desktop installation are not qualified by the fixture test.
