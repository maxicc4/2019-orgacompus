#!/bin/sh
BASEDIR=$(dirname "$0")

prueba1()
{
	cat $BASEDIR/tests/input1.txt | ./tp1 > $BASEDIR/tests/temp.txt

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
	cat $BASEDIR/tests/input2.txt | ./tp1 > $BASEDIR/tests/temp.txt

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
	cat $BASEDIR/tests/input3.txt | ./tp1 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output3.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

prueba4()
{
	cat $BASEDIR/tests/input4.txt | ./tp1 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output4.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

prueba5()
{
	cat $BASEDIR/tests/input5.txt | ./tp1 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output5.txt 1>/dev/null
	if [ $? -eq 0 ]; then
		RESULTADO="OK"
	else
		RESULTADO="ERROR"
	fi
	rm $BASEDIR/tests/temp.txt
}

prueba6()
{
	cat $BASEDIR/tests/input6.txt | ./tp1 > $BASEDIR/tests/temp.txt

	diff -q $BASEDIR/tests/temp.txt $BASEDIR/tests/output6.txt 1>/dev/null
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
prueba4
echo "Prueba 4: $RESULTADO"
prueba5
echo "Prueba 5: $RESULTADO"
prueba6
echo "Prueba 6: $RESULTADO"

