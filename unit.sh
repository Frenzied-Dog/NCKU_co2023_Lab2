# cd ./MyLab2 && make && cd ..
cd ./unit_test && make && cd ..
[ ! -d "./unit_test/test_out" ] && mkdir ./unit_test/test_out
make
for f in ./unit_test/out/*.bin; do
	echo $f | cut -c 26-
	echo c | ./emu.elf 0x0 "$f" > ./unit_test/test_out/"$(echo $f | cut -c 26-)".out
done