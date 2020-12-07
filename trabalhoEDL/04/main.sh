#Une as p1 e p2 e depois Pega as médias e diz se está Aprovado,Reprovado ou Prova Final
paste aluno/p1.txt aluno/p2.txt | awk '{print $1,$2,$0=$3+$6}' > aluno/media.txt | awk '{
  if ($3/2 >= 7)
	  print $1,$2,"=>","Aprovado";
  else if ($3/2 >= 4)
    print $1,$2,"=>","Prova Final";
  else
	  print $1,$2,"=>","Reprovado";
}' aluno/media.txt
