#!/usr/bin/env bash
# demo.sh — cinematic README terminal effect
set -euo pipefail


type tput >/dev/null 2>&1 || { echo "tput not available — falling back to plain output"; cat <<'EOF'
initialising...
EOF
exit 0; }


# simple color helpers
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)


slow_print() {
local s="$1"
local delay=${2:-0.03}
for ((i=0; i<${#s}; i++)); do
printf "%s" "${s:i:1}"
sleep "$delay"
done
printf "\n"
}


clear
printf "%s" "$BOLD$CYAN"
slow_print "root@zeaslucifer:~$ initialising..." 0.02
sleep 0.6
printf "%s" "$RESET"


# show kernel info (safe)
echo
slow_print "=> system info:" 0.01
uname -a | sed -E 's/.{0,}/ &/'


# demo 'scan' header only — do NOT run against remote targets
echo
slow_print "=> running demo scan (localhost) — no external targets" 0.01
printf "\n"
slow_print "[nmap] detecting services... (simulated)" 0.02
sleep 0.6
printf "\n"
slow_print "# demo finished — be cool, be legal" 0.02


exit 0
