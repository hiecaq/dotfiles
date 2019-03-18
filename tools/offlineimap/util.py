#!/usr/bin/env python2
# -*- coding: utf-8 -*-

from subprocess import check_output

def get_pass(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[0]

def get_username(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[1]

def get_client_id(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[2]

def get_client_secret(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[3]

def get_refresh_token(account):
    return check_output("pass Email/" + account, shell=True).splitlines()[4]

def local_name_trans(folder):
    return {'drafts':  '[Gmail]/Drafts',
            'sent':    '[Gmail]/Sent Mail',
            'flagged': '[Gmail]/Starred',
            'trash':   '[Gmail]/Trash',
            'archive': '[Gmail]/All Mail',
            }.get(folder, folder)
