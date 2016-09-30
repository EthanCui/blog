#__author__ = 'cuihu1'
# -*- coding: utf-8 -*-
import requests

from scrapy.contrib.spiders import CrawlSpider
from lxml import etree
from website.models import Article, Column
from cuihu.wsgi import *

class pkuspider(CrawlSpider):
    name = 'pkuspider'
    allowed_domains = ["poj.org"]
    base_url = 'http://poj.org/'
    solution_urls = {}

    cookie = {"JSESSIONID": "B5F7F2554EAE2FB31663C7B44590E90A"}
    urls = ["http://poj.org/status?result=0&user_id=574394335",
            "http://poj.org/status?user_id=574394335&result=0&top=4024039",
            "http://poj.org/status?user_id=574394335&result=0&top=3907253",
            "http://poj.org/status?user_id=574394335&result=0&top=3792901",
            "http://poj.org/status?user_id=574394335&result=0&top=3725422",
            "http://poj.org/status?user_id=574394335&result=0&top=3340696",
            "http://poj.org/status?user_id=574394335&result=0&top=3189535",
            ]

    for url in urls:
        print url
        html = requests.get(url, cookies=cookie).content
        pku_select = etree.HTML(html)

        ids = pku_select.xpath('//a[contains(@href, "problem?id")]/@href')
        sources = pku_select.xpath('//a[contains(@href, "showsource")]/@href')
        print len(ids)
        print len(sources)

        i = 0
        for id in ids:
            if id not in solution_urls:
                solution_urls[id] = sources[i]
            i += 1

        print len(solution_urls)

    c = Column.objects.get_or_create(name='acm_pku', slug='acm_pku')[0]

    for id in solution_urls.keys():
        html = requests.get(base_url + solution_urls[id], cookies=cookie).content
        pku_select = etree.HTML(html)

        source_code = pku_select.xpath('//pre')[0].text
        source_code = '<pre>' + source_code + '</pre>'
        print 'start saving articles......'

        article = Article.objects.get_or_create(
                title = "pku acm problem " + id.split('=')[1],
                slug = id,
                content = source_code
            )[0]

        article.column.add(c)


