from django.db import models
from django.contrib.auth.models import User
from hashlib import md5

# Create your models here.

class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')

    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

    # def make_gravatar(self):
    #     if self.email:
    #         email = self.email
    #     else:
    #         email = 'user@greenorchard.com'
    #
    #     hash = md5(email.encode())
    #     digest = hash.hexdigest()
    #
    #     return 'http://www.gravatar.com/avatar/{}'.format(digest)
