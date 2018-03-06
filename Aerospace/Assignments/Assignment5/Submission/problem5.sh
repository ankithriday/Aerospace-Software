# Ankit Hriday
# Problem-5
#!/bin/bash
echo "Problem-5 Assignment-5"

echo "The tar file is $1"

cleanTar=$(echo $1 | sed 's/\.tar.gz$/_clean.tar.gz/')

mkdir Dir1

tar -xzf $1 -C Dir1

cd Dir1
extension=""
filename=""
for file in *.*; do
	filename=$(basename "$file")
	extension="${filename#*.}"
	filename="${filename%.*}"
	if [ -d $extension ]; then
		mv $file $extension;
	else
		mkdir "$extension"
		mv $file $extension;
	fi
done

cd ..

tar -zcf $cleanTar -C Dir1 .
echo "Success. The new $cleanTar has been made."
rm -r Dir1/

exit 0

