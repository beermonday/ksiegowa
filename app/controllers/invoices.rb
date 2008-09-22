class Invoices < Application

  def index
    @invoices = Invoice.all
    display @invoices
  end

  def show
    @invoice = Invoice.get(params[:id])
    raise NotFound unless @invoice
    display @invoice
  end

  def new
    only_provides :html
    @invoice = Invoice.new
    render
  end

  def edit
    only_provides :html
    @invoice = Invoice.get(params[:id])
    raise NotFound unless @invoice
    render
  end

  def create
    @invoice = Invoice.new(params[:invoice])
    if @invoice.save
      redirect url(:invoice, @invoice)
    else
      render :new
    end
  end

  def update
    @invoice = Invoice.get(params[:id])
    raise NotFound unless @invoice
    if @invoice.update_attributes(params[:invoice]) || !@invoice.dirty?
      redirect url(:invoice, @invoice)
    else
      raise BadRequest
    end
  end

  def destroy
    @invoice = Invoice.get(params[:id])
    raise NotFound unless @invoice
    if @invoice.destroy
      redirect url(:invoice)
    else
      raise BadRequest
    end
  end

end