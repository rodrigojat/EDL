<!-- ARTIGO.md -->

# Linguagem PHP

## Introdução

* Criado em 1994 por Rasmus Lerdof, a primeira versão do PHP foi um conjunto de binários Common Gateway Interface (CGI) escrito na linguagem de programação C.

* Sua função era para acompanhamento de visitas do seu currículo online, nomeando o conjunto de scripts de “Personal Home Page Tools”, frequentemente referenciado como “PHP Tools”.

## Influências

* O PHP é uma linguagem de desenvolvimento com uma sintaxe baseada no C/C# e no Java. 

## Classificação

* PHP é uma linguagem interpretada, imperativa, funcional, orientada a objeto,procedural e de tipagem fraca e dinâmica.

## Usos

* O PHP, apesar de ser classificada como linguagem de uso geral, é essencialmente adequado para o desenvolvimento web e pode ser embutido em documentos HTML,ou seja, é capaz de escrever páginas HTML completas, assim como pode receber informações de páginas HTML, como por ex: dados de um formulário.

## Exemplos de uso
 ```php
   <!DOCTYPE html>
<html>
 <body>  
   <?php
 	 $name = "Rodrigo";
 	 $age = 24;
     $faculdade = "UERJ";
     echo "Estudo na $faculdade";
    ?>
    <h1>Brincando com php</h1>
    <h3><?="Seu nome eh $name e sua idade eh $age"  ?></h3>
 </body>
</html>
```
![Screenshot_1](https://user-images.githubusercontent.com/20865550/77265929-cf6d1b00-6c7c-11ea-9561-907036bb403a.png)

## Funcionalidade de _alta_ _expressividade_

#### Trait
 
* É um mecanismo para agregar caracteristicas/comportamentos a um conjuntos de classes de forma horizontal.

* A diferença entre uma herença simples (com extends) para uma herança com trait é que a herança simples se da de forma vertical, pois as linguagens tanto php como Java só permitem que uma classe herde diretamente de uma única classe. Por outro lado, é possível agregar várias traits a uma única classe, por isso dizemos que é herança horizontal.

* De forma resumida : trait é um pacote de características/comportamentos semelhantes às classes abstratas, mas que podem ser acopladas a classes. Uma classe pode ter inúmeras traits.

```php
  <?php
 trait Velocidade {
 public function velo() {
     echo "velocidade eh de " ; 
   }
 }

 class Pessoa {
   public $idade;
   public $peso;
   public $nome;
   use Velocidade;
   public function VeloPessoa (){
     echo "8";
   }
 }

 class Carro {
   public $marca;
   public $modelo;
   public $anodefabricacao;
   use Velocidade;
   public function VeloCarro (){
     echo "75";
   }
 }

 $obj = new Pessoa();
 $obj2 = new Carro();
 $obj2->velo();
 $obj2->VeloCarro();
 echo "<br>";
 $obj->velo();
 $obj->VeloPessoa();
 ?>
 ```
 
## Comparação com Java utilizando traits

* Em Java, por se tratar de objetos totalmente diferentes que possuem algo em
comum (Velocidade) e não poder ter heranças múltiplas, teríamos que criar
duas classes também, entretanto haveria um maior custo de memória, pois
teríamos que fazer mais funções de get e set para descobrir a velocidade e
armazená-la em cada enquanto em php só preciso de uma função que
retorna o valor.

![Screenshot_4](https://user-images.githubusercontent.com/20865550/77266202-8f5a6800-6c7d-11ea-9cd7-a4b3dc46af23.png)


## Bibliografia

* Site da linguagem: https://www.php.net/manual/en/index.php
* TreinaWeb: https://www.treinaweb.com.br/blog/quando-usar-traits-no-php/
