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
    sha256  = 'c35f705df9e475305c0984b05991d444450809c35dd1d96106bb8e7128b9082f'
    api_key = '860b6021a2bcca379c8f0d2370f2b5be287d39cb0538b9e2b4b7e7815cbdc8ce'
    vtreport = VirustotalAPI::FileReport.find(sha256, api_key)
    @vtreport = vtreport.exists?
    @vtreport_url = vtreport.report_url
  end
end