"""Gunicorn Configuration

https://docs.gunicorn.org/en/latest/settings.html
"""

from jolpica_api.logging import LOG_CONFIG

wsgi_app = "jolpica_api.wsgi:application"

bind = "0.0.0.0:5000"

workers = 2

threads = 3

worker_class = "gthread"

access_log_format = "%({x-forwarded-for}i)s %(u)s %(r)s %(s)s %(b)s %(f)s '%(a)s'"

logconfig_dict = LOG_CONFIG
