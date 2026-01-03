#!/bin/bash
# Install Java Language Server (jdtls)

_JAVA_LSP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_JAVA_LSP_DIR}/../utils.sh"

install_java_lsp() {
  if command -v jdtls &> /dev/null; then
    log_step "lsp_java" "ok" "Java LSP (jdtls) already installed"
    return 0
  fi

  log_step "lsp_java" "running" "Installing Java Language Server (jdtls)..."

  OS=$(detect_os)
  case "$OS" in
    macos)
      if command -v brew &> /dev/null; then
        brew install jdtls
      else
        log_error "Homebrew not found" "Run: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        return 1
      fi
      ;;
    linux)
      if command -v brew &> /dev/null; then
        brew install jdtls
      elif command -v sdk &> /dev/null; then
        sdk install java
        log_step "lsp_java" "info" "SDKMAN installed Java JDK. For jdtls, download from https://download.eclipse.org/jdtls/snapshots/"
      else
        log_error "No package manager found" "Install via Homebrew, SDKMAN, or download from https://download.eclipse.org/jdtls/snapshots/"
        return 1
      fi
      ;;
    windows)
      if command -v scoop &> /dev/null; then
        scoop bucket add java
        scoop install jdtls
      else
        log_error "Scoop not found" "Install Scoop or download from https://download.eclipse.org/jdtls/snapshots/"
        return 1
      fi
      ;;
    *)
      log_error "Unknown OS" "Download from https://download.eclipse.org/jdtls/snapshots/"
      return 1
      ;;
  esac

  log_step "lsp_java" "ok" "Java LSP (jdtls) installed"
}

# Run if executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  install_java_lsp
fi
