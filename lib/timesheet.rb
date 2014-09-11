class Timesheet
  require 'rubygems'
  require 'axlsx'

  def initialize(project, user, hours)
    @project   = project
    @user      = user
    @hours     = hours
    @from_date = I18n.l @project.hours_spents.order(created_at: :asc).first.created_at, format: :datepicker 
    @to_date   = I18n.l @project.hours_spents.order(created_at: :asc).last.created_at,  format: :datepicker
    @logo_file =  'app/assets/images/Alliero-logo-500x81.png'

    @wday = {
      '1' => 'mandag',
      '2' => 'tirsdag', 
      '3' => 'onsdag',
      '4' => 'torsdag',
      '5' => 'fredag',
      '6' => 'lørdag',
      '7' => 'søndag',
    }
  end

  def create_spreadsheet
    Axlsx::Package.new do |p|
      p.workbook do |wb|

        # STYLES
        styles = wb.styles
        header = styles.add_style :sz => 18, :b => true
        gray_bg_bold_italic_font   = styles.add_style  :b => true, 
          :bg_color => "C0C0C0"
    
        bold_italic  = styles.add_style :b => true, :i => true 
        bold         = styles.add_style :b => true
        bold_center  = styles.add_style :b => true,
          :alignment => { :horizontal => :center }
        bold_pull_left = styles.add_style :b => true,
          :alignment => { :horizontal => :left }
        bold_pull_right = styles.add_style :b => true,
          :alignment => { :horizontal => :right }
        bold_gray_bg = styles.add_style :b => true, :bg_color => 'E2E2E2'
        border       = styles.add_style :border => { style: :medium, 
                                                     color: '000000' }
        bold_gray_bg_center = styles.add_style :b => true, 
          :bg_color => 'E2E2E2', :alignment => { :horizontal => :center }

        gray_bg_align_right = styles.add_style :alignment => { 
          :horizontal => :right }, :bg_color => "E2E2E2"
        attest_style= styles.add_style :alignment => { 
          :horizontal => :right }, :sz => 16
    
    
        # WORKSHEET
        wb.add_worksheet do |sheet|
    
          sheet.add_image(:image_src => @logo_file,
                          :noSelect => true, :noMove => true) do |image|
            image.width=345
            image.height=50
            image.start_at 10,0
          end
    
          # HEADER
          sheet.add_row [nil, nil, nil], :style => [bold, bold, bold, bold, bold, bold]
          %w(A1:B1).each { |range| sheet.merge_cells(range) }
          sheet.rows[0].cells[0].value = 'Alliero Gruppen'
          sheet.rows[0].cells[2].value = 'Gjerdrums vei 12 A, Postboks 4681 Nydalen, 0405 Oslo '

          sheet.add_row ['T I M E L I S T E'], :style => [header]
          %w(A2:N2).each { |range| sheet.merge_cells(range) }


