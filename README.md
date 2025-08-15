# Project Installation and Execution Guide

## 1. Install Lean (with Lake)

In **Git Bash** (Linux/macOS) or any POSIX-compatible shell, run:

    curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

After installation, restart your terminal.

> Lake is installed automatically together with Lean via `elan`.

## 2. Verify Installation

Check Lean:

    lean --version

Expected (example):

    Lean (version 4.x.x, ...)

Check Lake:

    lake --version

## 3. Clone the Project

    git clone https://github.com/MarcosGeraldo/EBPF_Lean_SBMF
    cd EBPF_Lean_SBMF

## 4. Build the Project

This step may take several minutes; it will download and build all dependencies:

    lake build

The expected evaluations will run automatically as part of the build (if configured in the project).

## 5. Editing the Code (Optional)

For the best experience, open the project in **VS Code** with the official **Lean 4** extension, which provides real-time diagnostics and interactive feedback.
