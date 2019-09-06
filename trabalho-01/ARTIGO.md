<!-- ARTIGO.md -->

# Linguagem Lua

## Introdução

* Lua foi criada em 1993 por Roberto Ierusalimschy, Luiz Henrique de Figueiredo e Waldemar Celes, membros do Computer Graphics Technology Group na PUC-Rio.

* Lua é uma linguagem pequena e relativamente simples, com apenas 21 palavras reservadas.

## Influências

* Linguagens que influenciaram : Scheme , Icon(por sua concepção) e Python(por sua facilidade de utilização por não-programadores). 

## Classificação

* Lua é uma linguagem de programação poderosa, eficiente e leve, projetada para estender aplicações. Ela permite programação procedural, programação orientada a objetos, programação funcional, programação orientada a dados e descrição de dados.

* Lua é tipada _dinamicamente_, é executada via interpretação de bytecodes para uma máquina virtual baseada em registradores, e tem gerenciamento automático de memória com coleta de lixo incremental. Essas características fazem de Lua uma linguagem ideal para configuração, automação (scripting) e prototipagem rápida.

## Usos

* Projetos como : Adobe Photoshop Lightroom, PlayStation Home, Cheat Engine.

* Jogos como : Angry Birds, Civilization V, Garry's Mod, Grand Chase, Ragnarok Online, World of Warcraft.

## Funcionalidades de _alta_ _expressividade_

#### Tabelas
 
* Estruturas de dados básica de Lua.
* Cada elemento se constitui de uma chave e um valor, que podem ser de qualquer tipo de Lua.
 
* Exemplos: 
      
  * Arrays (Índices numéricos por padrão):
    ```lua
    x = { 1,2,3 } 
    y = { 2,4,9 }
    ```
      
  * Objetos : 
    Em Lua podemos simular objetos através das tabelas, podendo chamar métodos que trabalham dentro da própria tabela.
    ```lua
    usuario = { nome = "Rodrigo", idade = 23 }
    usuario.nome = "Rodrigo"
    usuario.idade = 23
    host = { ip = "127.0.0.1" ; porta = 8080 }
    host.ip = "127.0.0.1"
    host.porta = 8080
    ```
                
  * Podemos também criar funções para usarmos dentro da tabela:
    ```lua
    vector = {}

    vector.criar = function (x,y)
          return { x=x , y=y }
    end

    vector.soma = function (v1,v2)
        vec = {}
        vec.x = v1.x + v2.x
        vec.y = v1.y + v2.y
        return vec
    end

    function vector.print(v)
        print("(".. v.x .." , ".. v.y ..")")
    end

    v1 = vector.criar(1,2)
    v2 = vector.criar(3,4)
    vector.print(vector.soma(v1,v2))
    ```

#### Corotinas

Corotinas permitem que o fluxo de controle seja passado cooperativamente entre duas funções sem que nenhuma delas tenha que ser finalizada.

Quando uma função chama uma corotina, essa corotina pode ser executada até um certo ponto e então ceder o controle de volta para a função que a chamou, passando algum valor de volta para ela.

Em Lua, uma corotina é:
* Criada, com a função `coroutine.create()`, que recebe uma função e retorna uma referência para a corotina.
* Continuada, com a função `coroutine.resume()`, que recebe a corotina que se deseja continuar e os argumentos para iniciar sua função (estes são ignorados se a corotina já houver sido iniciada).
* Pausada, usando a função `coroutine.yield()`. A função que chamou a corotina, neste caso, recebe o seu status, `true`, e quaisquer argumentos passados para `coroutine.yield()`.
* Finalizada, quando a corotina atingir o final da função ou o comando `return` for utilizado. A função que a chamou recebe o status da corotina, `true`, e quaisquer valores retornados.

Se `coroutine.resume()` for chamada após a corotina já ter sido finalizada, ela retorna apenas o seu status, `false`.

Algo a se notar é que, em Lua, se o número de valores retornados por uma função for menor que a lista de variáveis que receberão seus valores, as variáveis "extras" recebem `nil`.

Exemplo:
```lua
co = coroutine.create(function (inicio, fim, passo)
    for i = inicio, fim, passo do
        coroutine.yield(i*23 + 9)
        coroutine.yield(i*13 - 2)
        coroutine.yield(i*11)
    end
end)

while true do
    status, ret = coroutine.resume(co, 0, 2, 0.5)
    if ret == nil then
        break
    end
    print(status, ret)
end
```

saída:
```
true	9.0
true	-2.0
true	0.0
true	20.5
true	4.5
true	5.5
true	32.0
true	11.0
true	11.0
true	43.5
true	17.5
true	16.5
true	55.0
true	24.0
true	22.0
```

Primeiro, uma corotina é criada utilizando `coroutine.create()`, que recebe uma função anônima que gera números em um loop.
Em seguida, entramos em um laço infinito, onde a função `coroutine.resume()` continua a corotina e, quando ela for pausada ou finalizada, ela retorna um ou dois valores, respectivamente.
Se a corotina foi pausada, neste caso, o valor de `ret` será igual a uma das fórmulas usadas no loop e esse valor será imprimido. Caso ela tenha sido finalizada, seu valor será `nil` e o laço será interrompido.

