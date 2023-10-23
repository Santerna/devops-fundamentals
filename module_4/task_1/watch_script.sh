#!\bin\bash\
#########################################################################
#########################################################################
# The shell script that will watch free disk space. The bash script 
# should follow watch the free space of your hard disks and warns you 
# when that free space drops below a given threshold. The value of the 
# threshold is given by the user as a command line argument. Notice that 
# if the program gets no command line argument, a default value is used 
# as the threshold.
#
#   Default warning alert threshold: 70%
#
#########################################################################
#########################################################################

TRESHOLD_WARNING = 70 #In persent
WARNING = 0

### READ THE CLI PARAMETERS
while getopts ":w:" option; do
 case ${option} in
        w)
            THRESHOLD_WARNING=${OPTARG}
            ;;
  esac
done

### Function to check available space on hard disks
check_disk_space(){

    local total_used_space=`df -h $1 | awk '{print $4 " " $1}' | tail -1`
    local used_space_percent=`echo ${total_used_space:0:-1}`
    local free_space_percent=$(( 100 - $used_space_percent ))

    if (( $free_space_percent <= ${THRESHOLD_WARNING} )); then
        WARNING=1
        return 1
    else
        OK=1
        return 0
    fi
}

check_disk_space
