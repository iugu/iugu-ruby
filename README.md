# Iugu

Gem para acesso a API da Iugu

## Instalação

Adicione essa linha ao Gemfile de sua aplicação:

    gem 'iugu', github: 'Blumpa/iugu-ruby'
Depois execute:

    $ bundle install

## Exemplos de Uso

~~~
# Documentação para usar o marketplace
https://github.com/Blumpa/iugu-ruby/wiki/Marketplace

# Configure seu api key
Iugu.api_key = SEU_TOKEN_DE_API

# Exemplo de cobrança direta de CC em Ruby
Iugu::Charge.create(
      {
        "token"=> "TOKEN DO IUGU.JS ou LIB",
        "email"=>"endereço do email do cliente",
        "months"=>"quantidade de parcelas",
        "items" => 
        [
          {
            "description"=>"Item Teste",
            "quantity"=>"1",
            "price_cents"=>"1000"
          }
        ]
      }
)

# Exemplo de Gestão de Assinaturas em meia dúzia de linhas. Com direito a pagamento recorrente via Cartão ou Boleto. No caso de Cartão, recomenda-se vincular um token ao customer (Default Payment Method).
customer = Iugu::Customer.create({
      "email"=>"EMAIL DO CLIENTE",
      "name"=>"NOME DO CLIENTE"
})

subscription = Iugu::Subscription.create({
"plan_identifier" => "basic_plan", "customer_id" => customer.id
})

# Exemplo de Downgrade/Upgrade de Conta (Com cálculo automático de diferença de valores entre planos, créditos, etc)
subscription.change_plan( "novo_plano" );

# Histórico de Pagamentos do Cliente
customer.invoices
~~~
