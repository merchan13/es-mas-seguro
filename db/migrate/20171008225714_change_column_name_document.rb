class ChangeColumnNameDocument < ActiveRecord::Migration[5.0]
  def change
  	rename_column :insurance_requests, :cir_document, :document
  end
end
