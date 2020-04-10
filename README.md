Настройка
---------

Нужно создать `GITHUB_TOKEN` и положить его в `Settings -> Secrets -> Add a new secret`.

Нюансы
------

Бесплатно только для публичных репозиториев!

У `GitHub Actions` есть лимиты:

* один job внутри workflow не более 6 часов выполнения;
* один workflow не более 72 часов выполнения;
* не более 1к запросов к API / час от репозитория;
* не более 10 одновременных job

Источник: https://help.github.com/en/actions/getting-started-with-github-actions/about-github-actions#usage-limits
