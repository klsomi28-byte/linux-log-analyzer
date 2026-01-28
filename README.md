# Log Analyzer (Linux)

## Description
A simple Bash script to analyze system log files.

## Features
- Count error messages
- Count warning messages
- Check failed login attempts

- ## Project Structure
log-analyzer/
├── log_analyzer.sh
├── logs/
│ └── analysis.log
└── README.md

## Log File
- Default log file: `/var/log/syslog`

## How to Run
```bash
chmod +x log_analyzer.sh
./log_analyzer.sh

##Requirements
Linux OS
Bash shell
Read permission for log files

##Author
Sanjana

