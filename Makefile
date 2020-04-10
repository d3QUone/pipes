#!/bin/sh

# Добавить информацию о репозитории. Никакие дополнительные токены не требуются пока репозиторий открытый.
DATE:=$(shell date '+%Y-%m-%d %H:%M:%S')
STARS:=$(shell curl --silent "https://api.github.com/repos/d3QUone/pipes" | jq '.stargazers_count')
COMMITS:=$(shell git rev-list --count HEAD)

# Обновить текущий README
update:
	# Скопировать базовый шаблон
	cat base_README.md > README.md
	# Дополнить его всем необходимым
	echo "Последнее обновление $(DATE)" >> README.md
	echo "--------------------" >> README.md
	echo "" >> README.md
	echo "* Звёзд: $(STARS)" >> README.md
	echo "* Коммитов: $(COMMITS)" >> README.md
