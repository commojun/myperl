# myperl
かんたんにPerl環境を実行したい


build
```
make build
```

このようなaliasを設定しておくと便利
```
alias myperl='docker run -it -v $PWD:/home/app/work --rm myperl:latest bash'
```
