class Sms
  def self.send_msg(to, msg)
    url = "http://bulksms.vsms.net:5567/eapi/submission/send_sms/2/2.0?" + 
      "username=#{ENV['BULKSMS_USERNAME']}&password=#{ENV['BULKSMS_PASSWORD']}&sender=Orwapp"+
      "&allow_concat_text_sms=1&concat_text_sms_max_parts=8&want_report=8&message=#{encode(msg)}&msisdn=#{to}"
    resp = Net::HTTP.get(URI.parse(url))
    puts resp
  end


  def self.encode(text)
    iso_str = Iconv.new('iso-8859-1', 'utf-8').iconv(text)
    CGI.escape(iso_str)
  end

end
