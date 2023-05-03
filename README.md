# raro-food

Projeto prático para aulas dos fundamentos de modelagem de banco de dados.

## setup

Antes de iniciar a aplicação, recomenda-se a execução da seguinte sequência de comandos:

```bash
rvm use 3.1.2
cd klaus-lube-exercicio-semana-8
bundle install
rails db:create
rails db:migrate
rails db:seed
```

Para iniciar o servidor, recomenda-se a utilização do comando `./bin/dev`, pois ele garante os assets serão todos devidamente processados.

#### Alguns comandos utilizados para nossa aplicação:

Verificar versão do ruby utilizada:

```bash
rvm use 3.1.2
```

Verificar versão do Yarn

```bash
yarn -v
```

Criando uma nova aplicação rails:

```bash
rails new raro_food -c=tailwind -d=mysql -j=esbuild
```

```bash
cd raro_food
bin/rails db:create db:migrate db:seed
```

### Adicionando Unit Test

Adicione o seguinte trecho no `Gemfile`:

```ruby
group :development, :test do
  # ....
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'faker'
end
```

Execute os seguintes comandos:

```bash
bin/rails generate rspec:install
bin/rails db:migrate db:test:prepare
bin/rails generate rspec:model State
```

No arquivo gerado `rails_helper.rb`

```ruby
#...
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

### Adicionando Rubocop

No arquivo `Gemfile`:

```ruby
gem 'rubocop-rails', require: false

group :development do
  # ...
  gem 'rubocop-rails', require: false
end
```

Na raiz do projeto crie um arquivo `.rubocop.yml` com o seguinte conteúdo:

```yaml
require: rubocop-rails

AllCops:
  NewCops: enable
  TargetRubyVersion: 3.1.2
```

Ao executar o comando abaixo no terminal, serão listados os erros encontrados:

```bash
rubocop
```

Para corrigí-los, pode ser executado o comando:

```bash
rubocop -A
```

# Implementação
Na aplicação foi adicionado 4 entidades novas:


1- Card
  - customerId (FK) INT NOT NULL
  - name STRING NOT NULL
  - card number STRING NOT NULL
  - CVV Code STRING NOT NULL
  - card type INT NOT NULL
  - expiration date STRING NOT NULL

2- Payment
  - cardId (FK) INT NOT NULL
  - payment method INT NOT NULL
  - paid amount DECIMAL NOT NULL
  - status INT NOT NULL

3- Coupon
  - administratorId (FK) INT NOT NULL
  - code STRING NOT NULL
  - name STRING NOT NULL
  - description TEXT NOT NULL
  - start date DATE NOT NULL
  - end date DATE NOT NULL
  - discount amount DECIMAL NOT NULL


4- CustomerOrder
  - customerId (PK) INT NOT NULL
  - orderId (PK) INT NOT NULL
  - couponId (FK) INT NOT NULL
  - paymentId (FK) INT NOT NULL


<hr>


## Relacionamentos entre tabelas



- Relacionamento 1:1
  - Pagamento <b>UTILIZA</b> Cupom
  - ClientePedido <b>EXIGE</b> Pagamento (join table)


- Relacionamento 1:N
  - Cliente <b>CADASTRA</b> Cartão
  - Administrador <b>CADASTRA</b> Cupom
  - Cliente <b>REALIZA</b> Pedido
  - ClientePedido <b>UTILIZA</b> Cupom

<hr>


## Problemas econtrados 
No projeto, ao ser clonado foi preciso mudar o socket e o password no arquivo database.yml, só assim a aplicação consegue rodar rails db:create.

Mas decidi não subir o arquivo database.yml e nem schema como foi informado em aula. Deixando o setup igual ao clonado inicialmente.

<hr>


## Desafios 

Nesse projeto, tive como maior desafio a interpretação do diagrama de entidade-relacionamento e codificar corretamente as relações entre entidades, principalmente a Join table, a qual tive dúvida se devia criar um model para ela ou não. 


<hr>


## AUTOR
Este projeto foi desenvolvido por Klaus Lube, como parte do exercício semanal da Raro Academy(Professor Guilherme Andrade) para aprimorar as habilidades em Active Record, models, migrations e rails.