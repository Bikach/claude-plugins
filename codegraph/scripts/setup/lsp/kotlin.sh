#!/bin/bash
# Install Kotlin Language Server

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../utils.sh"

install_kotlin_lsp() {
  if command -v kotlin-language-server &> /dev/null; then
    log_step "lsp_kotlin" "ok" "Kotlin LSP already installed"
    return 0
  fi

  log_step "lsp_kotlin" "running" "Installing Kotlin Language Server..."

  OS=$(detect_os)
  case "$OS" in
    macos)
      if command -v brew &> /dev/null; then
        brew install kotlin-language-server
      else
        log_error "Homebrew not found" "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        return 1
      fi
      ;;
    linux)
      if command -v snap &> /dev/null; then
        sudo snap install kotlin-language-server --classic
      elif command -v sdk &> /dev/null; then
        sdk install kotlin-language-server
      else
        log_error "No package manager found" "Install via SDKMAN or download from https://github.com/fwcd/kotlin-language-server/releases"
        return 1
      fi
      ;;
    windows)
      if command -v scoop &> /dev/null; then
        scoop install kotlin-language-server
      else
        log_error "Scoop not found" "Install Scoop or download from https://github.com/fwcd/kotlin-language-server/releases"
        return 1
      fi
      ;;
    *)
      log_error "Unknown OS" "Download from https://github.com/fwcd/kotlin-language-server/releases"
      return 1
      ;;
  esac

  log_step "lsp_kotlin" "ok" "Kotlin LSP installed"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_kotlin_lsp
fi
