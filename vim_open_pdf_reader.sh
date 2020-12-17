fichier="$1"
base="${fichier%.*}"

evince $base.pdf>/dev/null 2>&1 
