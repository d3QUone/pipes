#!/bin/sh

# Обновить текущий README
update:
	echo "" >> README.md
	echo "Время $(shell date '+%Y-%m-%d %H:%M:%S')" >> README.md
	echo "-----" >> README.md
	echo "" >> README.md
	echo "Ничего не произошло" >> README.md
