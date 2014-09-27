json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :company, :date, :tax, :salesperson
  json.url invoice_url(invoice, format: :json)
end
