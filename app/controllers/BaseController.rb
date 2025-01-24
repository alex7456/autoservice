class BaseController < ApplicationController
  before_action :set_base, only: %i[edit update destroy]

  def index
    @bases = base_class.order(:id) # Сортировка по ID (или любому другому полю)
    instance_variable_set("@#{controller_name}", @bases)
  end



  def new
    @base = base_class.new
    instance_variable_set("@#{controller_name.singularize}", @base)
  end

  def edit
    instance_variable_set("@#{controller_name.singularize}", @base)
  end

  def create
    @base = base_class.new(base_params)
    instance_variable_set("@#{controller_name.singularize}", @base)

    respond_to do |format|
      if @base.save
        format.html { redirect_to send("#{controller_name}_path"), notice: "#{base_class.name} успешно создан." }
        format.json { render :index, status: :created, location: send("#{controller_name}_path") }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @base.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @base.update(base_params)
        format.html { redirect_to send("#{controller_name}_path"), notice: "#{base_class.name} успешно обновлен." }
        format.json { render :index, status: :ok, location: send("#{controller_name}_path") }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @base.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @base.destroy!

    respond_to do |format|
      format.html { redirect_to send("#{controller_name}_path"), status: :see_other, notice: "#{base_class.name} успешно удален." }
      format.json { head :no_content }
    end
  end

  private

  def set_base
    @base = base_class.find(params[:id])
    instance_variable_set("@#{controller_name.singularize}", @base)
  end

  def base_class
    controller_name.classify.constantize
  end

  def base_params
    raise NotImplementedError, "base_params должен быть переопределен в #{self.class.name}"
  end
end
