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
    text("TESTE")
  end

  def info_adm(adm)
    adm.each do |admin|
      text "#{admin.id}"
      text admin.email
    end
  end
end
