#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
source "$THIS_FILE_PATH/index.sh"

a=$(isAbsolute "/")

echo "test:\$(isAbsolute \"/\")"
if [ "$a" = "true" ]; then
  echo "it is ok"
else
  echo "it is false"
fi

a=$(isAbsolute "./")
echo "test:\$(isAbsolute \"./\")"
if [ "$a" = "false" ]; then
  echo "it is ok"
else
  echo "it is false"
fi

a=$(path_resolve_for_relative "/app/src" "./")
echo 'test:path_resolve_for_relative "/app/src" "./"'
if [ "$a" = "/app/src" ]; then
  echo "it is ok"
else
  echo "it is false"
fi

function test() {
  local fn=
  local expectValue=
  local ouput=
  fn=${1}
  ouput=$($fn)
  expectValue=${2}
  echo "test:$fn"
  if [ "$ouput" = "$expectValue" ]; then
    echo "it is ok"
  else
    echo "it is false.expect $ouput = $expectValue"
  fi
}

## function usage
: <<note
test 'isAbsolute "./"' "false"
test 'isAbsolute ./' "false"
test 'isAbsolute / ' "true"
test 'path_resolve_for_relative /app/src ./' "/app/src"
test 'path_resolve_for_relative "/app/src" "./"' "/app/src"
note
test 'path_resolve_for_relative /app/src ./' "/app/src"
test 'path_resolve_for_relative "/app/src" "./"' "/app/src"
test 'path_resolve_for_relative "/app/src" "./"' "/app/src"
test 'path_resolve_for_relative "/app/src" "."' "/app/src"
test 'path_resolve_for_relative "/app" "test"' "/app/test"
test 'path_resolve_for_relative "/app/src" "../"' "/app"
test 'path_resolve_for_relative "/app/src" ".."' "/app"
test 'path_resolve_for_relative "/app/src" "../test"' "/app/test"

test 'path_resolve "/" "src"' "/src"
test 'path_resolve "/app" "src' "/app/src"
test 'path_resolve "/app/src" "./"' "/app/src"
test 'path_resolve "/app/src" "../"' "/app"
test 'path_resolve "/app/src" "/"' "/"
test 'path_resolve "/app/src" "/d"' "/d"

## file-usage
# ./test.sh
