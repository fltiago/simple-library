class UsersController < ApplicationController
  # GET /users/:id
  def show
    # Carrega do BD o usuário a ser visualizado
    # - O identificador do usuário é acessado pelo params (contém os
    #   parâmetros da requisição).
    # - O usuário em questão é guardado na variável de instância @user
    #   para que seja acessível na view.
  	@user = User.find(params[:id])

    # Por convenção renderiza a view: show.html.erb
  end

  # GET /users
  def index
    # Carrega do BD todos os usuários da aplicação
    # - Os usuários são guardados na variável de instância @users
    #   para que seja acessível na view.
  	@users = User.all
    # Inicializa uma instância de User
    # - A nova instância é guardada na variável de instância @user
    #   para que seja utilizada no form de criação de um usuário (view).
    @user = User.new

    # Por convenção renderiza a view: index.html.erb
  end

  # POST /users
  def create
    # Cria e persiste no BD um usuário baseado nos parâmetros enviados
    # na requisição
    # - As informações para criação do usuário (nome, email, etc) são
    #   acessadas pelo params (contém os parâmetros da requisição).
    @user = User.create(params[:user])

    # Como a requisição é feita com JavaScript (Ajax), por convenção
    # renderiza a view: index.js.erb
  end
end
