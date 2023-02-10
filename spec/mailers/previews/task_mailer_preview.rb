# Preview all emails at http://localhost:3000/rails/mailers/task_mailer
class TaskMailerPreview < ActionMailer::Preview

  def creation_email
    task = Task.first
    TaskMailer.creation_email task
  end

end
