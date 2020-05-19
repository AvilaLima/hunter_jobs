# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
candidate = User.create(email:'pedro@gmail.com',password:'123456', role:0)
headhunter = User.create(email:'lima@gmail.com',password:'123456', role:5)
a_candidate = User.create(email:'another@gmail.com',password:'123456', role:0)

trainee= LevelJob.create([{ level: 'Estagiário' }, { level: 'Junior' },
                          { level: 'Trainee' }, { level: 'Pleno' }, 
                          { level: 'Sênior' }, { level: 'Diretor' }])

job_headhunter=Job.create(title: 'Título da vaga', summary: 'Resumo da vaga', 
          qualification: 'Habilidades da vaga', salary: 'Até R$4000', 
          date_limit: '25/07/2020', location: 'São Paulo', 
          level_job: LevelJob.find(3), email:headhunter.email, status:0)

job2_headhunter=Job.create(title: 'Título da 2º vaga',
          summary: 'Resumo 2º da vaga', 
          qualification: 'Habilidades da vaga', salary: 'Até R$8000', 
          date_limit: '25/07/2020', location: 'São Paulo', 
          level_job: LevelJob.find(4), email:headhunter.email, status:0)

jobclose_headhunter=Job.create(title: 'Vaga encerrada', 
          summary: 'Resumo 2º da vaga', 
          qualification: 'Habilidades da vaga', salary: 'Até R$8000', 
          date_limit: '25/07/2020', location: 'São Paulo', 
          level_job: LevelJob.find(4), email:headhunter.email, status:5)

profile_candidate = Profile.create(name: 'John Doe Doe',   
                    social_name:'Doe John',
                    birth_date: '28/02/1990',
                    formation:'Análise e Desenvolvimento de Sistemas', 
                    summary: 'O resumo é SIM',
                    experience: 'A minha experiência é...',
                    favorite: 0,
                    email: candidate.email)


profile_a_candidate = Profile.create(name: 'Another John',   
                    social_name:'A John',
                    birth_date: '28/02/1990',
                    formation:'Análise e Desenvolvimento de Sistemas', 
                    summary: 'O resumo é SIM',
                    experience: 'A minha experiência é...',
                    favorite: 0,
                    email: a_candidate.email)

apply_job= ApplyJob.create(job: job_headhunter, profile:profile_candidate,
                            cover_letter:'Carta de apresentação',
                            feedback_headhunter: 'Feedback do hunter')
                
ApplyJob.create(job: job_headhunter, profile:profile_a_candidate,
  cover_letter:'Carta de apresentação',
  feedback_headhunter: 'Feedback do hunter')