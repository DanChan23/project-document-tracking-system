class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # GET /documents
  # GET /documents.json
  def index
    #@documents = Document.all.paginate(:page => params[:page], :per_page => 5)
    dept_id = User.where("id = ?", session[:user_id]).pluck(:department_id).first
    @documents = if params[:subject]
      Document.where('subject LIKE ? AND user_id = ?', "%#{params[:subject]}%", session[:user_id]).or(Document.where('subject LIKE ? AND department_id = ?',"%#{params[:subject]}%", dept_id)).order('id DESC').paginate(:page => params[:page], :per_page => 5)
    else
      Document.where('user_id = ?', session[:user_id]).or(Document.where('department_id = ?', dept_id)).order('id DESC').paginate(:page => params[:page], :per_page => 5)
    end

    if User.where("id = ?", session[:user_id]).pluck(:role_id).first == 1
      @documents = if params[:subject]
        Document.where('subject LIKE ?', "%#{params[:subject]}%").order('id DESC').paginate(:page => params[:page], :per_page => 5)
      else
        Document.all.order('id DESC').paginate(:page => params[:page], :per_page => 5)
      end
    end


    #@document_histories = DocumentHistory.all.paginate(:page => params[:page], :per_page => 5)
    @document_histories = if params[:get_doc_history_subj]
      tmp = DocumentHistory.group("document_id").order('id DESC')
      tmp2 = DocumentHistory.from("(#{tmp.to_sql}) as document_histories").select("document_histories.*").where("document_histories.received_by_office = ? AND document_histories.remarks = ?", dept_id, "Pending").paginate(:page => params[:page], :per_page => 5)
      tmp2.where('subject LIKE ?', "%#{params[:get_doc_history_subj]}%")
    else
      tmp = DocumentHistory.group("document_id").order('id DESC')
      DocumentHistory.from("(#{tmp.to_sql}) as document_histories").select("document_histories.*").where("document_histories.received_by_office = ? AND document_histories.remarks = ?", dept_id, "Pending").paginate(:page => params[:page], :per_page => 5) 
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        puts "id is: " + @document.id.to_s
        puts "received_from_name is: " + @document.user_id.to_s
        puts "received_from_office is: " + @document.department_id.to_s
        DocumentHistory.create(:document_id => @document.id, :received_by_name => @document.user_id, :received_by_office => @document.department_id, :received_from_name => @document.user_id, :received_from_office => @document.department_id, :subject => @document.subject, :remarks => @document.status)
        format.html { redirect_to "http://localhost:3000/documents", notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to "http://localhost:3000/documents", notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:subject, :status, :date_created, :time_created, :user_id, :department_id, :get_doc_history_subj)
    end
end
