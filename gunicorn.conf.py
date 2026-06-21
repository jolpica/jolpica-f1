"""Gunicorn Configuration

https://docs.gunicorn.org/en/latest/settings.html
"""

from jolpica_api.logging import LOG_CONFIG

wsgi_app = "jolpica_api.wsgi:application"

bind = "0.0.0.0:5000"

workers = 4

threads = 5

worker_class = "gthread"

access_log_format = (
    "%({x-forwarded-for}i)s %(u)s %(M)s '%(r)s' %(s)s %(b)s %({origin}i)s '%(a)s'"
    " ||HOST:%({Host}i)s||"
    "||PATH:%(U)s||"
    "||QUERY_STRING:%(q)s||"
    "||METHOD:%(m)s||"
    "||USER_AGENT:%(a)s||"
    "||IP:%({x-forwarded-for}i)s||"
    "||USER:%(u)s||"
    "||DURATION:%(M)s||"
)

logconfig_dict = LOG_CONFIG
