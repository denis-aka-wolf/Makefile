# Расширенный пример Makefile для Linux

# Переменные
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
LIBS = 
TARGET = program
SRCDIR = src
BUILDDIR = build
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Цель по умолчанию
all: $(TARGET)

# Создание директорий
$(BUILDDIR):
	mkdir -p $@

# Компиляция объектных файлов
$(BUILDDIR)/%.o: $(SRCDIR)/%.c | $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Линковка
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(LIBS) -o $@

# Очистка
clean:
	rm -f $(OBJECTS) $(TARGET)

# Полная очистка
distclean: clean
	rm -rf $(BUILDDIR)

# Показать информацию о целях
help:
	@echo "Цели:"
	@echo "  all     - собрать проект"
	@echo "  clean   - удалить объектные и исполняемые файлы"
	@echo "  distclean - полная очистка"
	@echo "  help    - показать эту справку"

# Сборка только для отладки
debug: CFLAGS += -g -DDEBUG
debug: $(TARGET)

# Сборка только для релиза
release: CFLAGS += -O2 -DNDEBUG
release: $(TARGET)

.PHONY: all clean distclean help debug release