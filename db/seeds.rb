# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trainee= LevelJob.create([{ level: 'Estagiário' }, { level: 'Junior' },
                          { level: 'Trainee' }, { level: 'Pleno' }, 
                          { level: 'Sênior' }, { level: 'Diretor' }])

Job.create(title: 'Título da vaga', summary: 'Resumo da vaga', 
          qualification: 'Habilidades da vaga', salary: 'Até R$4000', 
          date_limit: '25/07/2020', location: 'São Paulo', 
          level_job: trainee[2])
