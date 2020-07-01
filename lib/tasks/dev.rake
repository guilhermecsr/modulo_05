namespace :dev do

  DEFAULT_PASSWORD = 123456
  DEFAULT_FILES_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco...") {%x(rails db:drop)}
      show_spinner("Criando banco...") {%x(rails db:create)}
      show_spinner("Migrando banco...") {%x(rails db:migrate)}
      show_spinner("Cadastrando o adm padrao...") {%x(rails dev:add_default_admin)}
      show_spinner("Cadastrando o adms extras...") {%x(rails dev:add_extra_admins)}
      show_spinner("Cadastrando o usuario padrao...") {%x(rails dev:add_default_user)}
      show_spinner("Cadastrando assuntos padrões...") {%x(rails dev:add_subjects)}
      show_spinner("Cadastrando perguntas e respostas...") {%x(rails dev:add_answers_and_questions)}
    else
      puts "Voce nao esta em embiente de desenvolvimento"
    end
  end

  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
        email: 'admin@admin.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
          email: Faker::Internet.email,
          password: DEFAULT_PASSWORD,
          password_confirmation: DEFAULT_PASSWORD
      )
    end
  end

  desc "Adiciona o usuário padrão"
  task add_default_user: :environment do
    User.create!(
        email: 'user@user.com',
        password: DEFAULT_PASSWORD,
        password_confirmation: DEFAULT_PASSWORD
    )
  end

  desc "Adiciona assuntos padrão"
  task add_subjects: :environment do
    file_name = 'subjects.txt'
    file_path = File.join(DEFAULT_FILES_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Subject.create!(description: line.strip)
    end
  end

  desc "Adiciona questões e respostas"
  task add_answers_and_questions: :environment do
    Subject.all.each do |subject|
      rand(5..10).times do |i|
        Question.create!(
            description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.question}",
            subject: subject
        )
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :dots_4)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")

  end
end
