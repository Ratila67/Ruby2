class WeightEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weight_entry, only: [:show, :edit, :update, :destroy]

  def index
    @weight_entries = current_user.weight_entries.order(date: :desc)
  end

  def new
    @weight_entry = current_user.weight_entries.new(date: Date.current)
  end

  def create
    @weight_entry = current_user.weight_entries.new(weight_entry_params)
    if @weight_entry.save
      redirect_to weight_entries_path, notice: 'Votre suivi de poids a été ajouté avec succes.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @weight_entry.update(weight_entry_params)
      redirect_to weight_entries_path, notice: 'votre suivi a été mis a jour'
    else
      render :edit
    end
  end

  def destroy
    @weight_entry.destroy
    redirect_to weight_entries_path, notice: 'votre suivi a été supprimé'
  end

  private
  def set_weight_entry
    @weight_entry = current_user.weight_entries.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to weight_entries_path, alert: 'Entrée introuvable'
  end

    def weight_entry_params
      params.require(:weight_entry).permit(:date, :weight, :steps)
    end
end
