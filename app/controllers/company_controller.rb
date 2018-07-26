class CompanyController < ApplicationController
  include HTTParty
  include JSON

# get request:
#http://localhost:3000/company_details/company name
# use '%20' for spaces
  def company_details
    upc_data = process_upc()
    if upc_data
      company_name = upc_data[0]
      product_img_url = upc_data[1]

      company = Company.fuzzy_search(company_name)
    else
      company = nil
    end

    if company == []
      company = Subsidiary.fuzzy_search(company)
      company == [] ? company = nil : company = company[0].company
    else
      company = company[0]
    end

    if company
      render json: {
        company_name: company.name,
        lobbying_dollars: Money.new(company.lobbying_dollars*100, "USD").format,
        contribution_dollars: Money.new(company.contribution_dollars*100, "USD").format,
        company_share_holders: company.share_holders,
        most_lobbied_bill: company.most_lobbied_bill.name,
        mlb_description: company.most_lobbied_bill.description,
        top_recipients: company.top_recipients,
        subsidiaries: company.subsidiaries,
        opensecretid: company.open_secret_id,
        product_url: product_img_url
      },
      status: :ok
    else
      render json: { errors: "no company matches your description"},
        status: :not_found
    end
  end

  private

  def company_params
     params.require(:upc).permit(:upc)
  end

  def process_upc
    base = "https://eandata.com/feed/?v=3&keycode="

    response = HTTParty.get(base + ENV["UPC_API_KEY"] + "&mode=json&find=" + params[:upc])
    if response["company"]["name"]
      data = [
        response["company"]["name"], response["product"]["image"]
      ]
      return data
    end
    return nil
  end

end
