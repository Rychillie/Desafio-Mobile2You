# Desafio Mobile2You

Utilizando a [API do The Movie DB](https://developers.themoviedb.org/3/getting-started/introduction), você deverá implementar uma tela com as informações de algum filme da sua escolha. Não é necessário mais do que esta tela principal.

## Layout

Você deve replicar o layout da [tela de detalhe dos filmes](https://is4-ssl.mzstatic.com/image/thumb/Purple114/v4/97/0e/e2/970ee217-13cf-1674-b016-461aca657663/pr_source.png/460x0w.png) do app [TodoMovies4](https://apps.apple.com/br/app/todomovies-4/id792499896).
Se você reparar, a imagem do filme possui um efeito. Não é obrigatório implementar este efeito, mas se for feito nós ficaremos felizes :)

## Requisitos

- Usar algum design pattern: MVP, MVVM, MVVM-C, VIPER.
- As informações do filme devem vir do endpoint [getMovieDetails](https://developers.themoviedb.org/3/movies/get-movie-details).
- Usaro ``vote_count`` que retorna da API para representar o número de __likes__.
- Substituir o “3 of 10 watched” por “​``<popularity>`` views”, utilizando o valor retornado da API e
mantendo algum ícone ao lado.
- O ícone de like (coração) deve mudar quando clicado, alternando entre preenchido e vazio.
- Deve haver uma lista de filmes abaixo dos detalhes.
- O app deve ser desenvolvido utilizando a linguagem Swift.
- O projeto deve ser disponibilizado em um repositório __aberto__ no GitHub. Envie a URL assim que possível.

## Dicas

- Você pode usar Alamofire para facilitar a sua vida (é apenas uma dica, não é obrigatório).
- A lista de filmes abaixo do detalhe do filme pode ser o retorno da [getSimilarMovies](https://developers.themoviedb.org/3/movies/get-similar-movies).
- Gostamos de Rx.
- Testes são sempre bem-vindos.
- Vamos olhar tudo, inclusive commits, branches, organização de pastas, etc.
- Um código limpo e organizado pode ser mais importante do que o app todo pronto.
- Vamos ler o seu README, caso você queira deixar alguma mensagem para nós.

Qualquer dúvida, técnica ou não, você pode entrar em contato respondendo o e-mail que você recebeu.

### Boa sorte! :)
