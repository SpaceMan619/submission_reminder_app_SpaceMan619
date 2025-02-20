#!/bin/bash

# Ask for the user's name (whatever they decide to input in the box)
read -p "Enter your name: " yourName

# Create main directory depending on whats required
main_dir="submission_reminder_${yourName}"
mkdir -p "$main_dir"

# Create subdirectories in question for the main task
mkdir -p "$main_dir/config" "$main_dir/functions" "$main_dir/data" "$main_dir/logs"

# Create config.env with assignment and days remaining
echo -e "ASSIGNMENT=\"Shell Navigation\"\nDAYS_REMAINING=2" > "$main_dir/config/config.env"

# Create functions.sh with the check_submissions function
cat << 'EOF' > "$main_dir/functions/functions.sh"
#!/bin/bash

function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

# This line of text submissions.txt with original data + 5 new entries
cat << EOF > "$main_dir/data/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bob, Shell Navigation, not submitted
Alice, Git, submitted
Eve, Shell Navigation, not submitted
Charlie, Shell Basics, submitted
Dave, Shell Navigation, not submitted
Frank, Shell Navigation, not submitted
EOF

# Create reminder.sh with corrected paths
cat << 'EOF' > "$main_dir/reminder.sh"
#!/bin/bash

source ./config/config.env
source ./functions/functions.sh

submissions_file="./data/submissions.txt"

echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Create startup.sh to launch the app
echo -e '#!/bin/bash\n./reminder.sh' > "$main_dir/startup.sh"

# Make scripts executable
chmod +x "$main_dir/reminder.sh" "$main_dir/startup.sh"

echo "Setup done! Run ./startup.sh inside $main_dir to test."
