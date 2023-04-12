#!/bin/bash
run () {
# Get the date 3 days ago
three_days_ago=$(date -d "3 days ago" "+%Y-%m-%d")

# Update ytcc subscriptions
ytcc update
clear
# Loop until user decides to exit
while true; do
    # Display the videos and prompt the user to select one
    echo "List of videos from the last three days:"
    ytcc list -s $(date -d "3 days ago" "+%Y-%m-%d") -o publish_date desc
    echo
    echo "Enter the number of the video you want to play, or type 'q' to quit: "
    read -p ">" video_number
    # Check if the user wants to exit the script
    if [[ "$video_number" == "q" ]]; then
        clear
        break
    fi

    # Get the video URL and play it using mpv
    ytcc play $video_number
done
}
function check_dependencies() {
    if python -c "import ytcc" &> /dev/null; then
        run
    else
        echo 'Python module ytcc not found. Please install it with "pip install ytcc"'
    fi
}

check_dependencies
