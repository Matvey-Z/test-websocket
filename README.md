**-- ЗАДАНИЕ --**

 Использовать дистрибутив Ubuntu 16.04 LTS

***1. Cобрать apache-модули https://github.com/disconnect/apache-websocket для apache2.x***

***2. Модифицировать python-сценарий сборки/установки модулей так, что бы все SO-модули
инсталлировались как stripped ELFы.***
`Решение`: 
Добавить параметр -s для gcc

```
mod_websocket = env.SharedLibrary(source=["mod_websocket.c"],
SHLIBPREFIX="",
SHLINKFLAGS="-s -shared",
SHLIBSUFFIX=".so")

mod_websocket_draft76 = env.SharedLibrary(source=["mod_websocket_draft76.c"],
SHLIBPREFIX="",
SHLINKFLAGS="-s -shared",
SHLIBSUFFIX=".so")
```


***3. Оттестировать работоспособность модулей при помощи примеров examples, приложенных к исходным текстам,
получить скриншоты процесса.***
`Скриншоты:`
	echo.png
	increment.png	


***4. Написать bash-сценарий автоматического развертывания тестовых конфигураций модулей,
которые использованы в п.3.***
`Скрипт:`
	deploy.sh
	

***5. Написать CLI python-сценарий для нагрузрчного тестирования /echo сокета из примеров п.3.
Использовать любую python-библиотеку webсокетов, поставляемую в дистрибутиве. 
Сценарий должен выполнить N последовательных подключений к /echo сокету 
и отправить M последовательных запросов.***
`Сценарий:`
	cli_websocket


***6. Упаковать результаты сборки в пакет debian.***
`Пакет:`
	apache-websocket.deb


***7. Результаты работы опубликовать под своей учетной записью на github.***


