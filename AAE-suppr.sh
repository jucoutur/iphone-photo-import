for f in *.AAE
do
	# suppression du fichier sidecar .AAE
	rm "$f"
	jpg=${f/.AAE/.JPG}
	png=${f/.AAE/.PNG}
	mov=${f/.AAE/.MOV}
	ejpg="${f:0:4}"E"${f:4:4}.JPG"
	emov="${f:0:4}"E"${f:4:4}.MOV"
	# Si JPG custom + JPG original => suppr du JPG original + renommer le JPG custom
	test -f "$ejpg" -a -f "$jpg" && rm "$jpg" && mv "$ejpg" "$jpg"
	# Si JPG custom + PNG (capture d'ecran) => suppr du PNG + renommer le JPG custom
	test -f "$ejpg" -a -f "$png" && rm "$png" && mv "$ejpg" "$jpg"
	# Si MOV custom + MOV original => suppr du MOV original + renommer le MOV custom
	test -f "$emov" -a -f "$mov" && rm "$mov" && mv "$emov" "$mov"
	# Si JPG custom et pas de JPG ou PNG original => uniquement renommer le JPG custom
	test -f "$ejpg" -a ! -f "$jpg" -a ! -f "$png" && mv "$ejpg" "$jpg"
done
echo "-- Traitement des photos terminé --"
