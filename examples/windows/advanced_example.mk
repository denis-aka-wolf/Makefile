# Расширенный пример Makefile для Windows
# Специфичный для среды Windows (MinGW/MSYS2)

# Переменные
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
LIBS = -lmsvcrt
TARGET = program.exe
SRCDIR = src
BUILDDIR = build
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(SOURCES:$(SRCDIR)/%.c=$(BUILDDIR)/%.o)

# Пути к исполняемым файлам
MKDIR = mkdir
RM = rm -f

# Цель по умолчанию
all: $(TARGET)

# Создание директорий
$(BUILDDIR):
	$(MKDIR) $@

# Компиляция объектных файлов
$(BUILDDIR)/%.o: $(SRCDIR)/%.c | $(BUILDDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Линковка
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(LIBS) -o $@

# Очистка
clean:
	$(RM) $(OBJECTS) $(TARGET)

# Полная очистка
distclean: clean
	$(RM) -r $(BUILDDIR)

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