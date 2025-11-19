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

**Le Calling Convention :**
| Argument | Registre utilisé |
|1er | RDI |
2ème | RSI
3ème | RDX
4ème | RCX
5ème | R8
6ème | R9
Valeur de retour :
registre RAX;

**Les Syscalls en assembleur**
Un syscall est une fonction du noyau (Linux dans ton cas) que tu appelles directement.
*Pour Linux en 64 bits :*
Placer le numéro du syscall dans RAX
Mettre les arguments dans RDI, RSI, RDX, RCX, R8, R9
Faire l'instruction syscall
Le retour est dans RAX

Lien:
Assembleur les notions de base https://beta.hackndo.com/assembly-basics/
Les instructions de base de l'assembleur https://sites.uclouvain.be/LSINC1102/pfo/ASM/02-asm-base.html
