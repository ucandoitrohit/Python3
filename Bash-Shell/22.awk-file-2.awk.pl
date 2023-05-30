BEGIN {
        print "======Working on /etc/passwd file======"
      }
        /root/ {
        print $0
      }
END {
        print "=====Copleted script====="
}


#awk -f awk_file.awk /etc/passwd
