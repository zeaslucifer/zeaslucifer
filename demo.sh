#!/usr/bin/env bash
# demo.sh — cinematic terminal effect for README
set -euo pipefail

# fallback if terminal capabilities are limited
if ! command -v tput >/dev/null 2>&1; then
  cat <<'EOF'
initialising...
demo finished — be cool, be legal
EOF
  exit 0
fi

# terminal styling
BOLD=$(tput bold)
CYAN=$(tput setaf 6)
RESET=$(tput sgr0)

slow_print() {
  local text="$1"
  local delay="${2:-0.03}"

  for ((i=0; i<${#text}; i++)); do
    printf '%s' "${text:i:1}"
    sleep "$delay"
  done
  printf '\n'
}

clear

printf '%s' "$BOLD$CYAN"
slow_print "root@zeaslucifer:~$ initialising..." 0.02
sleep 0.6
printf '%s' "$RESET"

echo
slow_print "=> system info" 0.01
uname -a | sed 's/^/  /'

echo
slow_print "=> running demo scan (localhost only)" 0.01
sleep 0.3
slow_print "[nmap] discovering services... (simulated)" 0.02
sleep 0.5
slow_print "[nmap] analysing attack surface... (simulated)" 0.02

echo
slow_print "# demo finished — trust nothing, verify everything" 0.02

exit 0

