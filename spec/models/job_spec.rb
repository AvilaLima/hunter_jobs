require 'rails_helper'

describe Job, type: :model do
  context '#cannot be blank' do
    it 'title cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:title]).to include('não pode ficar em branco')
    end

    it 'summary cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:summary]).to include('não pode ficar em branco')
    end

    it 'qualification cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:qualification]).to include('não pode ficar em branco')
    end

    it 'salary cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:salary]).to include('não pode ficar em branco')
    end

    it 'location cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:location]).to include('não pode ficar em branco')
    end

    it 'date_limit cannot be blank' do
      job = Job.new

      job.valid?

      expect(job.errors[:date_limit]).to include('não pode ficar em branco')
    end
  end

  context '#limit date validation' do
    it 'limit date cannot be equal today' do
      job = Job.new
      job.date_limit = Date.today
      job.valid?

      expect(job.errors[:date_limit]).to include('Não é uma data válida')
    end

    it 'limit date cannot be less than today'do
      job = Job.new
      job.date_limit = Date.yesterday
      job.valid?

      expect(job.errors[:date_limit]).to include('Não é uma data válida')
    end
  end
end
