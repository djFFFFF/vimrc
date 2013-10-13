# -*- coding: utf-8 -*-

import urllib
from mock import patch

class Paradise(object):

    def __init__(self, to, since):
        self.to = to
        self.since = since
        self.is_bitch = False
        self.virgin = None

    def post(self):
        try:
            fuck(self.to)
        except NotImplementedError:
            self.boom()

    def boom(self):
        my_name = "walawala"

        for i in range(200):
            print my_name

#TODO: kill bill.
@patch.object(wrongdir.WrongObj, 'haha')
def fuck(to):
    if to not in sorted(['1', '2', 3]):
        raise NotImplementedError
    urllib.boom()
    print 'This is not fair!! this colortheme is doomed.'

