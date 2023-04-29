# function to mkdir and cd to it
function mkcd() {
    mkdir -p "$@" && cd "$_";
}
