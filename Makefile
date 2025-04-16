# Nom de la librairie
NAME = libasm.a

SRC = ft_strlen.s \
	ft_strcpy.s \
	ft_strcmp.s \
	ft_write.s \
	ft_read.s \
	ft_strdup.s

# Transformation les fichiers .s en fichiers objets .o
OBJ = $(SRC:.s=.o)

# Commande pour assembler avec NASM en mode ELF64
NASM = nasm
NASMFLAGS = -f elf64 #définit le format ELF en 64 bits, adapté aux architectures 64-bit sous Linux.

# Règle par défaut qui construit la librairie
all: $(NAME)

# Création de la librairie statique à partir des objets
$(NAME): $(OBJ)
	@echo "Création de la librairie $(NAME)..."
	ar rcs $(NAME) $(OBJ)
# ar : outil de création d'archives statiques.
# r : remplace les fichiers existants.
# c : crée l'archive si elle n'existe pas.
# s : génère l'index.

# Règle de compilation d'un fichier assembleur en objet
%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

# Règle pour supprimer les fichiers objets
clean:
	@echo "Nettoyage des fichiers objets..."
	rm -f $(OBJ)

# Règle pour supprimer les fichiers objets et la librairie
fclean: clean
	@echo "Suppression de la librairie $(NAME)..."
	rm -f $(NAME)

# Règle pour recompiler entièrement le projet
re: fclean all

# Déclaration des cibles qui ne sont pas des fichiers
.PHONY: all clean fclean re
