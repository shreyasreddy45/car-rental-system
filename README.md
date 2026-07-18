# Car Rental Management System

A modular command-line Car Rental Management System built entirely using **Bash Shell Scripting**. This project demonstrates how shell scripting can be used to build a complete application by applying Linux concepts such as modular programming, file handling, process synchronization, automation, and containerization.

## Features

* Add, view, update, search, and delete car records
* Add, view, update, search, and delete customer records
* Rent and return cars
* Automatically update car availability
* Rental history management
* Logging of important operations
* Generate reports
* Backup project data
* Restore data from backups
* Schedule automatic backups using Cron
* Remote backup using SSH and `rsync`
* File locking using `flock` to prevent concurrent access
* Docker support for running the application inside a container

## Project Structure

```
car-rental-system/
├── modules/
│   ├── backup.sh
│   ├── car.sh
│   ├── cron.sh
│   ├── customer.sh
│   ├── delete.sh
│   ├── logger.sh
│   ├── remote_backup.sh
│   ├── rental.sh
│   ├── report.sh
│   ├── restore.sh
│   ├── search.sh
│   └── update.sh
├── data/
├── config.conf
├── Dockerfile
├── docker-compose.yml
├── README.md
└── main.sh
```

## Technologies Used

* Bash Shell Scripting
* Linux/Ubuntu
* Dialog
* Cron
* SSH
* Rsync
* Docker
* Docker Compose
* File Locking (`flock`)

## Requirements

* Ubuntu/Linux
* Bash
* Dialog
* Docker (optional)
* Docker Compose (optional)

Install Dialog if it is not available:

```bash
sudo apt update
sudo apt install dialog
```

## Running the Project

Clone the repository:

```bash
git clone https://github.com/shreyasreddy45/car-rental-system.git
```

Move into the project directory:

```bash
cd car-rental-system
```

Give execution permission:

```bash
chmod +x main.sh
```

Run the application:

```bash
./main.sh
```

## Running with Docker

Build the Docker image:

```bash
docker build -t car-rental-system .
```

Run the container:

```bash
docker run -it car-rental-system
```

Or use Docker Compose:

```bash
docker compose up --build
```

## Learning Outcomes

This project helped me understand:

* Modular Bash scripting
* File handling and text processing
* Functions and reusable modules
* Configuration management
* Linux process synchronization using `flock`
* Cron job scheduling
* SSH and remote backups with `rsync`
* Docker and Docker Compose
* Organizing medium-sized Bash projects

## Future Improvements

* Database integration (MySQL/PostgreSQL)
* User authentication
* Better reporting and analytics
* Email notifications
* Web-based frontend
* REST API using Go or Python

## Author

**Shreyas T S**

GitHub: https://github.com/shreyasreddy45

## License

This project is created for educational and learning purposes.
