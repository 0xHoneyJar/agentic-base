#!/bin/bash

# update-models.sh
# Usage: ./scripts/update-models.sh [claude|gemini]

PROVIDER=$1
AGENT_DIR=".agents/agents"

if [ -z "$PROVIDER" ]; then
    echo "Usage: ./scripts/update-models.sh [claude|gemini]"
    exit 1
fi

if [ "$PROVIDER" == "claude" ]; then
    echo "Updating models to Claude (Sonnet)..."
    sed -i '' 's/model: .*/model: sonnet/g' $AGENT_DIR/*.md
elif [ "$PROVIDER" == "gemini" ]; then
    echo "Updating models to Gemini 1.5 Pro..."
    sed -i '' 's/model: .*/model: gemini-1.5-pro/g' $AGENT_DIR/*.md
else
    echo "Unknown provider: $PROVIDER. Use 'claude' or 'gemini'."
    exit 1
fi

echo "Done!"
