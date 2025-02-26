#!/bin/bash
URL="https://www.chrishanibaragwanathhospital.co.za/contact"
HTML_FILE="contact.html"

# Fetch the page
curl -s "$URL" > $HTML_FILE

# Extract and format the data
paste -d ' | ' <(grep -oP '(?<=<h4>).*?(?=</h4>)' $HTML_FILE) \               
<(grep -oP '(?<=<div class="bold">).*?(?=</div>)' $HTML_FILE) \               
<(grep -oP '(?<=fa-phone"></i> ).*?(?=<br>)' $HTML_FILE) \               
<(grep -oP '(?<=fa-fax"></i> ).*?(?=<br>)' $HTML_FILE) \               
<(grep -oP '(?<=mailto:).*?(?=")' $HTML_FILE)
