set allow-duplicate-recipes
set allow-duplicate-variables
import? 'snaps.just'

[private]
@default:
  just --list
  echo ""
  echo "For help with a specific recipe, run: just --usage <recipe>"

# No-op: this snap uses adopt-info to dynamically fetch the latest upstream version at build time
[group("maintenance")]
update source_repo:
  @echo "→ This snap uses adopt-info to automatically build the latest upstream release."
  @echo "→ No version update needed - just trigger a new build."
