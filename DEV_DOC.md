### Prerequisites

* docker
* docker-compose
* make

### Installation & Setup

1. Clone the repository:

   ```bash
   git clone <repository_url> inception
   cd inception
   ```

2. Configure environment variables:

   Create the `.env` file in `srcs/` with this :
   ```
   MYSQL_DATABASE=
   MYSQL_ROOT_PASSWORD=
   MYSQL_USER=
   MYSQL_PASSWORD=
   DOMAIN_NAME=

   WP_TITLE=
   WP_ADMIN_USER=
   WP_ADMIN_PASSWORD=
   WP_ADMIN_EMAIL=
   WP_USER=
   WP_USER_EMAIL=
   WP_USER_PASSWORD=
   ```

3. Build and start containers:

   ```bash
   make
   ```
   
   or
   
   ```bash
   mkdir -p /home/tle-pape/data/mariadb
   mkdir -p /home/tle-pape/data/wordpress
   docker compose -f docker-compose.yml up -d --build
   ```

4. Access the services:

   * Website: https://**REPLACE_BY_DOMAIN_NAME**
   * WordPress admin: https://**REPLACE_BY_DOMAIN_NAME**/wp-admin

### Manage docker & data

   * Use `docker ps` in terminal to see all 3 dockers running.
   * If something goes wrong, use `docker logs docker_id` with `docker_id` given by `docker ps` to see what is happening.
   * Use `docker volume ls` to see all volume created.
   * Data are stored in `/home/tle-pape/data/` that contain `wordpress` and `mariadb` and persist until you use `make clean`.

### Stopping the Project

```bash
make stop
```

Remove everything:

```bash
make clean
```
The Makefile will ask your sudo password.
