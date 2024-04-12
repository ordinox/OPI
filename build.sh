#!/bin/bash

# Define the GitHub repository URL.
REPO_URL="https://github.com/ordinox/ord.git"

# Define the directory where the repository will be cloned.
CLONE_DIR=ord

# Clone the repository.
git clone $REPO_URL $CLONE_DIR

# Check if the clone was successful.
if [ $? -eq 0 ]; then
    echo "Repository cloned successfully."

    # Change directory to the cloned repository.
    cd $CLONE_DIR

    # Build the project using Cargo.
    cargo +nightly build --release

    # Check if the build was successful.
    if [ $? -eq 0 ]; then
        echo "Project built successfully."
    else
        echo "Failed to build the project."
    fi
else
    echo "Failed to clone the repository."
fi
