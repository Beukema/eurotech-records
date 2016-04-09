class UploadsController < ApplicationController
  def new
  end

  def create
    # Make an object in your bucket for your upload
    obj = S3_BUCKET.objects[params[:file].original_filename]

    item = Item.find(params[:item][:id])
    repair_order = item.repair_order
    # Upload the file
    obj.write(
      file: params[:file],
      acl: :public_read
    )

    # Create an object for the upload
    @upload = Upload.new(
          url: obj.public_url,
          name: obj.key,
          item_id: item.id
        )

    # Save the upload
    if @upload.save
      redirect_to repair_order_path(repair_order), success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
    @uploads = Upload.all
  end

  def upload_text
    item = Item.find(params[:item][:id])
    repair_order = item.repair_order

    uploaded_file = TextUpload.new(filename: params[:file].original_filename, body: params[:file].read, item_id: item.id)

    if uploaded_file.save
      flash[:success] = "Successfully added text file to item"
    else
      flash.now[:notice] = "There was an error uploading the text file"
    end
    redirect_to repair_order_path(repair_order)
  end
end
