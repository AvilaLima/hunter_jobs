require 'rails_helper'

describe ApplyJob, type: :model do
  context '#cannot be blank' do
    it 'cover_letter' do
        
      apply_job = ApplyJob.new

      apply_job.valid?

      expect(apply_job.errors[:cover_letter]).to include('não pode ficar em branco')
    end
  end
end
