class CsvsController < ApplicationController
  def create
    csv = Csv.create name: params[:csv][:name], user: current_user
    keywords = CSV.read(params[:csv][:csv].path).flatten.compact.map(&:downcase)

    keywords.each do |keyword|
      Thread.new do
        search = GoogleSearch.new(q:keyword, serp_api_key:ENV["GOOGLE_API_KEY"])
        hash_results = search.get_hash

        csv.keywords.create name: keyword, total_search_results: hash_results[:search_information][:total_results],
                            time_taken: hash_results[:search_information][:time_taken_displayed],
                            html_code: hash_results[:search_metadata][:raw_html_file]
      end
    end
    redirect_to root_path
  end

  def show
    @csv=Csv.find params[:id]
  end
end
