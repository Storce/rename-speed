cd bash-test

../setup.sh $1

bash_start=$(gdate +%s%3N)
../test-bash.sh
bash_end=$(gdate +%s%3N)
bash_time=$(( $bash_end - $bash_start ))

rm -f *

echo "Bash took $bash_time ms."


cd ..


cd python-test

../setup.sh $1

python_start=$(gdate +%s%3N)
python3 ../test-python.py
python_end=$(gdate +%s%3N)
python_time=$(( $python_end - $python_start ))

rm -r *

echo "Python took $python_time ms."


if [[ $python_time -gt $bash_time ]]; then
	percent_diff=$(echo "scale=2; ($python_time - $bash_time) / $bash_time * 100 " | bc)
	echo "Python is slower by $percent_diff %"
else
	percent_diff=$(echo "scale=2; ($bash_time - $python_time) / $python_time * 100 " | bc)
	echo "Bash is slower by $percent_diff %"
fi
