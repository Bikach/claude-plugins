#!/bin/bash
# Shared utilities for setup scripts

detect_os() {
  case "$(uname -s)" in
    Darwin*) echo "macos" ;;
    Linux*)  echo "linux" ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *) echo "unknown" ;;
  esac
}

log_step() {
  local step="$1"
  local status="$2"
  local message="$3"
  echo "{\"step\": \"$step\", \"status\": \"$status\", \"message\": \"$message\"}" >&2
}

log_error() {
  local error="$1"
  local hint="$2"
  echo "{\"success\": false, \"error\": \"$error\", \"hint\": \"$hint\"}"
}
