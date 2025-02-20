# submission_reminder_app_SpaceMan619
Summative -1 for Individual Lab @ ALU. 

Submission Reminder App

Overview
The Submission Reminder App is a Bash-based tool that tracks student assignment submissions and provides automated reminders for pending work.

Features
Automatically sets up a structured directory for tracking submissions.
Stores assignment details in a config.env file.
Includes a functions.sh script to check for missing submissions.
Generates a submissions.txt file with sample data.
Provides a reminder.sh script to display pending submissions.
Includes a startup.sh script for easy execution.

Installation & Usage

Step 1: Run the Setup Script

chmod +x create_environment.sh
./create_environment.sh

You'll be prompted to enter your name, which will generate a directory named:

submission_reminder_<YourName>

Step 2: Navigate to the App Directory

cd submission_reminder_<YourName>

Step 3: Run the Reminder App

./startup.sh

Expected Output
The script will display:
The assignment being tracked.
Days remaining for submission.
A list of students who have not submitted their work.

Thanks for reading ! hope this works effectively !
