#!/bin/bash
# Initialize variables...

# Final single digits:
fd[0]="zeroth"; fd[1]="first"; fd[2]="second"; fd[3]="third"
fd[4]="fourth"; fd[5]="fifth"; fd[6]="sixth"; fd[7]="seventh"
fd[8]="eighth"; fd[9]="ninth"
# Final teens:
ft[10]="tenth"; ft[11]="eleventh"; ft[12]="twelfth"
ft[13]="thirteenth"; ft[14]="fourteenth"; ft[15]="fifteenth"
ft[16]="sixteenth"; ft[17]="seventeenth"; ft[18]="eighteenth"
ft[19]="nineteenth"
# Final tens:
fT[2]="twentieth"; fT[3]="thirtieth"; fT[4]="fortieth"
fT[5]="fiftieth"; fT[6]="sixtieth"; fT[7]="seventieth"
fT[8]="eightieth"; fT[9]="ninetieth"

# Leading single digits:
ld[1]="one"; ld[2]="two"; ld[3]="three"; ld[4]="four"
ld[5]="five"; ld[6]="six"; ld[7]="seven"; ld[8]="eight"
ld[9]="nine"
# Leading teens:
lt[10]="ten"; lt[11]="eleven"; lt[12]="twelve"
lt[13]="thirteen"; lt[14]="fourteen"; lt[15]="fifteen"
lt[16]="sixteen"; lt[17]="seventeen"; lt[18]="eighteen"
lt[19]="nineteen"
# Leading tens:
lT[2]="twenty"; lT[3]="thirty"; lT[4]="forty"; lT[5]="fifty"
lT[6]="sixty"; lT[7]="seventy"; lT[8]="eighty"; lT[9]="ninety"

# Function to print US English string corresponding to 3 digit numeric string.
function p3 {
	d23=$1
	d2=$((d23/10))
	d3=$((d23%10))
	# Print last two digits...
  if [[ d2 -eq 1 ]]
  then
    # 10-19:
    echo "${ft[d23]}"
  elif [[ d2 -gt 1 ]]
  then
    # 20-99:
    if [[ d3 -gt 1 ]]	# [2-9][1-9]:
    then
      echo "${lT[d2]}-${fd[d3]}"
    else	# [2-9][0]:
      echo "${lT[d2]}"
    fi
  else	# 0-9:
    echo "${fd[d3]}"
  fi
}
p3 $1