require 'json'
json_data = JSON.parse(File.read('db/seed_data.json'))

Company.destroy_all
ShareHolder.destroy_all
MostLobbiedBill.destroy_all
TopRecipient.destroy_all
Subsidiary.destroy_all
  puts "    Removed all previsious records"


json_data.each do |json|
  name = json["name"]
  lobbying_dollars = json["total_lobby_dollars"]
  contribution_dollars = json["total_contribution_dollars"]
  most_lobbied_bill = json["most_lobbied_bill"]
  share_holders = json["share_holder_politicians"]
  top_recipients = json["recipients"]
  open_secret_id = json["os_id"]
  subsidiaries = json["subsidiaries"]
  mlb_description = json["mlb_description"]

  bill = MostLobbiedBill.find_by name: most_lobbied_bill
  if !bill
    bill = MostLobbiedBill.create!({ :name => most_lobbied_bill, :description => mlb_description})
    puts "    new bill #{bill.name}"

  end

  company = Company.create!({
    :name => name.upcase,
    :lobbying_dollars => lobbying_dollars,
    :contribution_dollars => contribution_dollars,
    :open_secret_id => open_secret_id,
    :most_lobbied_bill_id => bill.id,
    })
  puts "Created company #{company.name}"

  # use find_or_create_by
  share_holders.each do |s_holder|
    politician = ShareHolder.find_by name: s_holder
    if !politician
      politician = ShareHolder.create({ :name => s_holder })
      puts "  Created politician #{politician.name}"
    end
    company.share_holders << politician
    puts "    new politician associations #{company.name} : #{politician.name}"

  end

  top_recipients.each do |t_recipient|
    taker = TopRecipient.find_by name: t_recipient
    if !taker
      taker = TopRecipient.create({ :name => t_recipient })
      puts "  Created TopRecipient #{TopRecipient.name}"
    end
    company.top_recipients << taker
    puts "    new company associations #{company.name} : #{taker.name}"
  end

  subsidiaries.each do |subsidiary|
    sub = Subsidiary.find_by name: subsidiary
    if !sub
      sub = Subsidiary.create({ :name => subsidiary.upcase })
      puts "  Created subsidiary #{sub.name}"
    else
      puts "WARNING: duplicate subsidiary #{sub.name} for #{sub.company.name} and #{company.name}"
    end
    company.subsidiaries << sub
    puts "    new company associations #{company.name} : #{sub.name}"

  end

  company.save!
  puts "    saved seed file"
end
