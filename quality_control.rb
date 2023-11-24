require 'color_diff'


class QualityControl

  attr_accessor :original_tones_files, :copied_tones_files, :paintings

  def initialize(original_tones_files, copied_tones_files, paintings)
    @original_tones_files = original_tones_files
    @copied_tones_files = copied_tones_files
    @paintings = paintings

  end


  def tone_checking

    file_orig = File.open(@original_tones_files)

    file_cop = File.open(@copied_tones_files)

    list_quality = []
    list_original = []
    list_copied = []
    list_complet = []
    lista_name = []
    list_result = []

    list_diff = []


    nome = ''

    list_copied = data_manipulation(list_copied, file_cop)

    list_original = data_manipulation(list_original, file_orig)


    max_len = @paintings.size


    max_len.times do |i|
      list_quality = []
      lista_name = []

      list_original.each_with_index do |lista, indice|

        name = lista[0]


        if @paintings[i] == name

          lista_name << name

          lista[1].each_with_index do |numbers_orig, index|

            numbers_cop = list_copied[indice][1][index]

            result = calculate_diff(numbers_orig, numbers_cop)

            list_diff << result
          end
          
        end
        
        unless list_diff.empty?
          quality(list_diff, list_quality)

          copy_quality(list_quality, list_result, lista_name)
        end
        list_diff = []

      end

    end

     list_result
  end


  def quality(list_diff, list_quality)

    list_diff.each do |result|
      if result == 0
        list_quality << 'excelente'

      elsif result > 0 && result <= 5
        list_quality << 'boa'

      elsif result > 5 && result <= 20
        list_quality << 'aceitável'

      elsif result > 20
        list_quality << 'ruim'

      end

    end

  end


  def copy_quality(list_quality, list_result, lista_name)

    unless list_quality.empty?
      index = 0
      frequencia = list_quality.tally

      frequencia.each do |quality_key, value|
        if lista_name[index].nil?
          next
        end
        nome = lista_name[index] + ':Cópia' + ' ' + quality_key
        list_result << nome
        index += 1

      end

    end

  end



  def data_manipulation(list, file)
    data = file.readlines.map { |item| item.chomp.gsub('(', '').gsub(')', '').split(':') }

    data.each do |obra_arte, tons|
      tons = tons.gsub('//', ' ').split
      list << [obra_arte, tons]
    end

    list
  end



  def calculate_diff(numbers_orig, numbers_cop)
    list_size = numbers_orig.size

    x_orig, y_orig, z_orig = numbers_orig.gsub(',', ' ').split

    x_cop, y_cop, z_cop = numbers_cop.gsub(',', ' ').split


    orig = ColorDiff::Color::RGB.new x_orig.to_i, y_orig.to_i, z_orig.to_i
    cop = ColorDiff::Color::RGB.new x_cop.to_i, y_cop.to_i, z_cop.to_i

    result = ColorDiff.between cop, orig

    result
  end

end


