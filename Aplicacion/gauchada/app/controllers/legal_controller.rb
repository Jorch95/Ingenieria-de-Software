class LegalController < ApplicationController
  def terms
  	@pagActual = request.url
  	@pagPrivacy = legal_privacy_path
    @pagServicio = request.base_url
  end

  def privacy
    @pagServicio = request.base_url
  end
end
