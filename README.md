*This project has been created as part of the 42 curriculum by tle-pape*
# Inception — 42 Project

## Description

**Inception** is a system administration project focused on containerization using Docker. The goal is to set up a small server with docker using MariaDB, nginx and WordPress and lean how docker work.

## Project description

### Virtual Machines vs Docker

| Virtual Machines   | Docker                  |
| ------------------ | ----------------------- |
| Take lot of space  | Lightweight             |
| Slow startup       | Fast startup            |
| Emulate everything | Share host kernel       |
| Strong isolation   | Process-level isolation |

**Choice:** Docker was chosen for its efficiency, speed, and modern relevance in cloud-native environments.

### Secrets vs Environment Variables

| Secrets             | Environment Variables  |
| ------------------- | ---------------------- |
| Stored securely     | Raw text               |
| Managed by Docker   | Manually handled       |
| Not exposed in logs | Can leak really easily |

**Choice:** Secrets are preferred for sensitive data (passwords, credentials), while environment variables are used for non-sensitive configuration.

### Docker Network vs Host Network

| Docker Network       | Host Network        |
| -------------------- | ------------------- |
| Way more safer       | Less safer          |
| Custom communication | Direct access       |
| Isolated             | Shares host network |

**Choice:** A custom Docker network ensures isolation and controlled communication between containers.

### Docker Volumes vs Bind Mounts

| Docker Volumes       | Bind Mounts               |
| -------------------- | ------------------------- |
| More portable        | Less portable             |
| Safer for production | Useful for development    |
| Managed by Docker    | Linked to host filesystem |

**Choice:** Volumes are used for persistent production data, ensuring portability and reliability.

## Instructions

Refer to USER_DOC.md and DEV_DOC.md

## Resources

### Documentation & Learning Materials

* Docker official documentation
* Docker Compose documentation
* NGINX documentation
* WordPress installation guide
* MariaDB documentation

### Tutorials & Articles

* [Inception Tutorial](https://tuto.grademe.fr/inception/)

## AI Usage

* Faster error search (like css won't load in wordpress)
