# Libasm

**Syntaxe Intel vs AT&T**
Il existe principalement deux syntaxes pour écrire de l'assembleur : la syntaxe Intel et la syntaxe AT&T. Voici les principales différences :
**Syntaxe Intel :**
Utilisée par les assembleurs comme NASM et MASM.
L'ordre des opérandes est destination, source.
*Exemple* : mov eax, ebx (copie la valeur de ebx dans eax).
**Syntaxe AT&T :**
Utilisée par l'assembleur GAS (GNU Assembler).
L'ordre des opérandes est source, destination.
Les registres sont préfixés par %.
*Exemple* : mov %ebx, %eax (copie la valeur de ebx dans eax).

**Architecture 64 bits**
Les processeurs 64 bits peuvent adresser plus de mémoire que les processeurs 32 bits.
Les registres sont plus grands (par exemple, rax au lieu de eax).
Permet d'utiliser des instructions spécifiques aux architectures 64 bits.
**Autres architectures :**
32 bits : Utilisé dans les systèmes plus anciens, avec des registres comme eax, ebx, etc.
16 bits : Encore plus ancien, utilisé dans les premiers PC.

Lien:
Assembleur les notions de base https://beta.hackndo.com/assembly-basics/
Les instructions de base de l'assembleur https://sites.uclouvain.be/LSINC1102/pfo/ASM/02-asm-base.html
