CC = cc
CFLAGS = -Wall -Wextra -Werror -Isrc
NAME = libft.a
SRC = $(wildcard src/*.c)
OBJ = $(SRC:.c=.o)
RM = rm -f

TESTS = $(wildcard tests/*.c)
LIBCMOCKA_DIR = cmocka/
LIBCMOCKA_FlAGS = -I$(LIBCMOCKA_DIR)/include -L$(LIBCMOCKA_DIR)/build/src -lcmocka
LIBCMOCKA_BUILD_FLAGS = -DBUILD_SHARED_LIBS=OFF
LIBCMOCKA = $(CMOCKA_DIR)/build/src/libcmocka.a
TEST_RUNNER = $(LIBCMOCKA_DIR)/cmocka_tests_runner

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

tclean:
	$(RM) -r $(TEST_RUNNER) $(LIBCMOCKA_DIR)

fclean: clean tclean
	$(RM) $(NAME)

re: fclean all

# Tests
test: $(LIBCMOCKA) $(NAME)
	$(CC) $(CFLAGS) $(TESTS) $(LIBCMOCKA_FlAGS) $(NAME) -o ${TEST_RUNNER}
	./${TEST_RUNNER}

$(LIBCMOCKA_DIR):
	git clone --depth=1 https://gitlab.com/cmocka/cmocka.git $@

$(LIBCMOCKA): $(LIBCMOCKA_DIR)
	cd $(LIBCMOCKA_DIR) && mkdir -p build && cd build && cmake $(LIBCMOCKA_BUILD_FLAGS) .. && make

.PHONY: all clean fclean tclean re test
