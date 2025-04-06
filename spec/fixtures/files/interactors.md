---
  markmap:
    initialExpandLevel: 6
    colorFreezeLevel: 2
---

# Interactors
## CreateUserInteractor
### CreateUser::SetContext
### CreateUser::Save
### CreateUser::SendWelcomeEmail
## SendEmailNotificationInteractor
### SendEmailNotification::SetContext
### SendEmailNotification::ValidateEmail
### SendEmailNotification::SendEmail
## SendNotificationInteractor
## SigninInteractor
### Signin::SetContext
### Signin::ValidateUser
### Signin::SendNotification
## SignupInteractor
### Signup::SetContext
### Signup::ValidateUser
### Signup::CreateUser
### SendEmailNotificationInteractor
#### SendEmailNotification::SetContext
#### SendEmailNotification::ValidateEmail
#### SendEmailNotification::SendEmail
### Signup::CreateSession
