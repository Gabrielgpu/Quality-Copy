require 'quality_control.rb'

describe 'QualityControl' do
  it '1. Recebe um arquivo com o tom da pintura copiada e um arquivo com o tom original e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = ['Monahlizzo']

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['Monahlizzo:Cópia aceitável']
    )
  end

  it '2. Recebe um arquivo com os tons das pinturas copiadas e um arquivo com seus tons originais e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = ['O Nascimento de João Almeida', 'André em Cinza e Preto nº1']

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['O Nascimento de João Almeida:Cópia ruim','André em Cinza e Preto nº1:Cópia aceitável']
    )
  end

  it '3. Recebe um arquivo com os tons das pinturas copiadas e um arquivo com seus tons originais e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = ['O Massacre do Artpop', 'A Lição de Anatomia da Dra. Deolane', 'A Última Capelini']

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['O Massacre do Artpop:Cópia boa','A Lição de Anatomia da Dra. Deolane:Cópia ruim', 'A Última Capelini:Cópia excelente']
    )
  end

  it '4. Recebe um arquivo com os tons das pinturas copiadas e um arquivo com seus tons originais e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = ['A Persistência de Caroline']

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['A Persistência de Caroline:Cópia boa']
    )
  end

  it '5. Recebe um arquivo com os tons das pinturas copiadas e um arquivo com seus tons originais e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = ['O Casal Gagliasso', 'Portrait of Gabriel Monet']

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['O Casal Gagliasso:Cópia ruim', 'Portrait of Gabriel Monet:Cópia excelente']
    )
  end

  it '6. Recebe um arquivo com os tons das pinturas copiadas e um arquivo com seus tons originais e decide sobre a qualidade' do
    original_tones_files = 'original_tones.txt'
    copied_tones_files = 'copied_tones.txt'
    paintings = [
      'Miley Cruzando os Alpes', 'O Almoço de Tinashe', 'Abaporônica', 'O Jardim dos Otávios Terrestres', 'A Erika Odalisca'
    ]

    expect(QualityControl.new(original_tones_files, copied_tones_files, paintings).tone_checking).to eq(
      ['Miley Cruzando os Alpes:Cópia ruim', 'O Almoço de Tinashe:Cópia aceitável',
       'Abaporônica:Cópia excelente','O Jardim dos Otávios Terrestres:Cópia boa',
       'A Erika Odalisca:Cópia ruim']
    )
  end
end
