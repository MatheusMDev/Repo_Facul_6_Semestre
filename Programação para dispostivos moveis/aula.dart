int main()
{
  // int idade = 29;
  // print(idade);
  
  // double raio = 10.25;
  
  // String nome = "Rafael";
  // print("Ola $nome, seja bem vindo");
  
  // bool ligado = true;
  // var qualquer = 1;
  // double media = 7;
  // var mensagem = media >= 7 ? "Aprovado" : "Reprovado";
  // print(mensagem);

  Soma(10, 20);
  Subtracao(10, 20);
  multiplicacao(10, 20);
  
   return 0;
}

void Soma (int a, int b)
{
  print(a+b);
}

int Subtracao(int a, int b)
{
  return a-b;
}

// esse codigo abaixo é a mesma coisa do que abrir chaves do de cima.
int multiplicacao(int a, int b) => a*b;