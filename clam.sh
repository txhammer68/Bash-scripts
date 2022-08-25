$ = clamscan
$ > awk -vmax=$(wc -l < file) -F: '
    BEGIN{print "{"}
    NR>1{
        gsub(/^ /, "", $2);
        printf "%s",  "\t\042"$1"\042:\042"$2"\042"
        if (NR<max) {print ","}else{print "\n"}
    }
    END{print "}"}
' file
