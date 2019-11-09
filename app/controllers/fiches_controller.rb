class FichesController < ApplicationController

  def index
    @fiches = policy_scope(Fiche).where(status: 'published')
    @pagy, @fiches = pagy(
      helpers.index_search(@fiches, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )

    if params[:query] || params[:filter]
      respond_to do |format|
        format.html { redirect_to fiches_path }
        format.js
      end
    end
  end
end