# Linje 3 - Ansatt navn
          sheet.add_row [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            :style => [bold, bold, bold, bold, bold, bold, bold, 
                       bold, bold, bold, bold, bold, 
                       bold, bold, bold], 
                       height: 30

          # Ansatt navn
          %w(A3:E3).each { |range| sheet.merge_cells(range) }

          # Ansatt nr
          %w(F3:J3).each { |range| sheet.merge_cells(range) }

          # FRA DATO, TIL DATO
          %w(K3:O3).each { |range| sheet.merge_cells(range) }

          sheet.rows[2].cells[0].value = "ANSATT NAVN: #{@user.name}"
          sheet.rows[2].cells[5].value = "ANSATT NR: #{@user.emp_id}"
          sheet.rows[2].cells[10].value = "FRA DATO: #{@from_date}         TIL DATO: #{@to_date}"

# Linje 4 
          sheet.add_row [nil]

# Linje 5 
          sheet.add_row [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            style: [bold, bold, bold, bold, bold, bold, bold, bold, bold, bold, bold, bold]
          # Merge avd nr
          %w(A5:B5).each { |range| sheet.merge_cells(range) }
          # Prosjekt nr
          %w(C5:D5).each { |range| sheet.merge_cells(range) }
          # Prosjekt navn
          %w(E5:J5).each { |range| sheet.merge_cells(range) }
          # Prosjekt leder
          %w(K5:N5).each { |range| sheet.merge_cells(range) }

          sheet.rows[4].cells[0].value = "AVD. NR: #{@project.department.title}"
          sheet.rows[4].cells[2].value = "PROSJEKT NR: #{@project.project_number}"
          sheet.rows[4].cells[4].value = "PROSJEKT NAVN: #{@project.name}"
          sheet.rows[4].cells[10].value = "PROSJEKT LEDER: #{@project.user.name}"


# Linje 6 # Blank
          sheet.add_row [nil]

# Linje 7 # Header
          nil_header = []; 14.times { nil_header.push nil }
          sheet.add_row  nil_header, style: [nil, nil, nil, 
            bold, bold_center, bold_center, bold_center, bold,
            bold, bold, bold, bold, bold]
          # Arbeidene timer
          %w(D7:E7).each { |range| sheet.merge_cells(range) }
          # Overtid
          %w(F7:G7).each { |range| sheet.merge_cells(range) }
          # Reisepenger
          %w(H7:K7).each { |range| sheet.merge_cells(range) }
          # Fravær/Ferie, etc
          %w(M7:N7).each { |range| sheet.merge_cells(range) }

          sheet.rows[6].cells[3].value = 'Arbeidene timer'
          sheet.rows[6].cells[5].value = 'Overtid'
          sheet.rows[6].cells[7].value = '                Reisepenger'
          sheet.rows[6].cells[11].value = 'Bom'
          sheet.rows[6].cells[12].value = 'Fravær/Ferie/Hellidager etc.'

# Linje 8 # Subheader top
          sheet.add_row ['Dato', 'Dag', 'Merknader', 
          'Akkord', 'Ordinære', '50%', '100%', 
          'Gr 1', 'Gr 2', 'Gr 3', 'Gr 4', 
          'Bom-', 'Fraværs-', 'Fraværsgrunn'], 
            style: [
              bold_gray_bg_center, bold_gray_bg_center, bold_gray_bg_center, 
              bold_gray_bg, bold_gray_bg, bold_gray_bg_center,
              bold_gray_bg_center, bold_gray_bg_center, bold_gray_bg_center,
              bold_gray_bg_center, bold_gray_bg_center, bold_gray_bg, 
              bold_gray_bg, bold_gray_bg]

# Linje 9 # Subheader bottom
          sheet.add_row [nil, nil, nil, 'timer', 
          'timer', nil, nil, '7.5-15km', '15-30km', 
          '30-45km', '45-60km', 'penger', 'timer', nil], 
            style: [bold_gray_bg, bold_gray_bg, bold_gray_bg, bold_gray_bg, 
                    bold_gray_bg, bold_gray_bg, bold_gray_bg, bold_gray_bg, 
                    bold_gray_bg, bold_gray_bg, bold_gray_bg, bold_gray_bg, 
                    bold_gray_bg, bold_gray_bg, bold_gray_bg, bold_gray_bg, 
                    bold_gray_bg, bold_gray_bg, bold_gray_bg, bold_gray_bg]

# Line 10 # Hours for this user on this project
          @hours.each do |h|
            sheet.add_row  [h.date, @wday["#{h.date.wday}"], h.description, 
            h.piecework_hours, h.hour, h.overtime_50, h.overtime_100]
          end

# Sum
          sheet.add_row [nil]
          sheet.add_row [nil]
          sheet.add_row [nil]
          sheet.add_row [nil, nil, 'Sum',
            ExcelProjectTools.sum_piecework_hours(project: @project, user: @user), 
            ExcelProjectTools.sum_workhours(project: @project, user: @user), 
            ExcelProjectTools.sum_overtime_50(project: @project, user: @user), 
            ExcelProjectTools.sum_overtime_100(project: @project, user: @user), 
            nil, nil, nil, nil, nil, nil, nil],
            style: [nil, bold_gray_bg, bold_gray_bg,
            bold_gray_bg, bold_gray_bg,
            bold_gray_bg, bold_gray_bg,
            bold_gray_bg, bold_gray_bg,
            bold_gray_bg, bold_gray_bg, 
            bold_gray_bg, bold_gray_bg,
            ]

          sheet.column_widths 7,7,nil,nil,9,7,7,7,7,7,7,7,8,15
        end
      end
      prng = Random.new
      @nr = prng.rand(100)       # => 42
      p.use_shared_strings = true
      p.serialize "tmp/timeliste#{@nr}.xls"
    end
    "tmp/timeliste#{@nr}.xls"
  end

  private
  def offsett(nr)
    r = []
    nr.times do 
      r << ''
    end
    r
  end

  def last_row(sheet)
    sheet.rows.size
  end
end
