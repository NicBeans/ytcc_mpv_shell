#!/bin/bash

# Get the date 3 days ago
three_days_ago=$(date -d "3 days ago" "+%Y-%m-%d")

# Update ytcc subscriptions
ytcc update

# Loop until user decides to exit
while true; do
    # List videos from the last three days, sorted by date (newest to oldest)
    videos=$(ytcc list --since "$three_days_ago" --order-by publish_date desc)

    # Display the videos and prompt the user to select one
    echo "List of videos from the last three days:"
    echo "$videos"
    echo
    read -p "Enter the number of the video you want to play, or type 'exit' to quit: " video_number

    # Check if the user wants to exit the script
    if [[ "$video_number" == "exit" ]]; then
        break
    fi

    # Get the video URL and play it using mpv
    ytcc play $video_number
done

