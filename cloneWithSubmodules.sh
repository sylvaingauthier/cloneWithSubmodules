clone() {
  git clone --recurse-submodules --remote-submodules "$1" && cd "$(basename "$1" .git)";
}

displayHelp() {
  echo -e "-h \t\t display help \n-c <url> \t clone github repository"
}

update() {
  git submodule update --init --recursive
}

while getopts c:h:u flag
do
    case "${flag}" in
        h) displayHelp;;
        c) clone ${OPTARG};;
        u) update;;
    esac
done
