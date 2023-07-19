
# metatrader_useful_bat
Очистить все папки MetaTrader, Очистить локальную папку MetaTrader, Создать файл для автозапуска всех терминалов

##### Скрипт был протестирован только на MetaTrader 4. Только с ключом /portable. 

#####  Внимание! Перед использованием создать резервные копии всех папок MetaTrader 


[TOC]


##  Руководство по использованию.

### Подготовка файла terminal_paths.txt
1. Запустите все терминалы, с которыми будете работать
2. Запустите файл 1. path_Creator.bat, он создаст файл terminal_paths.txt
3. Проверяем созданный файл terminal_paths.txt, всё ли верно и все ли терминалы попали в список.

### Использование 2. all_mt4_cleaner.bat
1. Файл можно запускать из любой папки, как вам удобно, главное, чтобы рядом лежал созданный файл terminal_paths.txt
2. Будут очищены все папки с терминалами, по порядку, как указано в файле terminal_paths.txt
3. При запуске чистятся все папки с мусором: history\*.* logs\*.* mailbox\*.*  deleted\*.*  experts\logs\*.*  tester\history\*.*  tester\logs\*.*
4. Особенностью данного скрипта является то, что в исключения чистки попадают два файла: symbols.raw и symbols.sel, это позволяет оставлять только нужные пары в "Обзор рынка" после чистки

### Использование 3. create_bat_for_autorun.bat / Читаем ниже про MemReduct
1. При запуске файла нужно будет ввести задержку между запуском терминалов, подбирается экспериментально, от 15 до 60 секунд, зависит от вашего VPS.
2. Далее, если вы испольщуйте MemReduct, напишите yes, или no, если очистка оперитивной памяти вам не нужна.
3. Скрипт создаст файл auto_start_terminals.bat, который нужно поместить в папку Автозагрузка.
4. Тщательно проверяем созданный файл перед использованием.
* Все терминалы запускаются с ключом /portable и /min , значит в режиме портативной версии и свёрнутые в панель задач.
* Очистка памяти происходит сразу после запуска скрипта(после запуска системы, если была перезагрузка и файл добавлен в Автозагрузку), далее скрипт запустит все терминалы с указанной задержкой и в конце, как все терминалы загрузились, снова почистит оперативную память. MemReduct останется запущенным, и будет подчищать оперативку каждые 30-60 минут, зависит от того, Как вы его настроили (читай ниже)

### Настройка и установка MemReduct
1. Скачиваем последний релиз https://github.com/henrypp/memreduct/releases/tag/v.3.4 или по прямой ссылке https://github.com/henrypp/memreduct/releases/download/v.3.4/memreduct-3.4-setup.exe
2. Устанавливаем оставляя все по умолчанию, директорию не меняем.
3. В настройках MemReduct отключаем запуск при старте системы, так же можем добавить очистку каждые 30-60 минут.
4. Остальное не трогаем.

### Добавление в автозагрузку
1. Файл auto_start_terminals.bat нужно поместить в папку C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
2. Или можно в меню пуск найти папку Автозагрузка, открыть её и скопировать файл туда. Этот вариант идентичен первому.

### Использование local cleaner.bat
1. Поместите файл в папку с терминалом (рядом с файлом terminal.exe)
2. Запустите.
3.  Особенностью данного скрипта является то, что в исключения чистки попадают два файла: symbols.raw и symbols.sel, это позволяет оставлять только нужные пары в "Обзор рынка" после чистки
4.  Скрипт создан для очистки папки конкретного терминала. 


====================================================

# metatrader_useful_bat

Clean all MetaTraders folder, Clean Local MetaTrader folder, Create file for autorun all terminals

The script was tested only on MetaTrader 4. Only with the /portable key. 

Usage guide.

**Preparing terminal_paths.txt**
1. Start all terminals you will be working with
2. Run the file 1. path_Creator.bat, it will create the file terminal_paths.txt
3. Check the created terminal_paths.txt file, whether everything is correct and all terminals are in the list.

**Use 2. all_mt4_cleaner.bat**
1. The file can be run from any folder as you like, the main thing is that the created terminal_paths.txt file should be next to it
2. All folders with terminals will be cleaned, in order, as specified in the terminal_paths.txt file.
3. At startup, all folders with garbage will be cleaned: history\*.* logs\*.* mailbox\*.* deleted\*.* experts\logs\*.* tester\history\*.* tester\logs\*.*.
4. The peculiarity of this script is that two files are excluded: symbols.raw and symbols.sel, it allows leaving only necessary pairs in "Market Watch" after cleaning

**Use 3. create_bat_for_autorun.bat** / Read below about MemReduct
1. When running the file you will need to enter a delay between terminal starts, selected experimentally, from 15 to 60 seconds, depends on your VPS.
2. Next, if you use MemReduct, write yes, or no, if you don't need to clear RAM.
3. The script will create a file auto_start_terminals.bat, which should be placed in the Autoload folder.
4. carefully check the created file before using it.
  * All terminals are launched with the /portable and /min switch, so they are in portable mode and minimized to the taskbar.
  * The memory is cleaned immediately after the script is started (after system startup, if there was a reboot and the file is added to Autoloader), then the script will start all terminals with the specified delay and at the end, when all terminals are loaded, it will clean the RAM again. MemReduct will remain running and will clean the RAM every 30-60 minutes, depending on how you have configured it (read below).

**Customize and install MemReduct**
1. Download the latest release https://github.com/henrypp/memreduct/releases/tag/v.3.4 or via direct link https://github.com/henrypp/memreduct/releases/download/v.3.4/memreduct-3.4-setup.exe.
2. Install leaving everything by default, do not change the directory.
3. In MemReduct settings, disable the startup at system startup, we can also add cleaning every 30-60 minutes.
4. Do not touch the rest.



**Use local cleaner.bat**
1. Place the file in the terminal folder (next to terminal.exe).
2. Run it.
3. The peculiarity of this script is that two files get into the exceptions of cleaning: symbols.raw and symbols.sel, it allows to leave only necessary pairs in the "Market Watch" after cleaning
4.  The script is created to clean the folder of a particular terminal. 

