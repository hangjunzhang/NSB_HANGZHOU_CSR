# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class Answer(models.Model):
    postid = models.IntegerField(blank=True, null=True)
    answerid = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    imgs = models.TextField(blank=True, null=True)
    createtime = models.IntegerField(blank=True, null=True)
    authorid = models.IntegerField(blank=True, null=True)
    active = models.IntegerField(default=1)
    up = models.IntegerField(default=0)
    floor = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'answer'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Block(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True)
    active = models.IntegerField()
    description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'block'


class Confirm(models.Model):
    openid = models.CharField(max_length=128, blank=True, null=True)
    email = models.CharField(max_length=128, blank=True, null=True)
    createtime = models.IntegerField(blank=True, null=True)
    active = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'confirm'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Event(models.Model):
    authorid = models.IntegerField(blank=True, null=True)
    target = models.IntegerField(blank=True, null=True)
    action = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'event'


class Post(models.Model):
    subject = models.CharField(max_length=512, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    authorid = models.IntegerField(blank=True, null=True)
    createtime = models.IntegerField(blank=True, null=True)
    edittime = models.IntegerField(blank=True, null=True)
    blockid = models.IntegerField(blank=True, null=True)
    topicid = models.IntegerField(blank=True, null=True)
    hot = models.IntegerField(default=0)
    resnum = models.IntegerField(default=0)
    top = models.IntegerField(default=0)
    updatetime = models.IntegerField(blank=True, null=True)
    up = models.IntegerField(default=0)
    hours = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'post'


class Token(models.Model):
    token = models.CharField(max_length=256, blank=True, null=True)
    expires = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=8, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'token'


class Topic(models.Model):
    name = models.CharField(max_length=64, blank=True, null=True)
    blockid = models.IntegerField(blank=True, null=True)
    active = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'topic'


class Wechatuser(models.Model):
    openid = models.CharField(max_length=256, blank=True, null=True)
    nickname = models.CharField(max_length=256, blank=True, null=True)
    headimg = models.CharField(max_length=256, blank=True, null=True)
    email = models.CharField(max_length=128, blank=True, null=True)
    nsnid = models.IntegerField(blank=True, null=True)
    sex = models.IntegerField(blank=True, null=True)
    jointime = models.IntegerField(blank=True, null=True)
    logintime = models.IntegerField(blank=True, null=True)
    active = models.IntegerField(default=1)
    userid = models.CharField(max_length=256, blank=True, null=True)
    qrcode = models.CharField(max_length=256, blank=True, null=True)
    mobile = models.CharField(max_length=128, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'wechatuser'
