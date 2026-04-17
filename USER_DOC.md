### Provided

This repo provide a pre-configured docker compose that allow you to setup a simple wordpress.

### Installation & Setup

1. Clone the repository:

   ```bash
   git clone <repository_url> inception
   cd inception
   ```

2. Configure environment variables:

   Create the `.env` file in `srcs/` with :
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
   Fill the environnement variable.

3. Build and start containers:

   ```bash
   make
   ```

4. Ensure everything is running:
   * Use `docker ps` in terminal to see all 3 dockers running.
   * If something goes wrong, use `docker logs **docker_id**` with `docker_id` given by `docker ps` to see what is happening.

5. Access the services:

   * Website: https://**REPLACE_BY_DOMAIN_NAME**
   * WordPress admin: https://**REPLACE_BY_DOMAIN_NAME**/wp-admin

### Stopping the Project

```bash
make stop
```

Remove everything:

```bash
make clean
```
The Makefile will ask your sudo password.
