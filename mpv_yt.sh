#!/bin/bash

# Get the date 3 days ago
three_days_ago=$(date -d "3 days ago" "+%Y-%m-%d")

# Update ytcc subscriptions
ytcc update

# List videos from the last three days, sorted by date (newest to oldest)
videos=$(ytcc list --since "$three_days_ago" --order-by publish_date desc)

# Display the videos and prompt the user to select one
echo "List of videos from the last three days:"
echo "$videos"
echo
read -p "Enter the number of the video you want to play: " video_number

# Get the video URL and play it using mpv (or another video player of your choice)
video_url=$(ytcc list --since "$three_days_ago" --order-by publish_date desc --attributes url | sed -n "${video_number}p" | tr -d '[:blank:]')
mpv "$video_url"