# Comparação Lua vs C com foco em _expressividade_
    
Lua é estritamente mais expressiva que C, pois qualquer código em C pode ser reescrito em LUA mantendo a estrutura essencial do programa intacta:
* Em C:
  ```C
  #include <stdio.h>
  void main() {
    int n = 5;
    while (n>=0) {
      printf("n:%f",n/4);
      n--;
      }
  }
  ```
* Em Lua:
  ```lua
  n = 5
  while n>= 0 do
    print(n/4)
    n=n-1
  end
  ```
                  
Entretanto, alguns códigos em LUA precisam ser violentamente reestruturados para serem escritos em C:

  * em LUA não preciso me preocupar com o tamanho do 'array' , pois a linguagem já aloca e desaloca dinâmicamente a memória para o usuário  
  Ex: Quero criar um array de int de tamanho 'n' em LUA
    ```lua
    numero={}
    table.insert(numero,10)
    table.insert(numero,20)
    table.insert(numero,30)
    table.insert(numero,40)
    table.insert(numero,50)
    table.insert(numero,60)
    table.insert(numero,6,55)
    table.remove(numero,3)
    for key in pairs(numero) do
        print(numero[key])
    end
    ```
  * Em C, eu teria que alocar o espaço de memória referente ao tamanho desejado pelo usuario.
    ```C
    int main(void){
      int *vetor;
      int i, num_componentes;
      printf("Informe o numero de componentes do vetor\n");
      scanf("%d", &num_componentes);
      vetor = (int *) malloc(num_componentes * sizeof(int));
      for (i = 0; i < num_componentes; i++){
          printf("\nDigite o valor para a posicao %d do vetor: ", i+1);
          scanf("%d",&vetor[i]);
          }
      printf("\n*********** Valores do vetor dinamico ************\n\n");
      for (i = 0;i < num_componentes; i++){
            printf("%d\n",vetor[i]);
      }
      free(vetor);
    }
    ```
    Porém em C, se eu quisesse aumentar, adicionando no fim da lista ou no meio um novo elemento, teriamos que fazer uma cópia do array acima para depois alocar mais memória para o novo array (elemento+array atual). Tendo assím, que reestruturar violentamente o código em LUA.

Outro exemplo da expressividade de Lua é o programa visto em __Funcionalidades de alta expressividade - corotinas__:

```lua
co = coroutine.create(function (inicio, fim, passo)
    for i = inicio, fim, passo do
        coroutine.yield(i*23 + 9)
        coroutine.yield(i*13 - 2)
        coroutine.yield(i*11)
    end
end)

while true do
    status, ret = coroutine.resume(co, 0, 2, 0.5)
    if ret == nil then
        break
    end
    print(status, ret)
end
```

C não possui coroutinas de forma nativa como Lua. Para traduzir o programa acima para C, será necessário guardar suas variáveis de forma estática e utilizar variáveis e comandos de controle de fluxo para guardar o estado da "corotina".

```C
#include <stdio.h>
#include <stdlib.h>

#define true 1
#define false 0
#define bool int

bool minhaCorotina(double inicio, double fim, double passo, bool* status, double* ret);

int main(void) {
    bool status; double ret;
    bool corotinaAcabou;
    while ((corotinaAcabou=minhaCorotina(0, 2, 0.5, &status, &ret)))
        printf("%s\t%.1f\n", status ? "true" : "false", ret);
}

double i = 0;
int qualYield = 0;
bool corotinaComecou = false;
bool corotinaAcabou = false;

bool minhaCorotina(double inicio, double fim, double passo, bool *status, double *ret) {
    if (corotinaAcabou) {
        *status = false;
        return false;
    }
    if (!corotinaComecou) {
        i = inicio;
        corotinaComecou = true;
    }
    while (i <= fim) {
        switch (qualYield) {
            case 0:
                *ret = i*23 + 9;
                break;
            case 1:
                *ret = i*13 - 2;
                break;
            case 2:
                *ret = i*11;
                break;
            default:
                return false;
        }
        *status = true;
        qualYield = (qualYield+1) % 3;
        if (qualYield == 0)
            i += passo;
        return true;
    }

    corotinaAcabou = true;
    *status = true;
    return false;
}
```
Saída:
```
true	9.0
true	-2.0
true	0.0
true	20.5
true	4.5
true	5.5
true	32.0
true	11.0
true	11.0
true	43.5
true	17.5
true	16.5
true	55.0
true	24.0
true	22.0
```

Como pode se ver, enquanto que a implementação em Lua é pequena e fácil de se entender, a estrutura de controle necessária na tradução para C torna a função não só difícil de se entender mas também de se modificar.
      
## Bibliografia

* Site da linguagem: https://www.lua.org/portugues.html
* Wikipedia: https://pt.wikipedia.org/wiki/Lua_(linguagem_de_programação)
