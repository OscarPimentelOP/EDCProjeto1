import os
import urllib.request

from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from datetime import datetime
from lxml import etree

# Create your views here.
from edc.settings import STATICFILES_DIRS

static_files = STATICFILES_DIRS[0]


def index(request):
    tparams = {
        'title': 'Home Page',
        'year': datetime.now().year,
    }
    return render(request, 'index.html', tparams)


def player(request):
    return render(request, 'player.html')


# News Page
# TODO XSTL TRANSFORMATIONS
# TODO Possibly add a simpler schema, using xpath to find just the data we want
def news(request):
    # News Source(s), Schemas and Parser
    rss_feed = 'https://www.skysports.com/rss/11095'
    rss_schema = etree.XMLSchema(etree.parse(os.path.join(static_files, 'schemas', 'rss.xsd')))
    rss_parser = etree.XMLParser(schema=rss_schema)

    # Loading xml content fetches from the page
    # Validation is done by the parser
    try:
        with urllib.request.urlopen(rss_feed) as url:
            rss_xml = etree.fromstring(url.read(), rss_parser)
    except etree.XMLSyntaxError:
        print("Schema not valid")

    # TRANSFORM XSTL
    # add proper content to page
    content = {}

    return render(request, 'news.html', content)
