#!/bin/sh

DATE:=$(shell date '+%Y-%m-%d %H:%M:%S')
COMMITS_COUNT:=$(shell git rev-list --count HEAD | bc)

# Обновить текущий README
update:
	bash render.sh

	# Собрать готовый файл
	cat base_README.md > README.md
	echo "Последнее обновление $(DATE)" >> README.md
	echo "--------------------\n" >> README.md
	echo "Всего коммитов: $(COMMITS_COUNT)\n" >> README.md
	cat last_run.md >> README.md
