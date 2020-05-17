# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
candidate = User.create(email:'pedro@gmail.com',password:'123456', role:0)
headhunter = User.create(email:'lima@gmail.com',password:'123456', role:5)

trainee= LevelJob.create([{ level: 'Estagiário' }, { level: 'Junior' },
                          { level: 'Trainee' }, { level: 'Pleno' }, 
                          { level: 'Sênior' }, { level: 'Diretor' }])

job_headhunter=Job.create(title: 'Título da vaga', summary: 'Resumo da vaga', 
          qualification: 'Habilidades da vaga', salary: 'Até R$4000', 
          date_limit: '25/07/2020', location: 'São Paulo', 
          level_job: trainee[2], email:headhunter.email)

profile_candidate = Profile.new(name: 'John Doe Doe',   
                    social_name:'Doe John',
                    birth_date: '28/02/1990',
                    formation:'Análise e Desenvolvimento de Sistemas', 
                    summary: 'O resumo é SIM',
                    experience: 'A minha experiência é...',
                    favorite: 0,
                    email: candidate.email)