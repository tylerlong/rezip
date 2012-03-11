require "zip/zip"

source_folder = "/root/source"
destination_folder = "/root/destination"

def all_zip_files(folder)
    Dir.glob("#{folder}/**/*.zip")
end


all_zip_files(source_folder).each do |file|
    puts file
    Zip::ZipFile.open(file) do |source_zip|
       source_zip.extract(destination_folder)
    end
end
