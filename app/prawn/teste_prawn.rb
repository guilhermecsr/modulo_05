class TestePrawn < Prawn::Document

  def initialize(adm)
    super()
    montar_pagina(adm)
  end

  def montar_pagina(adm)
    cabecalho
    info_adm(adm)
  end

  def cabecalho
    box(top_left, '100%', 65) do
      cabecalho_titulo
    end
  end

  def cabecalho_titulo
    bold_font(size: 18)
    text 'Time To Answer', align: :center
    regular_font(size: 12)
    text 'Sistema de Administração', align: :center
    text 'Relatório de Admins Registrados',
         align: :center
    horizontal_line(-2)
  end

  # def tabela_admins
  #
  # end

  def info_adm(adm)
    linha = []
    adm.each do |admin|
      linha << ["ID: #{admin.id}",
                "Email: #{admin.email}"]
    end
    table linha, :position => :center
  end

  # def info_adm(adm)
  #   adm.each do |admin|
  #     tabela = [
  #         ["ID: #{admin.id}",
  #          "Email: #{admin.email}"]
  #     ]
  #     table tabela, :position => :center
  #   end
  # end
end
