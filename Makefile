#!/bin/sh

# Добавить информацию о репозитории. Никакие дополнительные токены не требуются пока репозиторий открытый.
STARS:=$(shell curl --silent "https://api.github.com/repos/d3QUone/pipes" | jq '.stargazers_count')

# Обновить текущий README
update:
	echo "" >> README.md
	echo "Время $(shell date '+%Y-%m-%d %H:%M:%S')" >> README.md
	echo "-----" >> README.md
	echo "" >> README.md
	echo "$(STARS) звёзд. Больше ничего не произошло" >> README.md
