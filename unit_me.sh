make clean && make
cd ./unit_test && make && cd ..
[ ! -d "./unit_test/test_out" ] && mkdir ./unit_test/test_out

for f in ./unit_test/out/*.bin; do
	echo $f | cut -c 26-
	echo c | ./main.elf 0x0 "$f" > ./unit_test/test_out/"$(echo $f | cut -c 26-)".out
done