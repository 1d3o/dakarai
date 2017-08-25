class Lato::CrudController < Lato::ApplicationController

  before_action do
    core__set_menu_active_item('crud')
  end

  def index
    core__set_header_active_page_title('Index')
    @datas = Data.all
    @widget_index_datas = core__widgets_index(
      @datas,
      search: 'search_key',
      pagination: 10
    )
  end

  def show
    core__set_header_active_page_title('Show')
    @data = Data.find_by(id: params[:id])
    return unless check_data_presence
  end

  def new
    core__set_header_active_page_title('New')
    @data = Data.new
  end

  def create
    @data = Data.new(data_params)

    unless @data.save
      flash[:danger] = @data.errors.full_messages.to_sentence
      redirect_to new_lato_data_path
      return
    end

    flash[:success] = 'Data created succesfully'
    redirect_to lato_data_path(@data.id)
  end

  def edit
    core__set_header_active_page_title('Edit')
    @data = Data.find_by(id: params[:id])
    return unless check_data_presence
  end

  def update
    @data = Data.find_by(id: params[:id])
    return unless check_data_presence

    unless @data.update(data_params)
      flash[:danger] = @data.errors.full_messages.to_sentence
      redirect_to edit_lato_data_path(@data.id)
      return
    end

    flash[:success] = 'Data updated succesfully'
    redirect_to lato_data_path(@data.id)
  end

  def destroy
    @data = Data.find_by(id: params[:id])
    return unless check_data_presence

    unless @data.destroy
      flash[:danger] = @data.errors.full_messages.to_sentence
      redirect_to lato_data_path(@data.id)
      return
    end

    flash[:success] = 'Data destroyed succesfully'
    redirect_to lato_datas_path
  end

  private

  def data_params
    params.require(:data).permit(:name)
  end

  def check_data_presence
    return true if @data
    redirect_to lato_datas_path
    false
  end

end
