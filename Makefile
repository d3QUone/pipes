#!/bin/sh

DATE:=$(shell date '+%Y-%m-%d %H:%M:%S')

# Обновить текущий README
update:
	bash render.sh

	# Собрать готовый файл
	cat base_README.md > README.md
	echo "Последнее обновление $(DATE)" >> README.md
	echo "--------------------" >> README.md
	echo "" >> README.md
	cat last_run.md >> README.md
