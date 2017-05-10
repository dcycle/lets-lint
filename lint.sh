# Tell our code to exit with an error if any of the commands fail.
set -e

# See https://github.com/dcycle/docker-json-lint
docker run -v $(pwd)/dummy-code:/app/code dcycle/json-lint ./code/dummy.json

# See https://github.com/dcycle/docker-js-lint
docker run -v $(pwd)/dummy-code:/app/code dcycle/js-lint .

# See https://github.com/dcycle/docker-css-lint
docker run -v $(pwd)/dummy-code:/app/code dcycle/css-lint .

# See https://github.com/dcycle/docker-php-lint
docker run -v $(pwd):/dummy-code dcycle/php-lint --standard=DrupalPractice /code
docker run -v $(pwd):/dummy-code dcycle/php-lint --standard=Drupal /code
docker run -v $(pwd):/dummy-code dcycle/php-lint /code
docker run -v "$(pwd)":/dummy-code \
  dcycle/php-lint \
  --ignore=data/*,*.js \
  --standard=Drupal \
  --report=full \
  /code

# See https://github.com/dcycle/docker-shell-lint
docker run -v "$(pwd)":/dummy-code dcycle/shell-lint ./dummy.sh
