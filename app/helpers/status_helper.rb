module StatusHelper
  def status_name(status)
    case status
    when 'in_process'
      'U toku'
    when 'rejected'
      'Odbijena'
    when 'accepted'
      'Prihvaćena'
    when 'on_hold'
      'Na čekanju'
    end
  end

  def status_color(status)
    case status
    when 'in_process'
      'yellow'
    when 'rejected'
      'red'
    when 'accepted'
      'green'
    when 'on_hold'
      'orange'
    end
  end
end