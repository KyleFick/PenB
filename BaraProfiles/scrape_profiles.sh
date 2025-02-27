#!/bin/bash

BASE_URL="https://www.chrishanibaragwanathhospital.co.za"

# Read profile links from a file (each line is a profile URL)
while IFS= read -r profile_url; do
    echo "Processing: $profile_url"

    # Fetch profile page HTML
    html=$(curl -s "$profile_url")

    # Extract profile number from URL
    profile_number=$(echo "$profile_url" | grep -oE '[0-9]+')

    # Extract Profile Info
    name=$(echo "$html" | grep -oP '(?<=<h3>Hi, I\'m ).*?(?=</h3>)')
    age_location=$(echo "$html" | grep -oP '(?<=<p class="text-muted">).*?(?=</p>)' | head -1)
    occupation=$(echo "$html" | grep -oP '(?<=<p class="text-muted">).*?(?=</p>)' | tail -1)

    # Extract Image Source and Convert to Full URL
    img_src=$(echo "$html" | grep -oP '(?<=<img class="img-responsive center-block" src=").*?(?=")')
    img_full_url="$BASE_URL$img_src"

    # Create Directory for Profile
    mkdir -p "$profile_number"

    # Save Profile Info to a Text File
    cat <<EOF > "$profile_number/profile.txt"
Hi, I'm $name
$age_location
$occupation
Img Src: $img_full_url
EOF

    echo "Profile saved in $profile_number/profile.txt"

done < profiles.txt  # File containing profile URLs, one per line
