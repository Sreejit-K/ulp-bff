version: '3.7'

services:
  main:
    container_name: shiksha-backend
    build:
      context: .
      target: development
    volumes:
      - .:/usr/src/app
      - /usr/src/app/node_modules
    ports:
      - ${SERVER_PORT}:${SERVER_PORT}
      - 9229:9229
    command: yarn run start:dev
    env_file:
      - .env
    networks:
      - webnet
    # depends_on:
    #   - redis
    #   - postgres
  # redis:
  #   container_name: redis
  #   image: redis:5
  #   networks:
  #     - webnet
  # postgres:
  #   container_name: postgres
  #   image: postgres:11
  #   networks:
  #     - webnet
  #   environment:
  #     POSTGRES_PASSWORD: ${DB_PASSWORD}
  #     POSTGRES_USER: ${DB_USERNAME}
  #     POSTGRES_DB: ${DB_DATABASE_NAME}
  #     PG_DATA: /var/lib/postgresql/data
  #   ports:
  #     - 5432:5432
  #   volumes:
  #     - pgdata:/var/lib/postgresql/data
networks:
  webnet:
# volumes:
#   pgdata:
