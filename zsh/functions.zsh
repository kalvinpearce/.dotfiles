# function to mkdir and cd to it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
    cd "$1"
  else
    mkdir -p "$1" && cd "$1"
  fi
}

# function to return the response time from a curl request to a URL
function curltime {
  if [ ! -n "$1" ]; then
    echo "Enter a URL"
  else
    curl -s -w "Testing Website Response Time for :%{url_effective}\n\nLookup Time:\t\t%{time_namelookup}\nConnect Time:\t\t%{time_connect}\nAppCon Time:\t\t%{time_appconnect}\nRedirect Time:\t\t%{time_redirect}\nPre-transfer Time:\t%{time_pretransfer}\nStart-transfer Time:\t%{time_starttransfer}\n\nTotal Time:\t\t%{time_total}\n" -o /dev/null $1
  fi
}
