#!/bin/sh
BASEDIR=$(dirname "$0")

prueba1()
{
	cat $BASEDIR/tests/input1.txt | ./tp0 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output1.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

prueba2()
{
	cat $BASEDIR/tests/input2.txt | ./tp0 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output2.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

prueba3()
{
	cat $BASEDIR/tests/input3.txt | ./tp0 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output3.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

echo "Ejecutando pruebas"

prueba1
echo "Prueba 1: $RESULTADO"
prueba2
echo "Prueba 2: $RESULTADO"
prueba3
echo "Prueba 3: $RESULTADO"
