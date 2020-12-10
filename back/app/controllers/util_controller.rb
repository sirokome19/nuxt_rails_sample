class UtilController < ApplicationController
  def upload
    upload_file = params[:file]
    ext=File.extname(upload_file.original_filename)

    filename=SecureRandom.uuid+ext

    s3_client.put_object(bucket: bucket, key: filename, body: upload_file.read, content_type:"image/png")
    render json: {image_url:"/#{bucket}/#{filename}"}
  end

  private
  def s3_client
    @s3_client ||= begin
      region = 'us-east-1'
      bucket = "image" # S3バケット名
      credentials=Aws::Credentials.new(access_key_id="hogehoge", secret_access_key="hogehoge")
      Aws::S3::Client.new(region: region, credentials:credentials, endpoint:"http://minio:9000", force_path_style: true)
    end
  end
  def bucket
    @bucket ||= "image"
  end
end