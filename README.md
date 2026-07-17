# Car Rental Management System

This is a command-line Car Rental Management System developed using Bash scripting on Linux. The project was built to practice Linux shell scripting, file handling, automation, and basic DevOps concepts by implementing a real-world application.

## Features

* Add, view, update, and delete cars
* Add, view, update, and delete customers
* Rent and return cars
* Maintain rental records
* Calculate rental charges automatically
* Search cars and customers
* Generate reports
* Log important activities
* Create and restore backups
* Schedule backups using cron
* Perform remote backups using SSH and rsync
* Prevent concurrent rental operations using file locking (flock)

## Technologies Used

* Bash
* Linux
* Dialog
* AWK
* Cron
* SSH
* rsync
* tar
* flock
* Git
* Docker

## Project Structure

```text
car-rental-system/
├── main.sh
├── config.conf
├── Dockerfile
├── docker-compose.yml
├── README.md
├── .gitignore
├── modules/
├── data/
├── backups/
└── locks/
```

## Installation

Clone the repository:

```bash
git clone https://github.com/<your-username>/car-rental-system.git
cd car-rental-system
```

Install the required packages:

```bash
sudo apt update
sudo apt install dialog rsync
```

Make the script executable:

```bash
chmod +x main.sh
```

Run the application:

```bash
./main.sh
```

## Docker

Build the Docker image:

```bash
docker build -t car-rental .
```

Run the container:

```bash
docker run -it car-rental
```

Or, if Docker Compose is available:

```bash
docker compose up
```

## What I Learned

While building this project, I gained hands-on experience with:

* Writing modular Bash scripts
* Linux file handling
* AWK for processing data
* Logging and report generation
* Backup and restore using tar
* Cron job scheduling
* SSH and rsync for remote backups
* File locking using flock
* Git and GitHub
* Docker containerization

## Future Improvements

* Store data in PostgreSQL instead of text files
* Add user authentication
* Build a REST API using Go
* Deploy using Kubernetes
* Automate deployment with GitHub Actions
* Host the application on AWS EC2

## Author

Shreyas T S

