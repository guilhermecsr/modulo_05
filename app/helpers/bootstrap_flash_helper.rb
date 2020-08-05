module BootstrapFlashHelper
  # Gera e retorna os flashs vindos do controller para exibir na tela.
  def bootstrap_flash
    capture do
      flash.each do |type, messages|
        bootstrap_alerts_for_type(bootstrap_flash_type(type), messages)
      end
    end
  end

  # Gera alerts para cada mensagem de um dado tipo. Usa os métodos já definidos
  # em bootstrap_helper.rb.
  def bootstrap_alerts_for_type(type, messages)
    return if type.blank?

    Array(messages).each do |msg|
      concat(send("alerta_#{type}", true, '1') do
        simple_format(msg, {}, wrapper_tag: 'span')
      end)
    end
  end

  # "Traduz" o tipo do flash de Rails (:notice, :alert, :error) pro tipo
  # equivalente no Bootstrap (:success, :warning, :danger).
  def bootstrap_flash_type(type)
    { notice: :success, alert: :warning, error: :danger }[type.to_sym]
  end
end
