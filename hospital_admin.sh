#!/bin/bash

# Member 1 - The Architect
initialize_system() {
    echo "  KNH System Initialization Starting...  "
    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    else
        echo "active_logs already exists. "
    fi
    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    else
        echo "archived_logs already exists. "
    fi
    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    else
        echo "reports already exists. "
    fi
    echo "  All directories are ready.  "
}

# Member 2 - The Security Lead
secure_data() {
    echo "  Securing active_logs directory...  "
    chmod 600 active_logs
    echo "  Permissions updated successfully!  "
    ls -l
}

# Member 3 - The Orchestrator: Execution logic
initialize_system
secure_data
echo "System Environment Secured - $(date)"
