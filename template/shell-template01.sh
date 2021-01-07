#!/bin/bash --posix
# -*- coding:utf-8 -*-

# === Coding shell scripting Memo ==============================================
# ${<name>#<pattern>} :: matching delete with shortest by forword.
# ${<name>##<pattern>} :: matching delete with longest by forword.
# ${<name>%<pattern>} :: matching delete with shortest by backword.
# ${<name>%%<pattern>} :: mathing delete with longest by backword.
# ${<name>/<before>/<after>} :: replace only first matching.
# ${<name>//<before>/<after>} :: replace all matching.
# ${<name>:-<value>} :: if no yet set value, return value.
# ${<name>:=<value>} :: if no yet set value, return value and set.

# ". <shell script>" is to keep current shell and take over environment.

# === Initialize shell environment =============================================
set -u                        # Just stop undefined values.
set -e                        # Just stop error.
set -x                        # Debug running command.

umask 0022
export LC_ALL=C
export LANG=C
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:${PATH+:}${PATH-}"
type command >/dev/null 2>&1 && type getconf >/dev/null 2>&1 &&
export PATH="$(command -p getconf PATH):${PATH}"
export UNIX_STD=2003          # to make HP-UX conform to POSIX

# === Define the functions for printing usage and error message ================
usage_and_exit(){
    cat <<-"    USAGE" 1>&2
    %file-name% is .

    Usage   : %file-name% [options] <>
    Options :
        -h |--help |--version
            This help.
    Version : %date-T0% 0.01
    LICENSE : CC0
              This is a public-domain software (CC0). It means that
              all of the people can use this for any purposes with no
              restrictions at all. By the way, We are fed up with the
              side effects which are brought about by the major licenses.
    Author  : %date-T2% %id%
    USAGE

    exit 1
}

error_exit() {
    ${2+:} false && echo "${0##*/}: $2" 1>&2

    exit "$1"
}

# === Initialize parameters ====================================================
# Detect home directory of this app. and define more
#Homedir="$(d=${0%/*}/; [ "_$d" = "_$0/" ] && d='./'; cd "$d.."; pwd)"
#PATH="$Homedir/<Add Dir>:$PATH" # for additional command

zzz='' # test value.
#. "$Homedir/<shell script config-file.>"        # configration value.

# === Confirm that the required commands exist =================================
# --- cURL or Wget (exsample)
#if   type curl    >/dev/null 2>&1; then
#  CMD_CURL='curl'
#elif type wget    >/dev/null 2>&1; then
#  CMD_WGET='wget'
#else
#  error_exit 1 'No HTTP-GET/POST command found.'
#fi

# === Print usage and exit if one of the help options is set ===================
case "$# ${1:-}" in
    '1 -h'|'1 --help'|'1 --version') usage_and_exit;;
esac

# === Read options =============================================================
while :; do
    case "${1:-}" in
        --zzz=*)
            zzz=$(printf '%s' "${1#--zzz=}" | tr -d '\n')
            echo "${zzz}"
            shift
            ;;
        -zzz)
            zzz=$(printf '%s' "${2:-}" | tr -d '\n')
            echo "${zzz}"
            shift 2
            ;;
        --|-)
            break
            ;;
        --*|-*)
            error_exit 1 'Invalid option'
            ;;
        *)
            break
            ;;
    esac
done

# === Require parameters check =================================================
#printf '%s\n' "${zzz}" | grep -Eq '^$|^-?[0-9.]+,-?[0-9.]+$' || {
#  error_exit 1 'Invalid -l,--location option'
#}

# === Last parameter ===========================================================
#case $# in
#  0) <input>=$(cat -)
#     ;;
#  1) case "${1:-}" in
#       '--') usage_and_exit;;
#        '-') <input>=$(cat -)    ;;
#          *) <input>=$1          ;;
#     esac
#     ;;
#  *) case "$1" in '--') shift;; esac
#     <input>="$*"
#     ;;
#esac                         # Escape 0x0A to 0x1E

# === Define funcitons =========================================================


# === Main routine =============================================================


# === End shell script =========================================================
exit 0

