# frozen_string_literal: true

class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: %i[edit update destroy]

  def index
    @subjects = Subject.all.order(:description).page(params[:page]).per(12)
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      redirect_to admins_backoffice_subjects_path, notice: 'Assunto/Area Cadastrado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update(params_subject)
      redirect_to admins_backoffice_subjects_path, notice: 'Assunto/Area Atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if errors_transaction.present?
      redirect_to admins_backoffice_subjects_path, notice: 'Assunto/Area Excluido com sucesso!'
    else
      redirect_to admins_backoffice_subjects_path, alert: "Assunto nao excluido: #{@errors}"
    end
  end

  private

  def errors_transaction
    @errors = []
    ActiveRecord::Base.transaction do
      begin
        # binding.pry
        @destroyed = @subject.destroy
      rescue StandardError => e
        @errors << e.message
        raise ActiveRecord::Rollback
      end
      @destroyed
    end
  end

  def params_subject
    params.require(:subject).permit(:description)
  end

  def set_subject
    @subject = Subject.find(params[:id])
  end
end
