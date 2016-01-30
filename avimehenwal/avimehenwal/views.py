from pyramid.response import Response
from pyramid.view import view_config

from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    MyModel,
    BlogRecordService,
    )


@view_config(route_name='home',
    renderer='avimehenwal:templates/index.jinja2')
def my_view(request):
    page = int(request.params.get('page', 1))
    paginator = BlogRecordService.get_paginator(request, page)
    return {'paginator': paginator}

@view_config(route_name='blog_action',
    match_param='action=create',
    renderer='avimehenwal:templates/edit_blog.jinja')
def blog_create(request):
    return Response('Create Blog')


@view_config(route_name='blog_action',
    match_param='action=edit',
    renderer='avimehenwal:templates/edit_blog.jinja')
def blog_create(request):
    return Request('Edit Blog') 
