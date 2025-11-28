# Простой пример Makefile для Windows
# Использует MinGW или MSYS2

# Переменные
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
TARGET = hello.exe
SOURCE = hello.c

# Цель по умолчанию
all: $(TARGET)

# Компиляция
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $@ $^

# Очистка
clean:
	rm -f $(TARGET)

# Очистка всех файлов
distclean: clean
	rm -f *.o

# Показать информацию о целях
help:
	@echo "Цели:"
	@echo "  all     - собрать проект"
	@echo "  clean   - удалить исполняемые файлы"
	@echo "  distclean - удалить все созданные файлы"
	@echo "  help    - показать эту справку"

.PHONY: all clean distclean help