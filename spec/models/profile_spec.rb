require 'rails_helper'

describe Job, type: :model do
  context '#cannot be blank' do
    it 'name cannot be blank' do
      profile = Profile.new

      profile.valid?

      expect(profile.errors[:name]).to include('não pode ficar em branco')
    end

    it 'birth_date cannot be blank' do
      profile = Profile.new

      profile.valid?

      expect(profile.errors[:birth_date]).to include('não pode ficar em branco')
    end
  end

  context '#uniqueness' do
    it 'must be unique' do
      Profile.create!(name: 'John Doe Doe',social_name:'Doe John',
        birth_date: '28/02/1990',
        formation:'Análise e Desenvolvimento de Sistemas', 
        summary: 'O resumo é SIM',experience: 'A minha experiência é...',
        favorite: 0)
      profile =  Profile.new(name: 'John Doe Doe',social_name:'Doe John',
        birth_date: '28/02/1990',
        formation:'Análise e Desenvolvimento de Sistemas', 
        summary: 'O resumo é SIM',experience: 'A minha experiência é...',
        favorite: 0)
      profile.valid?
      expect(profile.errors[:name]).to include('já está em uso')
    end 
  end
end
