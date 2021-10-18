# Desafio Mobile2You - TodoMovies

Este desafio consiste na criação de uma réplica da tela de detalhe dos filmes do aplicativo [TodoMovies](https://apps.apple.com/br/app/todomovies-4/id792499896) utilizando Swift.

<img alt="Captura da tela de detalhe dos filmes. Na imagem, temos uma foto em escala de cinza do rosto do ator Johnny Depp, e os detalhes do filme O melhor de Johnny Depp" src="https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/97/0e/e2/970ee217-13cf-1674-b016-461aca657663/pr_source.png/460x0w.png" height="500">

## 📝 Especificação

Para realizar este projeto, recebi instruções sobre os requisitos e também dicas que auxiliaram bastante no processo. Abaixo, a lista com todas as informações:

### ☑️ Requisitos

1. Usar algum design pattern: MVP, MVVM, MVVM-C, VIPER
2. As informações do filme devem vir do endpoint [getMovieDetails](https://developers.themoviedb.org/3/movies/get-movie-details)
3. Usar o `vote_count` que retorna da API para apresentar o número de likes
4. Substituir o "3 of 10 watched" por "`<popularity>` views", utilizando o valor retornado da API e mantendo algum ícone ao lado
5. O ícone de like(coração) deve mudar quando clicado, alternando entre preenchido e vazio.
6. Deve haver uma lista de filmes abaixo dos detalhes
7. O app deve ser desenvolvido utilizando a linguagemm Swift
8. O projeto deve ser disponibilizado em um repositório aberto no GitHub. Envie a URL assim que possível

### 💡 Dicas 

1. Você pode usar o Alamofire para facilitar a sua vida (é apenas uma dica, não é obrigatório)
2. A lista de filmes abaixo do detalhe do filme pode ser o retorno da [getSimilarMovies](https://developers.themoviedb.org/3/movies/get-similar-movies)
3. Gostamos de Rx
4. Testes são sempre bem-vindos
5. Vamos olhar tudo, inclusive commits, branches, organização de pastas, etc.
6. Um código limpo e organizado pode ser mais importante do que o app todo pronto.
7. Vamos ler seu README, caso você queira deixar alguma mensagem para nós

## 📱 O projeto

Abaixo, temos o resultado final da interface da aplicação:

<img alt="Captura de tela da aplicação contida neste projeto. No topo, a capa do filme 'Ready Player One'. Logo em seguida, seu título. Abaixo do título temos um ícone de coração com o contador de likes, e, ao lado, um ícone de fogo e o indicador de popularidade. Abaixo, uma lista de filmes relacionados." src="https://i.ibb.co/RTVbW3Y/Simulator-Screen-Shot-i-Phone-12-2021-10-17-at-22-53-15.png" height="500">

Todos os requisitos foram atendidos na implementação deste projeto. O design pattern escolhido foi o MVP, os dados do filme e a lista de filmes recomendados são obtidos nos <i>endpoints</i> da [API](https://developers.themoviedb.org/3).

Para comunicação com a API, escolhi utilizar a biblioteca Alamofire, e implementei serviços para cada entidade(Filme e Gênero). Utilizei RxSwift nos serviços, com cada método retornando uma  `Observable` com o tipo do seu retorno. Cada serviço foi construído como um Singleton, sem precisar criar uma instância para utilizá-lo.

### ⬇️ Como baixar e executar

Primeiramente, é necessário clonar o repositório. Certifique-se de quê você tem o [Git](https://git-scm.com/downloads) instalado na sua máquina. Para obter o código-fonte, você pode utilizar o comando abaixo:

```bash
$ git clone https://github.com/rychillie/desafio-mobile2you
```

Feito isso, você deve abrir o projeto utilizando o Xcode.

Para conseguir construir e executar a aplicação é necessário configurar uma variável de ambiente no Xcode. Na parte superior, ao lado do nome do dispositivo simulador, clique em Mobile2You >  Edit Scheme, conforme o exemplo abaixo:

<img alt="Captura de tela do botão de Selecção de Esquema do XCode" src="https://i.ibb.co/5kVztvf/115759106-be497e80-a354-11eb-84df-41032abdad36.png" width="300">


<img alt="Captura de tela do botão de edição de Esquema do XCode" src="https://i.ibb.co/5kVztvf/115759106-be497e80-a354-11eb-84df-41032abdad36.png" width="300">


Feito isso, uma janela irá se abrir. Certifique-se que, na lateral esquerda, a opção "Build" está selecionada. Na parte de "Environment Variables", clique no botão "+" e, no campo de nome, coloque "API_KEY", e, no campo de valor, insira a sua chave da API TheMovieDB. Para obter sua chave, [clique aqui](https://developers.themoviedb.org/3/getting-started/introduction).

![Captura da tela de edição de Scheme do XCode](https://i.ibb.co/42swbwk/115758730-4ed38f00-a354-11eb-917e-3f3fe0f038b2.png)

Agora que a chave está configurada, basta executar a aplicação clicando no botão de Run:

<img alt="Captura de tela do botão do botão de Run do XCode" src="https://i.ibb.co/3BVRPnj/115758634-306d9380-a354-11eb-9969-3896dd07bb40.png" width="200">

E então a aplicação será executada na sua máquina.

### 🧾 Considerações

Desenvolver este projeto foi um desafio e tanto, pude aproveitar muito do conhecimento de logica que venho aprendendo e coisas simples como criação de interface com SWIFTUI.

Minha maior dificuldade tenho que dizer que foi relacionar Generos de filmes similares a suas respectivas ID's. Uma coisa que gostaria de ter feito, porem por falta de conhecimento é um efeito de Parallax no banner que quando feito scroll ele fica no fundo da listagem de filmes similares.

Devo comentar que não utilizei nenhum pacote no projeto pela falta de pratica com tais, pretendo agora com mais tempo ir conhecendo e quem sabe melhorando o código da aplicação.

Pretendo realizar updates, afim de evoluir e continuar praticando como sempre.

Agradeço a oportunidade de participar deste desafio! Quaisquer dúvidas, estou à disposição!

