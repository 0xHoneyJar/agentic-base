#!/bin/bash

# bootstrap-project.sh
# Usage: ./scripts/bootstrap-project.sh /path/to/target-project

TARGET_DIR=$1
SOURCE_DIR=$(pwd)

if [ -z "$TARGET_DIR" ]; then
    echo "Usage: ./scripts/bootstrap-project.sh /path/to/target-project"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating target directory: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

echo "🚀 Bootstrapping Agentic Base to: $TARGET_DIR"

# Copy agent configurations
cp -R "$SOURCE_DIR/.agents" "$TARGET_DIR/"

# Create subagent symlinks
cd "$TARGET_DIR"
ln -s .agents .claude
ln -s .agents .gemini

# Copy core documentation guides
cp "$SOURCE_DIR/AGENTS.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/PROCESS.md" "$TARGET_DIR/"
ln -s AGENTS.md "$TARGET_DIR/CLAUDE.md"

# Setup docs structure
mkdir -p "$TARGET_DIR/docs/a2a"
mkdir -p "$TARGET_DIR/docs/deployment"
mkdir -p "$TARGET_DIR/scripts"

# Copy management scripts
cp "$SOURCE_DIR/scripts/update-models.sh" "$TARGET_DIR/scripts/"
chmod +x "$TARGET_DIR/scripts/update-models.sh"

# Copy Cursor rules
cp "$SOURCE_DIR/.cursorrules" "$TARGET_DIR/"

echo "✅ Done! Your project is now equipped with the Agentic Base framework."
echo "Next steps:"
echo "1. Open the target directory in your AI IDE (Antigravity, Cursor, or Claude Code)."
echo "2. Start with '/plan-and-analyze' to begin Phase 1."
