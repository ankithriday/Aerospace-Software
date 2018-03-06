# Ankit Hriday
# Problem-3

echo "Problem-3 Assignment-5"

echo "Inputs is $1 and $2"

Base=$1
Ext=$2
i=1
for file in $PWD/*.$2;
do file "$file";
mv $file $Base$i.$2
i=$[ i + 1 ]
done
