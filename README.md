# Certificate Update Lab Package
## Overview
### Description
	This lab is meant to test and refine your CLI skillset and confidence. This lab is intended to be completed entirely via your machine's CLI. Use commands you have learned in class or from the Learn Linux in a month of lunches textbook. Follow the base setup and teardown instructions based on you machine specifications below. Your goal is to find every existing file named client_key.txt in the directories created after the setup script runs. The contents of each of these files must be replaced with the contents of the new_client_key.txt

### Deliverables
	- Provide a screenshot of a successful run of the check_cert script
	- Provide a written explanation, screenshot, or code snippet of the exact commands you used to update the client_key.txt files
## Contents
- LAB_GUIDE.txt
- new_client_key.txt
- mac_terminal/
	  - setup_cert_lab_mac.sh
	  - check_cert_updates_mac.sh
	  - teardown_cert_lab_mac.sh
- gitbash_windows/
	  - setup_cert_lab_gitbash.sh
	  - check_cert_updates_gitbash.sh
	  - teardown_cert_lab_gitbash.sh

## Quick start on Mac
1. ensure scripts are executable
	1. ```terminal
		   chmod +x setup_cert_lab_mac.sh 
		   chmod +x  check_cert_updates_mac.sh 
		   chmod +x teardown_cert_lab_mac.sh
	   ```
2. Run setup script
	1. ```terminal
	   ./setup_cert_lab_mac.sh
	   ```
	   
3. Find and update all client_key.txt files.
	1. uses your core linux commands to navigate the created directory
	2. use any tools necessary to update the client_key.txt files
		1. (_hint: there are multiple routes such as cp, vim, and many others)
4. When you are confident that you have located and updated each file, then run:
	1. ```terminal
		   ./check_cert_updates_mac.sh
	   ```
	   
5. once you have received a success message, run:
	1. ```terminal
	   ./teardown_cert_lab_mac.sh
	   ```
## Quick start on Windows (Git Bash)
1. ensure scripts are executable
	1. ```git
		   chmod +x setup_cert_lab_gitbash.sh 
		   chmod +x check_cert_updates_gitbash.sh 
		   chmod +x teardown_cert_lab_gitbash.sh
	   ```
2. Run setup script
	1. ```git
	   ./setup_cert_lab_gitbash.sh
	   ```
3. Find and update all client_key.txt files.
		1. uses your core linux commands to navigate the created directory
		2. use any tools necessary to update the client_key.txt files
			1. (_hint: there are multiple routes such as cp, vim, and many others)
4. Once you are confident you have completed all updates, run:
	1. ```git
		   ./check_cert_updates_gitbash.sh
	   ```
5. Once you achieve a success message from the checker, run:
	1.   ```git
		   ./teardown_cert_lab_gitbash.sh
	   ```
