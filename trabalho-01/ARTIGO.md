<!-- ARTIGO.md -->

# Introdução

* Lua foi criada em 1993 por Roberto Ierusalimschy, Luiz Henrique de Figueiredo e Waldemar Celes, membros do Computer Graphics Technology Group na PUC-Rio.

* Lua é uma linguagem pequena e relativamente simples, com apenas 21 palavras reservadas.

# Influências

* Linguagens que influenciaram : Scheme , Icon(por sua concepção) e Python(por sua facilidade de utilização por não-programadores). 

# Classificação

* Lua é uma linguagem de programação poderosa, eficiente e leve, projetada para estender aplicações. Ela permite programação procedural, programação orientada a objetos, programação funcional, programação orientada a dados e descrição de dados.

* Lua é tipada _dinamicamente_, é executada via interpretação de bytecodes para uma máquina virtual baseada em registradores, e tem gerenciamento automático de memória com coleta de lixo incremental. Essas características fazem de Lua uma linguagem ideal para configuração, automação (scripting) e prototipagem rápida.

# Usos

* Projetos como : Adobe Photoshop Lightroom, PlayStation Home, Cheat Engine.

* Jogos como : Angry Birds, Civilization V, Garry's Mod, Grand Chase, Ragnarok Online, World of Warcraft.

# Funcionalidades de _alta_ _expressividade_

* _Tabelas_ : 
 • Estruturas de dados básica de Lua.
 • Cada elemento se constitui de uma chave e um valor, que podem ser de qualquer tipo de Lua.
 
 - Exemplos: 
    • Arrays(Índices numéricos por padrão):
      x = { 1,2,3 } 
      y = { 2,4,9 }
       
    • Objetos : 
      - Em Lua podemos simular objetos através das tabelas, podendo chamar métodos que trabalham dentro da própria tabela.
                  
                  usuario = { nome = "Rodrigo", idade = 23 }
                  usuario.nome = "Rodrigo"
                  usuario.idade = 23
                  host = { ip = "127.0.0.1" ; porta = 8080 }
                  host.ip = "127.0.0.1"
                  host.porta = 8080
                  
    - Podemos também criar funções para usarmos dentro da tabela:
  
        Ex: vector = {}
    
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


# Comparação Lua vs C com foco em _expressividade_
    
   • Lua é estritamente mais expressiva que C, pois :
     
   • Qualquer código em C pode ser reescrito em LUA mantendo a estrutura essencial do programa intacta:
         
         Em C:
              #include <stdio.h>
              void main() {
                int n = 5;
                while (n>=0) {
                  printf("n:%f",n/4);
                  n--;
                  }
              }
         Em Lua: 
              n = 5
              while n>= 0 do
                print(n/4)
                n=n-1
              end
                  
                  
   • Entretanto, alguns códigos em LUA precisam ser violentamente reestruturados para serem escritos em C:

   - em LUA não preciso me preocupar com o tamanho do 'array' , pois a linguagem já aloca e desaloca dinâmicamente a memória para o usuário  
             Ex: Quero criar um array de int de tamanho 'n' em LUA
           
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
          
        • Em C, eu teria que alocar o espaço de memória referente ao tamanho desejado pelo usuario.
                 
                 int main(void){
                    int *vetor;
                    int i, num_componentes;
                    printf("Informe o numero de componentes do vetor\n");
                    scanf("%d", &num_componentes);
                    vetor = (int *) malloc(num_componentes * sizeof(int));
                    for (i = 0; i < num_componentes; i++){
                        printf("\nDigite o valor para a posicao %d do vetor: ", i+1);
                        scanf("%f",&v[i]);
                        }
                    printf("\n*********** Valores do vetor dinamico ************\n\n");
                    for (i = 0;i < num_componentes; i++){
                          printf("%d\n",v[i]);
                    }
                    free(vetor);
                  }
      • Porém em C, se eu quisesse aumentar, adicionando no fim da lista ou no meio um novo elemento, teriamos que fazer uma cópia do array acima para depois alocar mais memória para o novo array (elemento+array atual). Tendo assím, que reestruturar violentamente o código em LUA.
      
      
# Bibliografia

* Site da linguagem: https://www.lua.org/portugues.html
* Wikipedia: https://pt.wikipedia.org/wiki/Lua_(linguagem_de_programação)
