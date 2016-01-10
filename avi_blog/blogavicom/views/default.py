from pyramid.view import view_config
from ..models.services.blog_record import BlogRecordService


@view_config(route_name='home',
    renderer='blog.avi.com:templates/index.jinja2')
def index_page(request):
    return {}

@view_config(route_name='auth', match_param='action=in', renderer='string',
             request_method='POST')
@view_config(route_name='auth', match_param='action=out', renderer='string')
def sign_in_out(request):
    return {}
