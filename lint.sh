if [ -z "$1" ]; then
  DIR='dummy-code'
else
  DIR="$1"
fi

echo '***'
echo '*** Linting JSON files'
echo '*** See https://github.com/dcycle/docker-json-lint'
echo '***'
docker run -v $(pwd)/"$DIR":/app/code dcycle/json-lint ./code/dummy.json

if [ $? -eq 0 ]; then
  echo "Linting JSON: success"
else
  echo "Linting JSON: error" >&2
  ERROR=1
fi

echo '***'
echo '*** Linting Javascript files (es5+es6) files'
echo '*** See https://github.com/dcycle/docker-js-lint'
echo '***'
docker run -v $(pwd)/"$DIR":/app/code dcycle/js-lint .

if [ $? -eq 0 ]; then
  echo "Linting Javascript: success"
else
  echo "Linting Javascript: error" >&2
  ERROR=1
fi

echo '***'
echo '*** Linting CSS files'
echo '*** See https://github.com/dcycle/docker-css-lint'
echo '***'
docker run -v $(pwd)/"$DIR":/app/code dcycle/css-lint .

if [ $? -eq 0 ]; then
  echo "Linting CSS: success"
else
  echo "Linting CSS: error" >&2
  ERROR=1
fi

echo '***'
echo '*** Linting PHP files'
echo '*** See https://github.com/dcycle/docker-php-lint'
echo '***'
# The PHP linter requires to explicitly ignore js files.
docker run -v "$(pwd)/"$DIR"":/code \
  dcycle/php-lint \
  --ignore=data/*,*.js \
  --standard=Drupal \
  --report=full \
  /code

if [ $? -eq 0 ]; then
  echo "Linting PHP: success"
else
  echo "Linting PHP: error" >&2
  ERROR=1
fi

echo '***'
echo '*** Linting Shell scripts'
echo '*** See https://github.com/dcycle/docker-shell-lint'
echo '***'
docker run -v "$(pwd)/"$DIR"":/code dcycle/shell-lint ./dummy.sh

if [ $? -eq 0 ]; then
  echo "Linting Shell: success"
else
  echo "Linting Shell: error" >&2
  ERROR=1
fi

if [ ! -z "$ERROR" ];then
  echo "Exiting with error code 1 because there was at least one error." >&2
  exit 1
fi
