# sh lib path resovle

## desc

resovle path like nodejs lib 'path'

## feat
- support absolute
- support relative

## how to use for poduction?

```sh
# get the code

# run the index file
# ./index.sh

# or import to your sh file
# source /path/to/the/index file

# usage
# path_resolve "/app" "src'
# path_resolve "/app/src" "./xx/xx/b/"
# path_resolve "/app/src" "../xx/xx/a/"
# path_resolve "/app/src" "/d"
```

## how to use for developer?

```sh
# get the code

# run test
./test.sh
#2 get some fail test
./test.sh  grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT