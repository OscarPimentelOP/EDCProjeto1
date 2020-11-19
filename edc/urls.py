"""edc URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from edc_app import views

urlpatterns = [
    path('', views.index),
    path('index', views.index),
    path('players', views.players),
    path('players/<int:player_id>', views.player),
    path('news', views.news),
    path('teams', views.teams),
    path('teams/<int:team_id>', views.team),
    path('matches', views.matches),
    path('matches/<int:match_id>', views.match),
    path('matches/<int:match_id>/edit', views.edit_match),
    path('matches/<int:match_id>/delete', views.delete_match),
]
