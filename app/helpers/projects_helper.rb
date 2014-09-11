module ProjectsHelper


  def project_number(p)
    p.project_number.present? ? p.project_number : "Prosjekt ##{p.id}"
  end

end
