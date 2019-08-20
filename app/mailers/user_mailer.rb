class UserMailer < ApplicationMailer
	default from: 'no-reply@eventbrite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://eventbrite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def event_email(attendance)
        @admin = attendance.event.admin
        @participant = attendance.participant
        @event = attendance.event
        mail(to: @admin.email, subject: "Bonjour #{@admin.first_name}, #{@participant.first_name} a participé à votre évènement" )
  end
end