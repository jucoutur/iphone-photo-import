for f in *.AAE
do
	# remove .AAE sidecar
	rm "$f"
	jpg=${f/.AAE/.JPG}
	png=${f/.AAE/.PNG}
	mov=${f/.AAE/.MOV}
	ejpg="${f:0:4}"E"${f:4:4}.JPG"
	emov="${f:0:4}"E"${f:4:4}.MOV"
	# If both modifed JPG AND original JPG exist => remove original JPG + rename modified JPG
	test -f "$ejpg" -a -f "$jpg" && rm "$jpg" && mv "$ejpg" "$jpg"
	# If both modifed JPG AND original PNG (screenshot) exist => remove original PNG + rename modified JPG
	test -f "$ejpg" -a -f "$png" && rm "$png" && mv "$ejpg" "$jpg"
	# If modifed JPG exists AND neither original not PNG file exist => rename modified JPG only
	test -f "$ejpg" -a ! -f "$jpg" -a ! -f "$png" && mv "$ejpg" "$jpg"
	# If both modified MOV AND original MOV exist => remove original MOV + rename modified MOV
	test -f "$emov" -a -f "$mov" && rm "$mov" && mv "$emov" "$mov"
done
echo "-- OK : files have been processed --"
