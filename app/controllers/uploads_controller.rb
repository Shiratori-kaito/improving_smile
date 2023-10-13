class UploadsController < ApplicationController
  def presigned_url
    s3 = Aws::S3::Resource.new
    obj = s3.bucket('smile-images').object(params[:filename])
    url = obj.presigned_url(:put, expires_in: 3600) # 1時間の有効期限

    render json: { url: url }
  end
end
