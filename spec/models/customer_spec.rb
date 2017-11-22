require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#full_name - sobreescrevendo atributo' do
  	customer = create(:customer , name: "Mario Augusto")
  	expect(customer.full_name).to eq('Sr. Mario Augusto')
  end

  it '#herança' do
  	customer = create(:customer_vip)
  	expect(customer.vip).to eq(true)
  end

  it 'Usando attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
  end

  it 'Atributo Transitório' do 
    customer = create(:customer_default , upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Masculino VIP' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Feminino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it '#full_name' do
  	customer = create(:user)
  	expect(customer.full_name).to start_with('Sr. ')
  end

  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1) }
end
