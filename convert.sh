#!/bin/sh

#---------------------------------------------------------------------------------------
# License
#
# Copyright (c) 2016 Tom Buhrtz
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this 
# software and associated documentation files (the "Software"), to deal in the Software 
# without restriction, including without limitation the rights to use, copy, modify, 
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
# permit persons to whom the Software is furnished to do so, subject to the following 
# conditions: The above copyright notice and this permission notice shall be included 
# in all copies or substantial portions of the Software.\\
#  
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# 
#---------------------------------------------------------------------------------------

SCRIPTFILE=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPTFILE")
CURRENTDIR=`pwd`

directoryTpl="${SCRIPTPATH}/templates"
directoryTar="${CURRENTDIR}/target/images"

# ------------------------------------------------------
#  
#  \brief   The function creates 'main.tex' file.
#
#  \param $1 - Template directory.
#  \param $2 - Temp directory.
#  \param $3 - Content.
# ------------------------------------------------------
createMainLaTeXFile() {
	cat  "$1/main-preamble-beg.tex" >  "$2/main.tex"
	cat  "$1/main-preamble-inc.tex" >> "$2/main.tex"
	cat  "$1/main-preamble-cfg.tex" >> "$2/main.tex"
	cat  "$1/main-preamble-end.tex" >> "$2/main.tex"
	cat  "$1/main-document-beg.tex" >> "$2/main.tex"
	cat  "$3"                       >> "$2/main.tex"
	cat  "$1/main-document-end.tex" >> "$2/main.tex"
	cp "$1/Makefile" "$2/Makefile"
}


if [ -z "$1" ]
then
	FILES=formulas/*
else
	FILES=$1
fi


for f in $FILES
do
	if [ -e "$f" ] 
	then
		if [ -f "$f" ]
		then
			directoryTmp="$(mktemp -d)"
			filename="${f##*/}" 

			createMainLaTeXFile "$directoryTpl" "$directoryTmp" "${CURRENTDIR}/${f}"

			mkdir -p "$directoryTar"
			cd "$directoryTmp"
			make clean
			make

			pdfcrop main.pdf	
			pdf2svg main-crop.pdf main-crop.svg	

			mv main-crop.pdf "${directoryTar}/${filename%.*}.pdf"
			mv main-crop.svg "${directoryTar}/${filename%.*}.svg"
		
			make clean
			rm -f "$directoryTmp/main.tex"
			rm -f "$directoryTmp/Makefile"
			rmdir "$directoryTmp"
			cd "$CURRENTDIR"
		fi
	else
		echo "File or directory not exists!"
	fi
done
echo ">--- Finish ---<"

