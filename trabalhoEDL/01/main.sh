cat test | grep "Rodrigo Teixeira" > nota_aluno

# No primeiro passo 'cat' eu vou listar o que tem dentro do arquivo test, apos isso , eu vou usar o comando pipe '|' passando como meu input o meu output do cat, que no caso é a lista. No segundo comando 'grep' , ele vai procurar através do input dado a string passada e se possuir ele vai passar a string como output para o nota_aluno através do comando '>' 
