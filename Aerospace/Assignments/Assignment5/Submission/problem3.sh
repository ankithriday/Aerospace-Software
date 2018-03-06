# Ankit Hriday
# Problem-3

echo "Problem-3 Assignment-5"

echo "Inputs is $1 and $2"

Base=$1
Arg=$2
i=1
for file in $Base/*.jpg;
do file "$file";
mv $file $Arg$i.jpg
i=$[ i + 1 ]
done
