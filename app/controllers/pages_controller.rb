class PagesController < ApplicationController
  
  def home
    
  end
  
  def about
    
  end
  
  def ir_dashboard
    
  end

  def cyberchef
    @file = render_to_string :file => 'cyberchef.htm'
  end

  def virustotal
    sha256  = '01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b'
    api_key = '860b6021a2bcca379c8f0d2370f2b5be287d39cb0538b9e2b4b7e7815cbdc8ce'
    vtreport = VirustotalAPI::FileReport.find(sha256, api_key)
    @vtreport = vtreport.exists?
    @vtreport_url = vtreport.report_url
  end
end