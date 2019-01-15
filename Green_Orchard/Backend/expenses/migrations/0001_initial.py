
# Generated by Django 2.1.5 on 2019-01-07 18:44


from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Banks',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('abbr', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(

            name='Expenses',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('amount', models.DecimalField(decimal_places=2, max_digits=7)),
                ('date_posted', models.DateTimeField(default=django.utils.timezone.now)),
                ('last_updated', models.DateTimeField(auto_now=True)),
                ('bank_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='expenses.Banks')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),

            ],
        ),
    ]