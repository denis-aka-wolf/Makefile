# Инструкция по установке и запуску

Эта инструкция поможет вам установить и запустить примеры Makefile из этого репозитория на Windows и Linux.

## Требования

- Установленный Make
- Компилятор C (gcc)
- Для Windows: MinGW, MSYS2 или Git Bash

## Установка на Windows

### Вариант 1: MinGW
1. Скачайте и установите MinGW с официального сайта
2. Добавьте пути к MinGW в переменную окружения PATH:
   - `C:\MinGW\bin`
   - `C:\MinGW\msys\1.0\bin`
3. Откройте командную строку и проверьте установку:
   ```cmd
   make --version
   gcc --version
   ```

### Вариант 2: MSYS2
1. Скачайте и установите MSYS2 с https://www.msys2.org/
2. Обновите систему:
   ```bash
   pacman -Syu
   ```
3. Установите необходимые пакеты:
   ```bash
   pacman -S make gcc
   ```

### Вариант 3: Git Bash
1. Установите Git for Windows с https://git-scm.com/
2. Git Bash уже включает Make и GCC

## Установка на Linux

### Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install make gcc
```

### CentOS/Fedora:
```bash
sudo yum install make gcc
```

### Arch Linux:
```bash
sudo pacman -S make gcc
```

## Запуск примеров

1. Склонируйте репозиторий или скачайте его содержимое
2. Перейдите в директорию с примером:
   ```bash
   cd examples/windows  # или examples/linux
   ```
3. Запустите Make:
   ```bash
   make
   ```
4. Для других целей используйте:
   ```bash
   make clean    # очистка
   make help     # справка
   ```

## Примеры в действии

### Простой пример
1. Перейдите в директорию `examples/windows` или `examples/linux`
2. Создайте файл `hello.c` со следующим содержимым:
   ```c
   #include <stdio.h>
   
   int main() {
       printf("Hello, World!\n");
       return 0;
   }
   ```
3. Запустите:
   ```bash
   make
   ```
4. Выполните полученный исполняемый файл:
   ```bash
   ./hello.exe    # Windows
   ./hello        # Linux
   ```

## Диагностика проблем

### Проблема: 'make' is not recognized
**Решение**: Убедитесь, что Make установлен и добавлен в PATH

### Проблема: 'gcc' is not recognized
**Решение**: Установите компилятор GCC

### Проблема: Permission denied
**Решение**: Убедитесь, что файлы имеют правильные права доступа

## Дополнительные ресурсы

- [GNU Make Manual](https://www.gnu.org/software/make/manual/)
- [Makefile Tutorial](https://makefiletutorial.com/)
- [Cross-platform development with Make](https://www.gnu.org/software/make/manual/html_node/Cross_002dPlatform.html)