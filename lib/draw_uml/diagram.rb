require 'open3'

module DrawUml
  class Diagram
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(@path)
      @format_option ||= ''
      @file_format = DrawUml::Configure.image_format
    end

    def create(source_path, dest_path)
      raw = File.read(source_path)
      digest = Digest::MD5.hexdigest(raw)

      tmp_file = File.join(@path, dest_path + ".#{digest}.tmp")
      unless File.exist?(tmp_file)
        file_name = File.join(@path, dest_path + '.' + @file_format.to_s)
        FileUtils.mkdir_p(File.dirname(file_name))
        @format_option  = DrawUml::Default::FORMAT_OPTIONS[@file_format]
        cmd = 'plantuml ' + @format_option  + ' -pipe > ' + file_name
        stdout, status = Open3.capture2(cmd, stdin_data: raw)

        files = Dir[File.join(@path, dest_path + ".*.tmp")]
        File.unlink(*files)
        File.write(tmp_file, nil)
      end
    end
  end
end
