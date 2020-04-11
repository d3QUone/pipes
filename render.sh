#!/bin/bash -x

# Скачать новую мета-инфу. Никакие дополнительные токены не требуются пока репозиторий открытый.
# https://developer.github.com/v3/repos/#get-a-repository
META=$(curl --silent "https://api.github.com/repos/d3QUone/pipes")
STAR_COUNT=$(echo ${META} | jq '.stargazers_count' | bc)
ISSUES_COUNT=$(echo ${META} | jq '.open_issues' | bc)

# Отрендерить новый шаблон (только данные, без времени)
TEMP_FILE=current_run.md
LAST_FILE=last_run.md

rm -f ${TEMP_FILE}
touch ${TEMP_FILE}
touch -a ${LAST_FILE}

echo "* Звёзд: ${STAR_COUNT}" >> ${TEMP_FILE}
if [ ${ISSUES_COUNT} -gt 0 ]
then
    echo "* Открытых задач: ${ISSUES_COUNT}" >> ${TEMP_FILE}
fi

# Сравнить с прошлым прогоном
# TODO: убрать неиспользуемую переменную
DIFF=$(diff ${LAST_FILE} ${TEMP_FILE} > /dev/null 2>&1)
DIFF_ERROR=$?

# Вот тут есть нюанс с exit-кодами: даже если произошла ошибка,
# то возвращаем всё равно 0, т.к. иначе ``workflow`` упадёт.
if [ ${DIFF_ERROR} -eq 2 ]; then
    echo "unknown diff DIFF_ERROR, exit"
    exit 0
elif [ ${DIFF_ERROR} -eq 1 ]; then
    # Есть различия
    echo "ok, updating..."
else
    # Вернуть ошибку если ничего не изменилось
    echo "no changes, exit"
    exit 0
fi

# Обновить состояние
cat ${TEMP_FILE} > ${LAST_FILE}

# Обновить текущий README
DATE=$(date '+%Y-%m-%d %H:%M:%S')
COMMITS_COUNT=$(git rev-list --count HEAD | bc)

# Собрать готовый файл
cat base_README.md > README.md
printf "## Последнее обновление ${DATE}\n\n" >> README.md
printf "Всего коммитов: ${COMMITS_COUNT}\n\n" >> README.md
cat last_run.md >> README.md
