class AddHirColumns < ActiveRecord::Migration[5.0]
  def change
  	add_column :insurance_requests, :cir_document, :string
  	add_column :insurance_requests, :hir_type, :string
  	add_column :insurance_requests, :hir_cover, :string
  	add_column :insurance_requests, :hir_dependents, :string
  end
end
