#!/usr/bin/env bash
set -euo pipefail
project_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
fixture_dir="$(mktemp -d "${project_dir}/../lab/doctor.XXXXXX")"
# Fixture remains in the project lab for inspection; never touches real HOME.
cp -a "$project_dir/payload/." "$fixture_dir/"
bash -n "$project_dir/install-shelldon.sh" "$project_dir/payload/bin/shelldon"
while IFS= read -r -d '' module; do
  zsh -n "$module"
done < <(find "$project_dir/payload/.zsh" -name '*.zsh' -type f -print0)
zsh -n "$project_dir/payload/.zshrc"
desktop-file-validate "$project_dir/payload/.local/share/applications/shelldon.desktop"
SHELLDON_DOCTOR_ROOT="$fixture_dir" "$project_dir/payload/bin/shelldon" doctor
mv "$fixture_dir/.zsh/pure/async.zsh" "$fixture_dir/removed-async"
if SHELLDON_DOCTOR_ROOT="$fixture_dir" "$project_dir/payload/bin/shelldon" doctor; then
  printf 'Doctor failed to detect missing fixture module.\n' >&2
  exit 1
fi
printf 'Shelldon syntax, desktop template and isolated doctor checks passed.\n'
