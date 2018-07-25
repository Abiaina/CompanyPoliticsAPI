class CompanyController < ApplicationController

# get request:
#http://localhost:3000/company_details/company name
# use '%20' for spaces


  def company_details
    company = Company.find_by(name: params[:company.upcase])

    if !company
      company = Subsidiary.find_by(name: params[:company].upcase)&.company

    end

    if company
      render json: {
        company_name: company.name,
        lobbying_dollars: get_USD(company.lobbying_dollars),
        contribution_dollars: get_USD(company.contribution_dollars),
        company_share_holders: company.share_holders,
        most_lobbied_bill: company.most_lobbied_bill.name,
        mlb_description: company.most_lobbied_bill.description,
        top_recipients: company.top_recipients,
        subsidiaries: company.subsidiaries,
        opensecretid: company.open_secret_id,
      },
      status: :ok
    else
      render json: { errors: "no company matches your description"},
        status: :not_found
    end
  end

  private
  def company_params
     params.require(:company).permit(:name, :id)
  end

  # only works for positive integers without decimals
  def get_USD (num_string)
    if num_string == nil || num_string.to_i == 0
      return num_string
    end

    num_string = num_string.to_s.split("")

    usd = ["$"]

    num_string.each_with_index do |num, index|
      if index == ((num_string.length) -1)
        usd << "#{num}.00"
      elsif index != 0 && index % 3 == 0
        usd << ",#{num}"
      else
        usd << num.to_s
      end
    end
    return usd.join("")
  end

end
