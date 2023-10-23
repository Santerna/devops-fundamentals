#!\bin\bash\
#########################################################################
#########################################################################
#
# The shell script, which will count the number of files that exist in 
# each given directory and its subdirectories
#
#########################################################################
#########################################################################


count_files(){
  local total_number=`find . -type f | wc -l`
  echo "Total number of files: ${total_number}"
}

count_files
