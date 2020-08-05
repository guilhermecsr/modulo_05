module BootstrapHelper
  def alerta_success(dismissable = false, index = '0')
    bootstrap_div_alerta('success', 'check', 'Sucesso! ', dismissable,
                         index) { yield }
  end

  def alerta_info(dismissable = false, index = '0')
    bootstrap_div_alerta('primary', 'info-circle', 'Dica: ', dismissable,
                         index) { yield }
  end

  def alerta_warning(dismissable = false, index = '0')
    bootstrap_div_alerta('warning', 'exclamation-triangle', 'Atenção! ',
                         dismissable, index) { yield }
  end

  def alerta_danger(dismissable = false, index = '0')
    bootstrap_div_alerta('danger', 'close', 'Erro! ', dismissable,
                         index) { yield }
  end

  def bootstrap_close_button(data_dismiss = 'modal')
    span = content_tag('span', '&times;'.html_safe, aria: { hidden: true })
    button_tag(span, class: 'close', data: { dismiss: data_dismiss },
               aria: { label: 'Fechar Alerta' }, tabindex: '1')
  end

  # ============================================================================
  # Não usar os métodos abaixo diretamente nas views, eles são "private"
  # ============================================================================

  def bootstrap_div_alerta(css_class, icon, txt, dismissable = false, idx = '0')
    tag.div(class: "alert alert-#{css_class} col-12", role: 'alert') do
      span_conteudo = tag.span tabindex: idx do
        concat tag.strong { fa_icon icon, text: txt }
        concat capture { yield }
      end
      concat span_conteudo
      concat bootstrap_close_button('alert') if dismissable
    end
  end
end
